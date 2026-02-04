import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

@service(#{
  title: "Terra Planned Workouts API",
})
@server("https://api.tryterra.co", "Production server")
namespace Terra.PlannedWorkouts;

/** Common headers required for all Terra API requests */
model TerraHeaders {
  @header("dev-id")
  devId: string;

  @header("x-api-key")
  apiKey: string;
}

// ===== ENUMS =====

/** Sport/activity type for the workout */
enum SportType {
  /** Outdoor running */
  running: "running",

  /** Treadmill running */
  treadmill_running: "treadmill_running",

  /** Outdoor cycling */
  biking: "biking",

  /** Indoor cycling/stationary bike */
  stationary_biking: "stationary_biking",

  /** Open water swimming */
  swimming: "swimming",

  /** Pool swimming */
  lap_swimming: "lap_swimming",

  /** Strength/weight training */
  strength_training: "strength_training",
}

/** Completion condition type - how a step ends */
enum CompletionConditionType {
  /** Duration-based (seconds) */
  time: "time",

  /** Distance-based (meters) */
  distance: "distance",

  /** Calorie-based (kcal) */
  calories: "calories",

  /** Repetition-based (count) */
  reps: "reps",

  /** Manual lap button press */
  open: "open",

  /** Continue until HR drops below value (BPM) */
  hr_less_than: "hr_less_than",

  /** Continue until HR rises above value (BPM) */
  hr_greater_than: "hr_greater_than",

  /** Continue until power drops below value (watts) */
  power_less_than: "power_less_than",

  /** Continue until power rises above value (watts) */
  power_greater_than: "power_greater_than",
}

/** Intensity type for a workout step */
enum IntensityType {
  /** Warm-up phase */
  warmup: "warmup",

  /** Active/work phase */
  active: "active",

  /** Rest phase */
  rest: "rest",

  /** Cool-down phase */
  cooldown: "cooldown",

  /** Recovery phase */
  recovery: "recovery",

  /** Interval phase */
  interval: "interval",
}

/** Target type for intensity */
enum TargetType {
  /** Absolute heart rate (BPM) */
  heart_rate: "heart_rate",

  /** HR as percentage of max (0-100) */
  heart_rate_max_percentage: "heart_rate_max_percentage",

  /** HR as percentage of threshold (0-100) */
  heart_rate_threshold_percentage: "heart_rate_threshold_percentage",

  /** Direct HR zone (1-5) */
  heart_rate_zone: "heart_rate_zone",

  /** Absolute power (watts) */
  power: "power",

  /** Power as percentage of FTP (0-100) */
  power_percentage: "power_percentage",

  /** Direct power zone (1-7) */
  power_zone: "power_zone",

  /** Speed (m/s) */
  speed: "speed",

  /** Pace (sec/km) */
  pace: "pace",

  /** Cadence (RPM or steps/min) */
  cadence: "cadence",

  /** Rate of perceived exertion (1-10 scale) */
  rpe: "rpe",

  /** No target */
  open: "open",
}

/** Weight unit */
enum WeightUnit {
  /** Kilograms */
  kg: "kg",

  /** Pounds */
  lbs: "lbs",
}

// ===== MODELS =====

/** Completion condition defining how a step ends */
model CompletionCondition {
  /** Type of completion condition */
  type: CompletionConditionType;

  /** Value for the completion condition (e.g., 1800 seconds, 5000 meters, 10 reps) */
  @minValue(0)
  value?: float32;

  /**
   * Optional range-based completion.
   * For lap_swimming: laps is the target number of pool laps
   */
  @minValue(1)
  laps?: int32;
}

/** Intensity target for a workout step */
model IntensityTarget {
  /** Type of target */
  target_type: TargetType;

  /** Single value target (used when range not provided) */
  @minValue(0)
  value?: float32;

  /** Low end of target range */
  @minValue(0)
  value_low?: float32;

  /** High end of target range */
  @minValue(0)
  value_high?: float32;

  /** Zone number (for zone-based targets: HR zones 1-5, power zones 1-7) */
  @minValue(1)
  @maxValue(7)
  zone?: int32;
}

/** A single workout step within a step block */
model WorkoutStep {
  /** Intensity type for this step */
  intensity_type: IntensityType;

  /** How this step completes */
  completion_condition: CompletionCondition;

  /** Target intensities for this step (heart rate, power, pace, etc.) */
  intensity_targets?: IntensityTarget[];

  /** Optional description/notes for this step */
  description?: string;

  /** For strength training: weight value */
  @minValue(0)
  weight?: float32;

  /** For strength training: weight unit */
  weight_unit?: WeightUnit;
}

/** A block of steps that can repeat */
model StepBlock {
  /** Steps within this block */
  steps: WorkoutStep[];

  /** Number of times to repeat this block (default: 1) */
  @minValue(1)
  repeat_times?: int32;

  /** Optional name for this block */
  name?: string;
}

/** Complete workout template */
model WorkoutTemplate {
  /** Workout name/title */
  name: string;

  /** Sport/activity type */
  sport: SportType;

  /** Blocks of steps that make up the workout */
  step_blocks: StepBlock[];

  /** Optional workout description */
  description?: string;

  /** Optional estimated duration in seconds */
  @minValue(0)
  estimated_duration?: int32;

  /** Optional estimated distance in meters */
  @minValue(0)
  estimated_distance?: float32;

  // Header fields for percentage-based target conversion

  /** Threshold heart rate in BPM (required for heart_rate_threshold_percentage targets) */
  @minValue(0)
  threshold_heart_rate?: float32;

  /** Maximum heart rate in BPM (required for heart_rate_max_percentage targets) */
  @minValue(0)
  max_heart_rate?: float32;

  /** Threshold speed in m/s (required for speed percentage targets) */
  @minValue(0)
  threshold_speed?: float32;

  /** Functional Threshold Power in watts (required for power_percentage targets) */
  @minValue(0)
  ftp?: float32;

  /** For lap_swimming: pool length in meters */
  @minValue(0)
  pool_length?: float32;
}

/** Coercion warning returned when workout features cannot be fully represented */
model CoercionWarning {
  /** Human-readable warning message describing what was coerced */
  message: string;
}

// ===== REQUEST/RESPONSE MODELS =====

/** Request to create a planned workout */
model CreatePlannedWorkoutRequest {
  /** Terra connection ID */
  connection_id: int64;

  /** Workout template to push to the provider */
  workout: WorkoutTemplate;

  /** Planned/scheduled date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date?: string;

  /** Optional provider-specific metadata */
  metadata?: Record<string>;
}

/** Response from creating a planned workout */
model CreatePlannedWorkoutResponse {
  /** Status of the operation */
  status: "success" | "error";

  /** Terra's internal planned workout ID */
  planned_workout_id?: int64;

  /** Provider's workout ID (if applicable) */
  provider_workout_id?: string;

  /** Warnings about workout features that were coerced or modified */
  coercion_warnings?: CoercionWarning[];

  /** Error message if status is "error" */
  error?: string;
}

/** Request to update a planned workout */
model UpdatePlannedWorkoutRequest {
  /** Updated workout template (optional - if not provided, only date is updated) */
  workout?: WorkoutTemplate;

  /** New planned date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date?: string;
}

/** Response from updating a planned workout */
model UpdatePlannedWorkoutResponse {
  /** Status of the operation */
  status: "success" | "error";

  /** Terra's internal planned workout ID */
  planned_workout_id?: int64;

  /** Warnings about workout features that were coerced or modified */
  coercion_warnings?: CoercionWarning[];

  /** Error message if status is "error" */
  error?: string;
}

/** Response from deleting a planned workout */
model DeletePlannedWorkoutResponse {
  /** Status of the operation */
  status: "success" | "error";

  /** Error message if status is "error" */
  error?: string;
}

/** Individual planned workout in list response */
model PlannedWorkout {
  /** Terra's internal planned workout ID */
  planned_workout_id: int64;

  /** Terra connection ID */
  connection_id: int64;

  /** Provider's workout ID (if applicable) */
  provider_workout_id?: string;

  /** Planned/scheduled date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date?: string;

  /** Date workout was created in ISO 8601 format */
  created_date: string;

  /** Date workout was last updated in ISO 8601 format */
  updated_date?: string;

  /** Provider name (e.g., "GARMIN", "HUAWEI") */
  provider_name: string;

  /** The workout template (if available) */
  workout?: WorkoutTemplate;
}

/** Response from getting planned workouts */
model GetPlannedWorkoutsResponse {
  /** List of planned workouts */
  planned_workouts: PlannedWorkout[];
}

// ===== API ENDPOINTS =====

@route("/v2/workouts/planned")
namespace PlannedWorkouts {
  /**
   * Create a new planned workout
   *
   * Pushes a workout template to a connected fitness provider. The workout
   * will appear on the user's device as a structured workout plan.
   *
   * **Important Notes:**
   * - Provider support varies (e.g., Garmin supports full features, Huawei only running)
   * - Check `coercion_warnings` in response for unsupported features
   * - Percentage-based targets require header fields (max_heart_rate, ftp, etc.)
   *
   * @param headers Terra authentication headers
   * @param body Workout creation request
   * @returns Created workout response with warnings
   */
  @post
  @route("")
  op createPlannedWorkout(
    ...TerraHeaders,
    @body body: CreatePlannedWorkoutRequest
  ): CreatePlannedWorkoutResponse | {
    @statusCode statusCode: 400;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Update an existing planned workout
   *
   * Updates the workout template and/or scheduled date. Provider support
   * for updates varies.
   *
   * @param headers Terra authentication headers
   * @param plannedWorkoutId Terra's internal planned workout ID
   * @param body Update request with new workout/date
   * @returns Update response with warnings
   */
  @put
  @route("/{plannedWorkoutId}")
  op updatePlannedWorkout(
    ...TerraHeaders,
    @path plannedWorkoutId: int64,
    @body body: UpdatePlannedWorkoutRequest
  ): UpdatePlannedWorkoutResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Delete a planned workout
   *
   * Removes the workout from both the provider and Terra's database.
   *
   * @param headers Terra authentication headers
   * @param plannedWorkoutId Terra's internal planned workout ID
   * @returns Deletion response
   */
  @delete
  @route("/{plannedWorkoutId}")
  op deletePlannedWorkout(
    ...TerraHeaders,
    @path plannedWorkoutId: int64
  ): DeletePlannedWorkoutResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Get planned workouts for a connection
   *
   * Returns planned workouts from Terra's database. Note that some providers
   * (like Huawei) don't support retrieving workouts, so this may only return
   * workouts that were previously pushed through Terra.
   *
   * @param headers Terra authentication headers
   * @param connectionId Terra connection ID
   * @param startDate Optional start date filter (YYYY-MM-DD)
   * @param endDate Optional end date filter (YYYY-MM-DD)
   * @returns List of planned workouts
   */
  @get
  @route("")
  op getPlannedWorkouts(
    ...TerraHeaders,
    @query connection_id: int64,
    @query start_date?: string,
    @query end_date?: string
  ): GetPlannedWorkoutsResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };
}

/**
 * USAGE EXAMPLES
 *
 * Example 1: Simple running workout with heart rate zones
 * ```json
 * {
 *   "connection_id": 12345,
 *   "planned_date": "2026-02-10",
 *   "workout": {
 *     "name": "Easy Run",
 *     "sport": "running",
 *     "max_heart_rate": 190,
 *     "step_blocks": [{
 *       "steps": [
 *         {
 *           "intensity_type": "warmup",
 *           "completion_condition": {"type": "time", "value": 300},
 *           "intensity_targets": [{
 *             "target_type": "heart_rate_max_percentage",
 *             "value_low": 60,
 *             "value_high": 70
 *           }]
 *         },
 *         {
 *           "intensity_type": "active",
 *           "completion_condition": {"type": "distance", "value": 5000},
 *           "intensity_targets": [{
 *             "target_type": "heart_rate",
 *             "value_low": 140,
 *             "value_high": 160
 *           }]
 *         },
 *         {
 *           "intensity_type": "cooldown",
 *           "completion_condition": {"type": "time", "value": 300},
 *           "intensity_targets": [{"target_type": "open"}]
 *         }
 *       ]
 *     }]
 *   }
 * }
 * ```
 *
 * Example 2: Interval workout with repeating blocks
 * ```json
 * {
 *   "connection_id": 12345,
 *   "planned_date": "2026-02-12",
 *   "workout": {
 *     "name": "5x1000m Intervals",
 *     "sport": "running",
 *     "ftp": 250,
 *     "step_blocks": [
 *       {
 *         "steps": [{
 *           "intensity_type": "warmup",
 *           "completion_condition": {"type": "time", "value": 600}
 *         }]
 *       },
 *       {
 *         "repeat_times": 5,
 *         "steps": [
 *           {
 *             "intensity_type": "active",
 *             "completion_condition": {"type": "distance", "value": 1000},
 *             "intensity_targets": [{
 *               "target_type": "pace",
 *               "value_low": 240,
 *               "value_high": 250
 *             }]
 *           },
 *           {
 *             "intensity_type": "recovery",
 *             "completion_condition": {"type": "time", "value": 120}
 *           }
 *         ]
 *       },
 *       {
 *         "steps": [{
 *           "intensity_type": "cooldown",
 *           "completion_condition": {"type": "time", "value": 600}
 *         }]
 *       }
 *     ]
 *   }
 * }
 * ```
 *
 * Example 3: Pool swimming workout
 * ```json
 * {
 *   "connection_id": 12345,
 *   "planned_date": "2026-02-15",
 *   "workout": {
 *     "name": "Swim Intervals",
 *     "sport": "lap_swimming",
 *     "pool_length": 25,
 *     "step_blocks": [{
 *       "repeat_times": 8,
 *       "steps": [{
 *         "intensity_type": "active",
 *         "completion_condition": {"type": "distance", "value": 100, "laps": 4}
 *       }]
 *     }]
 *   }
 * }
 * ```
 */

/**
 * PROVIDER-SPECIFIC NOTES
 *
 * **Garmin:**
 * - Full support for all sport types and targets
 * - Supports power, HR zones, pace, speed, cadence
 * - Supports scheduled dates
 * - Supports workout retrieval
 *
 * **Huawei:**
 * - Running/treadmill only (other sports coerced to running)
 * - Supports HR, pace, speed, cadence targets
 * - No scheduled dates (templates only)
 * - No workout retrieval from provider
 * - Regional endpoints (auto-discovered during auth)
 *
 * **Suunto:**
 * - Multi-sport support
 * - Supports HR and power targets
 * - No cadence targets
 *
 * **Wahoo:**
 * - Cycling and running support
 * - Full power/HR zone support
 *
 * **COROS:**
 * - Multi-sport support
 * - Full target support including pace/power
 */
