import "@typespec/json-schema";

using JsonSchema;

@jsonSchema
namespace Schemas;

// Terrauser Model
model TerraUser {
    @minLength(1) user_id: string; // not null
    @minLength(1) provider: string; // not null
    last_webhook_update?: string;
    scopes?: string;
    reference_id?: string;
}
// End of Terrauser Model

// Athlete Model
model Athlete {
    age?: int32;
    country?: string;
    bio?: string;
    state?: string;
    last_name?: string;
    sex?: string;
    city?: string;
    email?: string;
    date_of_birth?: string;
    first_name?: string;
    gender?: string;
    joined_provider?: string;
    devices?: DeviceData[];
}

// End of Athlete Model

// Device Data Model
model DeviceData {
    activation_timestamp?: string;
    data_provided?: DeviceDataType[];
    hardware_version?: string;
    last_upload_date?: string;
    manufacturer?: string;
    name?: string;
    other_devices?: OtherDeviceData[];
    sensor_state?: string;
    serial_number?: string;
    software_version?: string;
}

model OtherDeviceData {
    activation_timestamp?: string;
    data_provided?: DeviceDataType[];
    hardware_version?: string;
    last_upload_date?: string;
    manufacturer?: string;
    name?: string;
    serial_number?: string;
    software_version?: string;
}

// End of Device Data Model

// Activity Model
model Activity {
    active_durations_data?: ActiveDurationsData;
    calories_data?: CaloriesData;
    cheat_detection?: Record<unknown>;
    data_enrichment?: DataEnrichment;
    device_data?: DeviceData;
    distance_data?: DistanceData;
    energy_data?: EnergyData;
    heart_rate_data?: HeartRateData;
    lap_data?: LapData;
    MET_data?: METData;
    metadata: ActivityMetadata;
    movement_data?: MovementData;
    oxygen_data?: OxygenData;
    polyline_map_data?: PolylineMapData;
    position_data?: PositionData;
    power_data?: PowerData;
    strain_data?: StrainData;
    TSS_data?: TSSData;
    work_data?: WorkData;
}

model ActiveDurationsData {
    activity_levels_samples?: Record<unknown>[];
    activity_seconds?: integer;
    inactivity_seconds?: integer;
    low_intensity_seconds?: integer;
    moderate_intensity_seconds?: integer;
    num_continuous_inactive_periods?: integer;
    rest_seconds?: integer;
    standing_hours_count?: integer;
    standing_seconds?: integer;
    vigorous_intensity_seconds?: integer;
}

model CaloriesData {
    BMR_calories?: integer;
    calorie_samples?: Record<unknown>[];
    net_activity_calories?: integer;
    net_intake_calories?: integer;
    total_burned_calories?: integer;
}

model DataEnrichment {
    stress_score?: integer;
}

model DistanceData {
    detailed?: DistanceDataDetailed;
    summary?: DistanceDataSummary;
}

model DistanceDataDetailed {
    distance_samples?: Record<unknown>[];
    elevation_samples?: Record<unknown>[];
    floors_climbed_samples?: Record<unknown>[];
    step_samples?: Record<unknown>[];
}

model DistanceDataSummary {
    distance_meters?: integer;
    elevation?: ElevationData;
    floors_climbed?: integer;
    steps?: integer;
    swimming?: SwimmingData;
}

model ElevationData {
    avg_meters?: integer;
    gain_actual_meters?: integer;
    gain_planned_meters?: integer;
    loss_actual_meters?: integer;
    max_meters?: integer;
    min_meters?: integer;
}

model SwimmingData {
    num_laps?: integer;
    num_strokes?: integer;
    pool_length_meters?: integer;
}

model EnergyData {
    energy_kilojoules?: integer;
    energy_planned_kilojoules?: integer;
}

model HeartRateData {
    detailed?: HeartRateDataDetailed;
    summary?: HeartRateDataSummary;
}

model HeartRateDataDetailed {
    hr_samples?: Record<unknown>[];
    hrv_samples_rmssd?: Record<unknown>[];
    hrv_samples_sdnn?: Record<unknown>[];
}

model HeartRateDataSummary {
    avg_hr_bpm?: integer;
    avg_hrv_rmssd?: integer;
    avg_hrv_sdnn?: integer;
    hr_zone_data?: Record<unknown>[];
    max_hr_bpm?: integer;
    min_hr_bpm?: integer;
    resting_hr_bpm?: integer;
    user_max_hr_bpm?: integer;
}

model LapData {
    laps?: Record<unknown>[];
}

model METData {
    MET_samples?: METSample[];
    avg_level?: integer;
    num_high_intensity_minutes?: integer;
    num_inactive_minutes?: integer;
    num_low_intensity_minutes?: integer;
    num_moderate_intensity_minutes?: integer;
}

model METSample {
    time?: string;
    val?: integer;
}

model ActivityMetadata {
    city?: string;
    country?: string;
    end_time: string;
    name?: string;
    start_time: string;
    state?: string;
    summary_id: string;
    timestamp_localization?: integer; // what is this?
    type: ActivityType;
    upload_type: UploadType;
}

model MovementData {
    adjusted_max_speed_meters_per_second?: float;
    avg_cadence_rpm?: float;
    avg_pace_minutes_per_kilometer?: float;
    avg_speed_meters_per_second?: float;
    avg_torque_newton_meters?: float;
    avg_velocity_meters_per_second?: float;
    cadence_samples?: Record<unknown>[];
    max_cadence_rpm?: float;
    max_pace_minutes_per_kilometer?: float;
    max_speed_meters_per_second?: float;
    max_torque_newton_meters?: float;
    max_velocity_meters_per_second?: float;
    normalized_speed_meters_per_second?: float;
    speed_samples?: Record<unknown>[];
    torque_samples?: Record<unknown>[];
}

model OxygenData {
    avg_saturation_percentage?: float;
    saturation_samples?: Record<unknown>[];
    vo2_samples?: Record<unknown>[];
    vo2max_ml_per_min_per_kg?: float;
}

model PolylineMapData {
    summary_polyline?: string;
}

model PositionData {
    center_pos_lat_lng_deg?: float[];
    end_pos_lat_lng_deg?: float[];
    position_samples?: Record<unknown>[];
    start_pos_lat_lng_deg?: float[];
}

model PowerData {
    avg_watts?: float;
    max_watts?: float;
    power_samples?: Record<unknown>[];
}

model StrainData {
    strain_level?: float;
}

model TSSData {
    TSS_samples?: Record<unknown>[];
}

model WorkData {
    work_kilojoules?: float;
}
// End of Activity Model

@doc("Represents a specific type of physical activity.")
enum ActivityType {
    `In Vehicle`: 0,
    Biking: 1,
    Still: 3,
    Unknown: 4,
    Tilting: 5,
    Walking: 7,
    Running: 8,
    Aerobics: 9,
    Badminton: 10,
    Baseball: 11,
    Basketball: 12,
    Biathlon: 13,
    Handbiking: 14,
    `Mountain Biking`: 15,
    `Road Biking`: 16,
    Spinning: 17,
    `Stationary Biking`: 18,
    `Utility Biking`: 19,
    Boxing: 20,
    Calisthenics: 21,
    `Circuit Training`: 22,
    Cricket: 23,
    Dancing: 24,
    Elliptical: 25,
    Fencing: 26,
    `American Football`: 27,
    `Australian Football`: 28,
    `English Football`: 29,
    Frisbee: 30,
    Gardening: 31,
    Golf: 32,
    Gymnastics: 33,
    Handball: 34,
    Hiking: 35,
    Hockey: 36,
    `Horseback Riding`: 37,
    Housework: 38,
    `Jumping Rope`: 39,
    Kayaking: 40,
    `Kettlebell Training`: 41,
    Kickboxing: 42,
    Kitesurfing: 43,
    `Martial Arts`: 44,
    Meditation: 45,
    `Mixed Martial Arts`: 46,
    `P90X Exercises`: 47,
    Paragliding: 48,
    Pilates: 49,
    Polo: 50,
    Racquetball: 51,
    `Rock Climbing`: 52,
    Rowing: 53,
    `Rowing Machine`: 54,
    Rugby: 55,
    Jogging: 56,
    `Running On Sand`: 57,
    `Treadmill Running`: 58,
    Sailing: 59,
    `Scuba Diving`: 60,
    Skateboarding: 61,
    Skating: 62,
    `Cross Skating`: 63,
    `Indoor Rollerblading`: 64,
    Skiing: 65,
    `Back Country Skiing`: 66,
    `Cross Country Skiing`: 67,
    `Downhill Skiing`: 68,
    `Kite Skiing`: 69,
    `Roller Skiing`: 70,
    Sledding: 71,
    Snowboarding: 73,
    Snowmobile: 74,
    Snowshoeing: 75,
    Squash: 76,
    `Stair Climbing`: 77,
    `Stair Climbing Machine`: 78,
    `Stand Up Paddleboarding`: 79,
    `Strength Training`: 80,
    Surfing: 81,
    Swimming: 82,
    `Swimming In Pool`: 83,
    `Open Water Swimming`: 84,
    `Table Tennis`: 85,
    `Team Sport`: 86,
    Tennis: 87,
    Treadmill: 88,
    Volleyball: 89,
    `Beach Volleyball`: 90,
    `Indoor Volleyball`: 91,
    Wakeboarding: 92,
    `Walking Fitness`: 93,
    `Nording Walking`: 94,
    `Walking Treadmill`: 95,
    Waterpolo: 96,
    Weightlifting: 97,
    Wheelchair: 98,
    Windsurfing: 99,
    Yoga: 100,
    Zumba: 101,
    Diving: 102,
    Ergometer: 103,
    `Ice Skating`: 104,
    `Indoor Skating`: 105,
    Curling: 106,
    Other: 108,
    Crossfit: 113,
    HIIT: 114,
    `Interval Training`: 115,
    `Walkin Stroller`: 116,
    Elevator: 117,
    Escalator: 118,
    Archery: 119,
    Softball: 120,
    `Guided Breathing`: 122,
    `Cardio Training`: 123,
    Lacrosse: 124,
    Stretching: 125,
    Triathlon: 126,
    INLINE_SKATING: 127,
    SKY_DIVING: 128,
    PADDLING: 129,
    MOUNTAINEERING: 130,
    FISHING: 131,
    WATER_SKIING: 132,
    INDOOR_RUNNING: 133,
    PADEL_TENNIS: 134,
    DRIVING: 135,
    OFF_ROAD_DRIVING: 136,
    MOTORBIKING: 137,
    MOTOR_RACING: 138,
    ENDURO: 139,
    CANOEING: 140,
    ORIENTEERING: 141,
    HANG_GLIDING: 142,
    FLYING: 143,
    HOT_AIR_BALLOONING: 144,
    JET_SKIING: 145,
    POWER_BOATING: 146,
    GAELIC_FOOTBALL: 147,
    HURLING: 148,
}

enum AFibFlag {
    `Negative (AFib not present)`: 0,
    `Positive (AFib present)`: 1,
    Inconclusive: 2,
}

@doc("Represents data types that a certain device contributed to.")
enum DeviceDataType {
    Steps: "STEPS",
    `Active Minutes`: "ACTIVE_MINUTES",
    BMR: "BMR",
    Calories: "CALORIES",
    Distance: "DISTANCE",
    `Heart Rate`: "HEART_RATE",
    `Oxygen Saturation (SpO2)`: "OXYGEN_SATURATION",
    `Sleep type classification`: "SLEEP_TYPE",
    Speed: "SPEED",
    Cadence: "CADENCE",
}

enum ActivityLevel {
    Unknown: 0,
    Rest: 1,
    Inactive: 2,
    `Low Intensity`: 3,
    `Medium Intensity`: 4,
    `High Intensity`: 5,
}

enum HeartRateZone {
    `Zone 0`: 0,
    `Zone 1`: 1,
    `Zone 2`: 2,
    `Zone 3`: 3,
    `Zone 4`: 4,
    `Zone 5`: 5,
    `Other/custom classification`: 6,
}

enum UploadType {
    Unknown: 0,
    Automatic: 1,
    Manual: 2,
    Update: 3,
    Delete: 4,
    Pending: 5,
    `Third party upload`: 6,
}

@doc("Represents the type of sleep upload.")
enum SleepUploadType {
    Unknown: 0,
    Manual: 1,
    Automatic: 2,
    Tentative: 3,
    Indeterminate: 4,
}

@doc("Represents different swimming stroke types.")
enum StrokeType {
    OTHER: "other",
    FREESTYLE: "freestyle",
    BACKSTROKE: "backstroke",
    BREASTSTROKE: "breaststroke",
    BUTTERFLY: "butterfly",
}

@doc("Represents glucose measurement status flags.")
enum GlucoseFlag {
    Normal: 0,
    High: 1,
    Low: 2,
}

@doc("Represents units used for nutrition measurements.")
enum NutritionUnits {
    Unknown: 0,
    Gram: 1,
    Teaspoon: 2,
    Tablespoon: 3,
    Cup: 4,
    `Medium Egg`: 5,
    `Large Egg`: 6,
    `Small Egg`: 7,
    Milliliter: 8,
    Ounce: 9,
    Count: 10,
    Scoop: 11,
    `Fluid Ounce`: 12,
}

@doc("Represents physical recovery status levels.")
enum RecoveryLevel {
    Unknown: 0,
    `Very Poor`: 1,
    Poor: 2,
    Compromised: 3,
    Ok: 4,
    Good: 5,
    `Very Good`: 6,
}

@doc("Represents glucose trend directions.")
enum TrendArrow {
    UNKNOWN: 0,
    FALLING_QUICKLY: 1,
    FALLING: 2,
    FLAT: 3,
    RISING: 4,
    RISING_QUICKLY: 5,
}

@doc("Represents menstruation flow intensity levels.")
enum MenstruationFlow {
    UNKNOWN: 0,
    NONE: 1,
    LIGHT: 2,
    MEDIUM: 3,
    HEAVY: 4,
    HAD: 5,
}

@doc("Represents different types of meals.")
enum MealType {
    UNKNOWN: 0,
    BREAKFAST: 1,
    MORNING_SNACK: 2,
    LUNCH: 3,
    AFTERNOON_SNACK: 4,
    DINNER: 5,
    SNACK: 6,
}

@doc("Represents stress level ranges.")
enum StressLevel {
    UNKNOWN: 0,
    REST: 1, // Represents range 1-25
    LOW: 2, // Represents range 26-50
    MEDIUM: 3, // Represents range 51-75
    HIGH: 4, // Represents range 76-100
}

@doc("Represents the context in which heart rate was measured.")
enum HeartRateContext {
    NOT_SET: 0,
    ACTIVE: 1,
    NOT_ACTIVE: 2,
}

@doc("Represents menstrual cycle phases.")
enum MenstrualPhase {
    MENSTRUAL: "menstrual",
    FOLLICULAR: "follicular",
    OVULATION: "ovulation",
    LUTEAL: "luteal",
    PMS: "pms",
    FERTILE: "fertile",
    FIRST_TRIMESTER: "first_trimester",
    SECOND_TRIMESTER: "second_trimester",
    THIRD_TRIMESTER: "third_trimester",
    UNKNOWN: "unknown",
}
