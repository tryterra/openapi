namespace Schemas;

@doc("The type of activity performed for the associated workout.")
enum ActivityType {
    IN_VEHICLE: 0,
    BIKING: 1,
    STILL: 3,
    UNKNOWN: 4,
    TILTING: 5,
    WALKING: 7,
    RUNNING: 8,
    AEROBICS: 9,
    BADMINTON: 10,
    BASEBALL: 11,
    BASKETBALL: 12,
    BIATHLON: 13,
    HANDBIKING: 14,
    MOUNTAIN_BIKING: 15,
    ROAD_BIKING: 16,
    SPINNING: 17,
    STATIONARY_BIKING: 18,
    UTILITY_BIKING: 19,
    BOXING: 20,
    CALISTHENICS: 21,
    CIRCUIT_TRAINING: 22,
    CRICKET: 23,
    DANCING: 24,
    ELLIPTICAL: 25,
    FENCING: 26,
    AMERICAN_FOOTBALL: 27,
    AUSTRALIAN_FOOTBALL: 28,
    ENGLISH_FOOTBALL: 29,
    FRISBEE: 30,
    GARDENING: 31,
    GOLF: 32,
    GYMNASTICS: 33,
    HANDBALL: 34,
    HIKING: 35,
    HOCKEY: 36,
    HORSEBACK_RIDING: 37,
    HOUSEWORK: 38,
    JUMPING_ROPE: 39,
    KAYAKING: 40,
    KETTLEBELL_TRAINING: 41,
    KICKBOXING: 42,
    KITESURFING: 43,
    MARTIAL_ARTS: 44,
    MEDITATION: 45,
    MIXED_MARTIAL_ARTS: 46,
    P90X_EXERCISES: 47,
    PARAGLIDING: 48,
    PILATES: 49,
    POLO: 50,
    RACQUETBALL: 51,
    ROCK_CLIMBING: 52,
    ROWING: 53,
    ROWING_MACHINE: 54,
    RUGBY: 55,
    JOGGING: 56,
    RUNNING_ON_SAND: 57,
    TREADMILL_RUNNING: 58,
    SAILING: 59,
    SCUBA_DIVING: 60,
    SKATEBOARDING: 61,
    SKATING: 62,
    CROSS_SKATING: 63,
    INDOOR_ROLLERBLADING: 64,
    SKIING: 65,
    BACK_COUNTRY_SKIING: 66,
    CROSS_COUNTRY_SKIING: 67,
    DOWNHILL_SKIING: 68,
    KITE_SKIING: 69,
    ROLLER_SKIING: 70,
    SLEDDING: 71,
    SNOWBOARDING: 73,
    SNOWMOBILE: 74,
    SNOWSHOEING: 75,
    SQUASH: 76,
    STAIR_CLIMBING: 77,
    STAIR_CLIMBING_MACHINE: 78,
    STAND_UP_PADDLEBOARDING: 79,
    STRENGTH_TRAINING: 80,
    SURFING: 81,
    SWIMMING: 82,
    SWIMMING_SWIMMING_POOL: 83,
    SWIMMING_OPEN_WATER: 84,
    TABLE_TENNIS: 85,
    TEAM_SPORTS: 86,
    TENNIS: 87,
    TREADMILL: 88,
    VOLLEYBALL: 89,
    VOLLEYBALL_BEACH: 90,
    VOLLEYBALL_INDOOR: 91,
    WAKEBOARDING: 92,
    WALKING_FITNESS: 93,
    NORDIC_WALKING: 94,
    WALKING_TREADMILL: 95,
    WATERPOLO: 96,
    WEIGHTLIFTING: 97,
    WHEELCHAIR: 98,
    WINDSURFING: 99,
    YOGA: 100,
    ZUMBA: 101,
    DIVING: 102,
    ERGOMETER: 103,
    ICE_SKATING: 104,
    INDOOR_SKATING: 105,
    CURLING: 106,
    OTHER: 108,
    CROSSFIT: 113,
    HIIT: 114,
    INTERVAL_TRAINING: 115,
    WALKING_STROLLER: 116,
    ELEVATOR: 117,
    ESCALATOR: 118,
    ARCHERY: 119,
    SOFTBALL: 120,
    GUIDED_BREATHING: 122,
    CARDIO_TRAINING: 123,
    LACROSSE: 124,
    STRETCHING: 125,
    TRIATHLON: 126,
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

@doc("Intensity of the user's activity at an instant in time")
@example(ActivityLevel.MEDIUM_INTENSITY)
enum ActivityLevel {
    UNKNOWN: 0,
    REST: 1,
    INACTIVE: 2,
    LOW_INTENSITY: 3,
    MEDIUM_INTENSITY: 4,
    HIGH_INTENSITY: 5,
}

@example(HeartRateZone.ZONE_2)
enum HeartRateZone {
    ZONE_0: 0,
    ZONE_1: 1,
    ZONE_2: 2,
    ZONE_3: 3,
    ZONE_4: 4,
    ZONE_5: 5,
    OTHER: 6,
}

enum SleepLevel {
    Unknown: 0,
    Awake: 1,
    Sleeping: 2,
    `Out of bed`: 3,
    Light: 4,
    Deep: 5,
    REM: 6,
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
