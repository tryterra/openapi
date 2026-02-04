import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

@service(#{
  title: "Terra Workouts + Planned Workouts API",
})
@server("https://api.tryterra.co", "Production server")
namespace Terra.Workouts;

/** Common headers required for all Terra API requests */
model TerraHeaders {
  @header("dev-id")
  devId: string;

  @header("x-api-key")
  apiKey: string;
}

// ===== ENUMS =====

/** Sport/activity type for the workout (lowercase string enums only) */
enum SportType {
  running: "running",
  treadmill_running: "treadmill_running",
  biking: "biking",
  stationary_biking: "stationary_biking",
  swimming: "swimming",
  lap_swimming: "lap_swimming",
  open_water_swimming: "open_water_swimming",
  strength_training: "strength_training",
}

/** Completion condition type - how a step ends */
enum CompletionConditionType {
  time: "time",
  distance: "distance",
  calories: "calories",
  reps: "reps",
  open: "open",
  hr_less_than: "hr_less_than",
  hr_greater_than: "hr_greater_than",
  power_less_than: "power_less_than",
  power_greater_than: "power_greater_than",
}

/** Intensity type for a workout step */
enum IntensityType {
  warmup: "warmup",
  active: "active",
  rest: "rest",
  cooldown: "cooldown",
}

/** Target type for intensity */
enum TargetType {
  open: "open",

  speed: "speed",
  pace: "pace",

  heart_rate: "heart_rate",
  heart_rate_max_percentage: "heart_rate_max_percentage",
  heart_rate_threshold_percentage: "heart_rate_threshold_percentage",
  heart_rate_zone: "heart_rate_zone",
  heart_rate_lap: "heart_rate_lap",

  power: "power",
  power_percentage: "power_percentage",
  power_zone: "power_zone",

  cadence: "cadence",
  rpe: "rpe",

  // Percent of threshold speed
  speed_percentage: "speed_percentage",

  // Swimming-specific targets
  swim_stroke: "swim_stroke",
  speed_lap: "speed_lap",

  // Strength / other provider targets
  repetition: "repetition",

  // TrainingPeaks-style targets
  tss: "tss",
  if: "if",
}

/** Weight unit */
enum WeightUnit {
  kg: "kg",
  lbs: "lbs",
}

/** Swimming stroke values (lowercase string enums only) */
enum SwimStroke {
  freestyle: "freestyle",
  backstroke: "backstroke",
  breaststroke: "breaststroke",
  butterfly: "butterfly",
  mixed: "mixed",
  drill: "drill",
}

/** Swimming equipment values (lowercase string enums only) */
enum SwimEquipment {
  kickboard: "kickboard",
  paddles: "paddles",
  pull_buoy: "pull_buoy",
  fins: "fins",
  snorkel: "snorkel",
}

// ===== MODELS =====

/** Completion condition defining how a step ends */
model CompletionCondition {
  /** Type of completion condition */
  type: CompletionConditionType;

  /** Value for the completion condition (e.g., 1800 seconds, 5000 meters, 10 reps) */
  @minValue(0)
  value?: float32;
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

  /** Zone number (HR zones 1-5, power zones 1-7, Garmin only) */
  @minValue(1)
  @maxValue(7)
  zone?: int32;
}

/** Strength data attached to a step (only valid when sport is strength_training) */
model StrengthData {
  /** Name of exercise shown to the athlete */
  exercise_name: string;

  /** Load used for the exercise */
  @minValue(0)
  weight?: float32;

  /** Display unit for weight */
  weight_display_unit?: WeightUnit;

  /** Number of reps per set (optional, may duplicate completion_condition value) */
  @minValue(0)
  reps?: int32;
}

/** Swimming data attached to a step (only valid when using swimming sport types) */
model SwimmingData {
  /** Swim stroke focus */
  stroke?: SwimStroke;

  /** Optional swim equipment */
  equipment?: SwimEquipment[];
}

/** A single workout step within a step block */
model WorkoutStep {
  /** How this step completes */
  completion_condition: CompletionCondition;

  /** Intensity type for this step */
  intensity_type: IntensityType;

  /** Target intensities for this step (heart rate, power, pace, etc.) */
  intensity_targets?: IntensityTarget[];

  /** Optional notes shown to the athlete */
  notes?: string;

  /** Optional strength payload (strength_training only) */
  strength?: StrengthData;

  /** Optional swimming payload (swimming sport types only) */
  swimming?: SwimmingData;
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

  // Header fields for percentage-based target conversion

  /** Threshold heart rate in BPM (used for heart_rate_threshold_percentage) */
  @minValue(0)
  threshold_heart_rate?: float32;

  /** Max heart rate in BPM (used for heart_rate_max_percentage) */
  @minValue(0)
  max_heart_rate?: float32;

  /** Threshold speed in m/s (used for speed_percentage) */
  @minValue(0)
  threshold_speed?: float32;

  /** Functional threshold power in watts (used for power_percentage) */
  @minValue(0)
  functional_threshold_power?: float32;

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

/** Request to create a workout template */
model CreateWorkoutTemplateRequest is WorkoutTemplate {}

/** Response from creating a workout template */
model CreateWorkoutTemplateResponse {
  status: "success" | "error";
  workout_id?: string;
  error?: string;
}

/** Request to create (schedule) a planned workout */
model CreatePlannedWorkoutRequest {
  /** ID of an existing workout template */
  workout_id: string;

  /** Planned/scheduled date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date: string;
}

/** Response from creating a planned workout */
model CreatePlannedWorkoutResponse {
  status: "success" | "error";
  planned_workout_id?: string;
  coercion_warnings?: CoercionWarning[];
  error?: string;
}

/** Request to update a planned workout */
model UpdatePlannedWorkoutRequest {
  /** New planned date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date?: string;
}

/** Response from updating a planned workout */
model UpdatePlannedWorkoutResponse {
  status: "success" | "error";
  planned_workout_id?: string;
  coercion_warnings?: CoercionWarning[];
  error?: string;
}

/** Response from deleting a planned workout */
model DeletePlannedWorkoutResponse {
  status: "success" | "error";
  error?: string;
}

/** Individual planned workout in list response */
model PlannedWorkout {
  planned_workout_id: string;
  workout_id: string;

  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date: string;

  created_date?: string;
  updated_date?: string;
}

/** Response from listing planned workouts */
model ListPlannedWorkoutsResponse {
  planned_workouts: PlannedWorkout[];
}

// ===== API ENDPOINTS =====

/** Workout Templates */
@route("/v2/workouts")
namespace Workouts {
  /**
   * Create a workout template
   *
   * POST /v2/workouts
   */
  @post
  @route("")
  op createWorkoutTemplate(
    ...TerraHeaders,
    @body body: CreateWorkoutTemplateRequest
  ): CreateWorkoutTemplateResponse | {
    @statusCode statusCode: 400;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };
}

/** Planned Workouts */
@route("/v2/plannedWorkouts")
namespace PlannedWorkouts {
  /**
   * Create (schedule) a planned workout
   *
   * POST /v2/plannedWorkouts?user_id=USER_ID
   */
  @post
  @route("")
  op createPlannedWorkout(
    ...TerraHeaders,
    @query user_id: string,
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
   * List planned workouts
   *
   * GET /v2/plannedWorkouts?user_id=USER_ID&start_date=YYYY-MM-DD&end_date=YYYY-MM-DD
   */
  @get
  @route("")
  op listPlannedWorkouts(
    ...TerraHeaders,
    @query user_id: string,
    @query start_date?: string,
    @query end_date?: string
  ): ListPlannedWorkoutsResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Update a planned workout
   *
   * PATCH /v2/plannedWorkouts/{ID}?user_id=USER_ID
   */
  @patch
  @route("/{plannedWorkoutId}")
  op updatePlannedWorkout(
    ...TerraHeaders,
    @path plannedWorkoutId: string,
    @query user_id: string,
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
   * DELETE /v2/plannedWorkouts/{ID}?user_id=USER_ID
   */
  @delete
  @route("/{plannedWorkoutId}")
  op deletePlannedWorkout(
    ...TerraHeaders,
    @path plannedWorkoutId: string,
    @query user_id: string
  ): DeletePlannedWorkoutResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };
}
