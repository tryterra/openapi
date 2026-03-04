import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

@service(#{
  title: "Terra Workouts + Planned Workouts API",
})
@server("https://access.tryterra.co/api/v2", "Production server")
@useAuth([ApiKeyAuth<ApiKeyLocation.header, "x-api-key">, ApiKeyAuth<ApiKeyLocation.header, "dev-id">])
namespace Terra.Workouts;

/** Common headers required for all Terra API requests */
model TerraHeaders {
  @header("dev-id")
  devId: string;

  @header("x-api-key")
  apiKey: string;
}

// ===== ENUMS =====

/** Sport type for the workout. Use the `environment` field on the template for indoor/outdoor/pool distinction. */
enum SportType {
  running: "running",
  cycling: "cycling",
  swimming: "swimming",
  strength: "strength",
  rowing: "rowing",
  yoga: "yoga",
  pilates: "pilates",
  cardio: "cardio",
}

/** Environment type for the workout (indoor/outdoor/pool) */
enum EnvironmentType {
  indoor: "indoor",
  outdoor: "outdoor",
  pool: "pool",
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
  recovery: "recovery",
  cooldown: "cooldown",
}

/** Target type for intensity */
enum TargetType {
  /** No specific target */
  open: "open",

  /** Absolute speed in m/s (range: value_low/value_high) */
  speed: "speed",
  /** Pace in min/km (range: value_low/value_high) */
  pace: "pace",

  /** Absolute heart rate in BPM (range: value_low/value_high) */
  heart_rate: "heart_rate",
  /** Percentage of max HR (range: value_low/value_high). Requires max_heart_rate in plan request. */
  heart_rate_max_percentage: "heart_rate_max_percentage",
  /** Percentage of threshold HR (range: value_low/value_high). Requires threshold_heart_rate in plan request. */
  heart_rate_threshold_percentage: "heart_rate_threshold_percentage",
  /** Heart rate zone 1-5 (exact: value) */
  heart_rate_zone: "heart_rate_zone",
  /** Lap-based HR target (range: value_low/value_high) */
  heart_rate_lap: "heart_rate_lap",

  /** Absolute power in watts (range: value_low/value_high) */
  power: "power",
  /** Percentage of FTP (range: value_low/value_high). Requires ftp in plan request. */
  power_percentage: "power_percentage",
  /** Power zone 1-7 (exact: value) */
  power_zone: "power_zone",

  /** Cadence in RPM or SPM (range or exact) */
  cadence: "cadence",
  /** Rate of perceived exertion 1-10 (exact: value) */
  rpe: "rpe",

  /** Percentage of threshold speed (range: value_low/value_high). Requires threshold_speed in plan request. */
  speed_percentage: "speed_percentage",

  /** Lap-based speed target (range: value_low/value_high) */
  speed_lap: "speed_lap",

  /** Swimming stroke type - no numeric value needed */
  swim_stroke: "swim_stroke",

  /** Repetition count (exact: value) */
  repetition: "repetition",

  /** Training Stress Score (exact: value) */
  tss: "tss",
  /** Intensity Factor (exact: value) */
  `if`: "if",
}

/** Weight unit */
enum WeightUnit {
  kg: "kg",
  lbs: "lbs",
}

/** Swimming stroke values */
enum SwimStroke {
  freestyle: "freestyle",
  backstroke: "backstroke",
  breaststroke: "breaststroke",
  butterfly: "butterfly",
  mixed: "mixed",
  drill: "drill",
  im: "im",
}

/** Swimming drill type */
enum DrillType {
  kick: "kick",
  pull: "pull",
  drill: "drill",
}

/** Swimming equipment values */
enum SwimEquipment {
  none: "none",
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

/**
 * Intensity target for a workout step.
 *
 * **Important**: Use EITHER `value` (exact target) OR `value_low`/`value_high` (range target), never both.
 *
 * - **No value targets**: `open` — no fields needed
 * - **Exact value targets**: `repetition`, `rpe`, `heart_rate_zone`, `power_zone`, `tss`, `if`, `swim_stroke` — use `value` only
 * - **Range targets**: `speed`, `pace`, `heart_rate`, `power`, `cadence`, all `*_percentage`, `*_lap` — use `value_low` and/or `value_high`
 *
 * Specifying both `value` and `value_low`/`value_high` will return a 400 error.
 */
@example(#{target_type: TargetType.heart_rate, value_low: 140, value_high: 160}, #{ title: "Heart rate zone (range)" })
@example(#{target_type: TargetType.rpe, value: 7}, #{ title: "RPE (exact value)" })
@example(#{target_type: TargetType.open}, #{ title: "Open target (no value)" })
model IntensityTarget {
  /** Type of target */
  target_type: TargetType;

  /**
   * Exact value target. Use for target types that take a single value (e.g., rpe, zone, repetition).
   * Cannot be combined with value_low/value_high.
   */
  @minValue(0)
  value?: float32;

  /**
   * Low end of target range. Use for target types that take a range (e.g., speed, heart_rate, power).
   * Cannot be combined with value.
   */
  @minValue(0)
  value_low?: float32;

  /**
   * High end of target range. Use for target types that take a range.
   * Cannot be combined with value. Must be greater than value_low if both are provided.
   */
  @minValue(0)
  value_high?: float32;
}

/** Strength data attached to a step (only valid when sport is strength) */
model StrengthData {
  /** Name of exercise shown to the athlete */
  exercise_name?: string;

  /** Load used for the exercise */
  @minValue(0)
  weight?: float32;

  /** Display unit for weight */
  weight_display_unit?: WeightUnit;
}

/** Swimming data attached to a step (only valid when using swimming sport type) */
model SwimmingStepData {
  /** Swim stroke focus */
  stroke?: SwimStroke;

  /** Drill type (when stroke is drill) */
  drill_type?: DrillType;

  /** Optional swim equipment */
  equipment?: SwimEquipment;
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

  /** Optional strength payload (strength sport only) */
  strength?: StrengthData;

  /** Optional swimming payload (swimming sport only) */
  swimming?: SwimmingStepData;
}

/** A block of steps that can repeat */
model StepBlock {
  /** Steps within this block */
  steps: WorkoutStep[];

  /**
   * Completion condition for the block (controls repeats).
   *
   * Examples:
   * - `{ "type": "reps", "value": 4 }` - Repeat block 4 times
   * - `{ "type": "time", "value": 1200 }` - Repeat until 20 minutes total
   * - `{ "type": "distance", "value": 5000 }` - Repeat until 5km total
   * - `{ "type": "open" }` - No repeat (single execution)
   *
   * If omitted, the block executes once (no repeat).
   */
  completion_condition?: CompletionCondition;
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

  /** Indoor/outdoor/pool environment */
  environment?: EnvironmentType;

  /** For lap_swimming: pool length in meters (can be overridden at scheduling time) */
  @minValue(0)
  pool_length_meters?: float32;

  /** Estimated total duration in seconds (read-only, populated on retrieval) */
  estimated_duration_seconds?: float32;

  /** Estimated total distance in meters (read-only, populated on retrieval) */
  estimated_distance_meters?: float32;

  /** Estimated total calories (read-only, populated on retrieval) */
  estimated_calories?: float32;
}

/** Coercion warning returned when workout features cannot be fully represented */
model CoercionWarning {
  /** JSON path to the field that was coerced (e.g., "step_blocks[0].steps[0].intensity_targets") */
  path: string;

  /** Human-readable warning message describing what was coerced */
  message: string;
}

// ===== REQUEST/RESPONSE MODELS =====

/** Request to create a workout template */
model CreateWorkoutTemplateRequest is WorkoutTemplate {}

/** Response from creating a workout template */
model CreateWorkoutTemplateResponse {
  status: "success";
  workout_id: string;
}

/** Workout template with its ID (returned by GET endpoints) */
model WorkoutTemplateWithId is WorkoutTemplate {
  /** Unique identifier for this workout template */
  workout_id: string;
}

/** Response from listing workout templates */
model ListWorkoutTemplatesResponse is Array<WorkoutTemplateWithId> {}

/** Response from deleting a workout template */
model DeleteWorkoutTemplateResponse {
  status: "success";
}

/** Request body to plan (schedule) a workout for an athlete */
model PlanWorkoutRequest {
  /** Planned/scheduled date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date: string;

  /**
   * User's threshold heart rate in BPM.
   * Used to resolve heart_rate_threshold_percentage targets when the device doesn't support native percentages.
   */
  @minValue(0)
  threshold_heart_rate?: float32;

  /**
   * User's maximum heart rate in BPM.
   * Used to resolve heart_rate_max_percentage targets when the device doesn't support native percentages.
   */
  @minValue(0)
  max_heart_rate?: float32;

  /**
   * User's threshold speed in m/s.
   * Used to resolve speed_percentage targets when the device doesn't support native percentages.
   */
  @minValue(0)
  threshold_speed?: float32;

  /**
   * User's functional threshold power in watts.
   * Used to resolve power_percentage targets when the device doesn't support native percentages.
   */
  @minValue(0)
  ftp?: float32;

  /**
   * Pool length in meters (overrides template value for lap swimming workouts).
   * If not provided, uses the value from the workout template.
   */
  @minValue(0)
  pool_length_meters?: float32;
}

/** Response from planning a workout */
model PlanWorkoutResponse {
  status: "success";
  planned_workout_id: string;
  provider_workout_id?: string;
  coercion_warnings?: CoercionWarning[];
}

/** Request to update a planned workout */
model UpdatePlannedWorkoutRequest {
  /** New planned date in YYYY-MM-DD format */
  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date: string;
}

/** Response from updating a planned workout */
model UpdatePlannedWorkoutResponse {
  status: "success";
  planned_workout_id?: string;
  coercion_warnings?: CoercionWarning[];
}

/** Individual planned workout in list/get response */
model PlannedWorkout {
  planned_workout_id: string;
  workout_id?: string;

  @pattern("^\\d{4}-\\d{2}-\\d{2}$")
  planned_date: string;

  provider_workout_id?: string;
  coercion_warnings?: CoercionWarning[];
  is_external: boolean;
  created_at: string;
  last_updated_at: string;
}

/** Response from listing planned workouts */
model ListPlannedWorkoutsResponse {
  planned_workouts: PlannedWorkout[];
}

// ===== API ENDPOINTS =====

/** Workout Templates */
@route("/workouts")
namespace Workouts {
  /**
   * Create a workout template
   *
   * POST /workouts
   */
  @post
  @route("")
  op createWorkoutTemplate(
    ...TerraHeaders,
    @body body: CreateWorkoutTemplateRequest
  ): {
    @statusCode statusCode: 200;
    @body body: CreateWorkoutTemplateResponse;
  } | {
    @statusCode statusCode: 400;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * List all workout templates
   *
   * GET /workouts
   */
  @get
  @route("")
  op listWorkoutTemplates(
    ...TerraHeaders,
  ): ListWorkoutTemplatesResponse | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Get a workout template by ID
   *
   * GET /workouts/{workout_id}
   */
  @get
  @route("/{workout_id}")
  op getWorkoutTemplate(
    ...TerraHeaders,
    @path workout_id: string,
  ): WorkoutTemplateWithId | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Delete a workout template
   *
   * DELETE /workouts/{workout_id}
   */
  @delete
  @route("/{workout_id}")
  op deleteWorkoutTemplate(
    ...TerraHeaders,
    @path workout_id: string,
  ): DeleteWorkoutTemplateResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Plan (schedule) a workout for an athlete
   *
   * POST /workouts/{workout_id}/plan?user_id=USER_ID
   */
  @post
  @route("/{workout_id}/plan")
  op planWorkout(
    ...TerraHeaders,
    @path workout_id: string,
    @query user_id: string,
    @body body: PlanWorkoutRequest
  ): {
    @statusCode statusCode: 201;
    @body body: PlanWorkoutResponse;
  } | {
    @statusCode statusCode: 400;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 424;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };
}

/** Planned Workouts */
@route("/plannedWorkouts")
namespace PlannedWorkouts {
  /**
   * List planned workouts
   *
   * GET /plannedWorkouts?user_id=USER_ID&start_date=YYYY-MM-DD&end_date=YYYY-MM-DD
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
   * Get a planned workout by ID
   *
   * GET /plannedWorkouts/{planned_workout_id}
   */
  @get
  @route("/{planned_workout_id}")
  op getPlannedWorkout(
    ...TerraHeaders,
    @path planned_workout_id: string
  ): PlannedWorkout | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Update a planned workout
   *
   * PATCH /plannedWorkouts/{planned_workout_id}?user_id=USER_ID
   */
  @patch
  @route("/{planned_workout_id}")
  op updatePlannedWorkout(
    ...TerraHeaders,
    @path planned_workout_id: string,
    @query user_id: string,
    @body body: UpdatePlannedWorkoutRequest
  ): UpdatePlannedWorkoutResponse | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 424;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };

  /**
   * Delete a planned workout
   *
   * DELETE /plannedWorkouts/{planned_workout_id}?user_id=USER_ID
   */
  @delete
  @route("/{planned_workout_id}")
  op deletePlannedWorkout(
    ...TerraHeaders,
    @path planned_workout_id: string,
    @query user_id: string
  ): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
    @body error: { detail: string };
  } | {
    @statusCode statusCode: 500;
    @body error: { detail: string };
  };
}
