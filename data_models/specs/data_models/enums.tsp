import "@typespec/json-schema";
using JsonSchema;

namespace Schemas;

@doc("The type of activity performed for the associated workout.")
@example(ActivityType.RUNNING)
@oneOf
union ActivityType {
    @summary("In Vehicle")
    @doc("Activity type for when the user is in a vehicle, such as a car or bus.")
    IN_VEHICLE: 0,

    @summary("Biking")
    @doc("Activity type for general biking or cycling.")
    BIKING: 1,

    @summary("Still")
    @doc("Activity type for when the user is still or not moving.")
    STILL: 3,

    @summary("Unknown")
    @doc("Activity type is unknown or could not be determined.")
    UNKNOWN: 4,

    @summary("Tilting")
    @doc("Activity type for when the device detects a tilting motion.")
    TILTING: 5,

    @summary("Walking")
    @doc("Activity type for general walking.")
    WALKING: 7,

    @summary("Running")
    @doc("Activity type for general running.")
    RUNNING: 8,

    @summary("Aerobics")
    @doc("Activity type for aerobic exercises and workouts.")
    AEROBICS: 9,

    @summary("Badminton")
    @doc("Activity type for playing badminton.")
    BADMINTON: 10,

    @summary("Baseball")
    @doc("Activity type for playing baseball.")
    BASEBALL: 11,

    @summary("Basketball")
    @doc("Activity type for playing basketball.")
    BASKETBALL: 12,

    @summary("Biathlon")
    @doc("Activity type for biathlon, combining cross-country skiing and rifle shooting.")
    BIATHLON: 13,

    @summary("Hand Biking")
    @doc("Activity type for hand biking, using a hand-powered bicycle.")
    HANDBIKING: 14,

    @summary("Mountain Biking")
    @doc("Activity type for off-road cycling on rough terrain.")
    MOUNTAIN_BIKING: 15,

    @summary("Road Biking")
    @doc("Activity type for cycling on paved roads.")
    ROAD_BIKING: 16,

    @summary("Spinning")
    @doc("Activity type for indoor cycling classes or spinning.")
    SPINNING: 17,

    @summary("Stationary Biking")
    @doc("Activity type for exercising on a stationary bicycle.")
    STATIONARY_BIKING: 18,

    @summary("Utility Biking")
    @doc("Activity type for cycling for transportation or utility purposes.")
    UTILITY_BIKING: 19,

    @summary("Boxing")
    @doc("Activity type for boxing training or matches.")
    BOXING: 20,

    @summary("Calisthenics")
    @doc("Activity type for bodyweight exercises focusing on rhythm and flow.")
    CALISTHENICS: 21,

    @summary("Circuit Training")
    @doc("Activity type for workout consisting of a series of exercises performed in rotation.")
    CIRCUIT_TRAINING: 22,

    @summary("Cricket")
    @doc("Activity type for playing cricket.")
    CRICKET: 23,

    @summary("Dancing")
    @doc("Activity type for various forms of dance.")
    DANCING: 24,

    @summary("Elliptical")
    @doc("Activity type for exercising on an elliptical trainer.")
    ELLIPTICAL: 25,

    @summary("Fencing")
    @doc("Activity type for fencing sport.")
    FENCING: 26,

    @summary("American Football")
    @doc("Activity type for playing American football.")
    AMERICAN_FOOTBALL: 27,

    @summary("Australian Football")
    @doc("Activity type for playing Australian rules football.")
    AUSTRALIAN_FOOTBALL: 28,

    @summary("English Football")
    @doc("Activity type for playing soccer/football.")
    ENGLISH_FOOTBALL: 29,

    @summary("Frisbee")
    @doc("Activity type for playing frisbee or disc sports.")
    FRISBEE: 30,

    @summary("Gardening")
    @doc("Activity type for gardening and yard work.")
    GARDENING: 31,

    @summary("Golf")
    @doc("Activity type for playing golf.")
    GOLF: 32,

    @summary("Gymnastics")
    @doc("Activity type for performing gymnastics.")
    GYMNASTICS: 33,

    @summary("Handball")
    @doc("Activity type for playing handball.")
    HANDBALL: 34,

    @summary("Hiking")
    @doc("Activity type for hiking or walking on trails.")
    HIKING: 35,

    @summary("Hockey")
    @doc("Activity type for playing hockey.")
    HOCKEY: 36,

    @summary("Horseback Riding")
    @doc("Activity type for horseback riding.")
    HORSEBACK_RIDING: 37,

    @summary("Housework")
    @doc("Activity type for household chores and cleaning.")
    HOUSEWORK: 38,

    @summary("Jumping Rope")
    @doc("Activity type for skipping or jumping rope.")
    JUMPING_ROPE: 39,

    @summary("Kayaking")
    @doc("Activity type for kayaking on water.")
    KAYAKING: 40,

    @summary("Kettlebell Training")
    @doc("Activity type for exercises using kettlebells.")
    KETTLEBELL_TRAINING: 41,

    @summary("Kickboxing")
    @doc("Activity type for kickboxing training or matches.")
    KICKBOXING: 42,

    @summary("Kitesurfing")
    @doc("Activity type for kitesurfing or kiteboarding.")
    KITESURFING: 43,

    @summary("Martial Arts")
    @doc("Activity type for general martial arts training.")
    MARTIAL_ARTS: 44,

    @summary("Meditation")
    @doc("Activity type for meditation practice.")
    MEDITATION: 45,

    @summary("Mixed Martial Arts")
    @doc("Activity type for MMA training or fighting.")
    MIXED_MARTIAL_ARTS: 46,

    @summary("P90X Exercises")
    @doc("Activity type for P90X home fitness program.")
    P90X_EXERCISES: 47,

    @summary("Paragliding")
    @doc("Activity type for paragliding sport.")
    PARAGLIDING: 48,

    @summary("Pilates")
    @doc("Activity type for pilates exercises.")
    PILATES: 49,

    @summary("Polo")
    @doc("Activity type for playing polo.")
    POLO: 50,

    @summary("Racquetball")
    @doc("Activity type for playing racquetball.")
    RACQUETBALL: 51,

    @summary("Rock Climbing")
    @doc("Activity type for rock climbing.")
    ROCK_CLIMBING: 52,

    @summary("Rowing")
    @doc("Activity type for rowing on water.")
    ROWING: 53,

    @summary("Rowing Machine")
    @doc("Activity type for exercising on a rowing machine.")
    ROWING_MACHINE: 54,

    @summary("Rugby")
    @doc("Activity type for playing rugby.")
    RUGBY: 55,

    @summary("Jogging")
    @doc("Activity type for jogging at a leisurely pace.")
    JOGGING: 56,

    @summary("Running on Sand")
    @doc("Activity type for running on beach or sandy surface.")
    RUNNING_ON_SAND: 57,

    @summary("Treadmill Running")
    @doc("Activity type for running on a treadmill.")
    TREADMILL_RUNNING: 58,

    @summary("Sailing")
    @doc("Activity type for sailing on water.")
    SAILING: 59,

    @summary("Scuba Diving")
    @doc("Activity type for scuba diving underwater.")
    SCUBA_DIVING: 60,

    @summary("Skateboarding")
    @doc("Activity type for skateboarding.")
    SKATEBOARDING: 61,

    @summary("Skating")
    @doc("Activity type for general skating.")
    SKATING: 62,

    @summary("Cross Skating")
    @doc("Activity type for cross skating or nordic skating.")
    CROSS_SKATING: 63,

    @summary("Indoor Rollerblading")
    @doc("Activity type for rollerblading indoors.")
    INDOOR_ROLLERBLADING: 64,

    @summary("Skiing")
    @doc("Activity type for general skiing.")
    SKIING: 65,

    @summary("Back Country Skiing")
    @doc("Activity type for backcountry or off-piste skiing.")
    BACK_COUNTRY_SKIING: 66,

    @summary("Cross Country Skiing")
    @doc("Activity type for cross-country skiing.")
    CROSS_COUNTRY_SKIING: 67,

    @summary("Downhill Skiing")
    @doc("Activity type for alpine or downhill skiing.")
    DOWNHILL_SKIING: 68,

    @summary("Kite Skiing")
    @doc("Activity type for skiing with a kite for propulsion.")
    KITE_SKIING: 69,

    @summary("Roller Skiing")
    @doc("Activity type for roller skiing on wheels.")
    ROLLER_SKIING: 70,

    @summary("Sledding")
    @doc("Activity type for sledding or tobogganing.")
    SLEDDING: 71,

    @summary("Snowboarding")
    @doc("Activity type for snowboarding.")
    SNOWBOARDING: 73,

    @summary("Snowmobile")
    @doc("Activity type for riding a snowmobile.")
    SNOWMOBILE: 74,

    @summary("Snowshoeing")
    @doc("Activity type for walking with snowshoes.")
    SNOWSHOEING: 75,

    @summary("Squash")
    @doc("Activity type for playing squash.")
    SQUASH: 76,

    @summary("Stair Climbing")
    @doc("Activity type for climbing stairs.")
    STAIR_CLIMBING: 77,

    @summary("Stair Climbing Machine")
    @doc("Activity type for exercising on a stair climbing machine.")
    STAIR_CLIMBING_MACHINE: 78,

    @summary("Stand Up Paddleboarding")
    @doc("Activity type for stand-up paddleboarding.")
    STAND_UP_PADDLEBOARDING: 79,

    @summary("Strength Training")
    @doc("Activity type for resistance training or weight lifting.")
    STRENGTH_TRAINING: 80,

    @summary("Surfing")
    @doc("Activity type for surfing on waves.")
    SURFING: 81,

    @summary("Swimming")
    @doc("Activity type for general swimming.")
    SWIMMING: 82,

    @summary("Swimming in Pool")
    @doc("Activity type for swimming in a swimming pool.")
    SWIMMING_SWIMMING_POOL: 83,

    @summary("Open Water Swimming")
    @doc("Activity type for swimming in open water like oceans, lakes or rivers.")
    SWIMMING_OPEN_WATER: 84,

    @summary("Table Tennis")
    @doc("Activity type for playing table tennis or ping pong.")
    TABLE_TENNIS: 85,

    @summary("Team Sports")
    @doc("Activity type for general team sports not otherwise classified.")
    TEAM_SPORTS: 86,

    @summary("Tennis")
    @doc("Activity type for playing tennis.")
    TENNIS: 87,

    @summary("Treadmill")
    @doc("Activity type for exercising on a treadmill.")
    TREADMILL: 88,

    @summary("Volleyball")
    @doc("Activity type for general volleyball.")
    VOLLEYBALL: 89,

    @summary("Beach Volleyball")
    @doc("Activity type for playing volleyball on a beach.")
    VOLLEYBALL_BEACH: 90,

    @summary("Indoor Volleyball")
    @doc("Activity type for playing volleyball indoors.")
    VOLLEYBALL_INDOOR: 91,

    @summary("Wakeboarding")
    @doc("Activity type for wakeboarding on water.")
    WAKEBOARDING: 92,

    @summary("Walking for Fitness")
    @doc("Activity type for walking specifically for exercise.")
    WALKING_FITNESS: 93,

    @summary("Nordic Walking")
    @doc("Activity type for walking with poles.")
    NORDIC_WALKING: 94,

    @summary("Treadmill Walking")
    @doc("Activity type for walking on a treadmill.")
    WALKING_TREADMILL: 95,

    @summary("Water Polo")
    @doc("Activity type for playing water polo.")
    WATERPOLO: 96,

    @summary("Weightlifting")
    @doc("Activity type for weightlifting exercises.")
    WEIGHTLIFTING: 97,

    @summary("Wheelchair")
    @doc("Activity type for wheelchair-based movement.")
    WHEELCHAIR: 98,

    @summary("Windsurfing")
    @doc("Activity type for windsurfing on water.")
    WINDSURFING: 99,

    @summary("Yoga")
    @doc("Activity type for practicing yoga.")
    YOGA: 100,

    @summary("Zumba")
    @doc("Activity type for Zumba dance fitness.")
    ZUMBA: 101,

    @summary("Diving")
    @doc("Activity type for diving or jumping into water.")
    DIVING: 102,

    @summary("Ergometer")
    @doc("Activity type for exercising on an ergometer.")
    ERGOMETER: 103,

    @summary("Ice Skating")
    @doc("Activity type for skating on ice.")
    ICE_SKATING: 104,

    @summary("Indoor Skating")
    @doc("Activity type for skating indoors.")
    INDOOR_SKATING: 105,

    @summary("Curling")
    @doc("Activity type for playing curling on ice.")
    CURLING: 106,

    @summary("Other")
    @doc("Activity type for activities that don't fit into other categories.")
    OTHER: 108,

    @summary("CrossFit")
    @doc("Activity type for CrossFit training.")
    CROSSFIT: 113,

    @summary("HIIT")
    @doc("Activity type for high-intensity interval training.")
    HIIT: 114,

    @summary("Interval Training")
    @doc("Activity type for general interval training workouts.")
    INTERVAL_TRAINING: 115,

    @summary("Walking with Stroller")
    @doc("Activity type for walking while pushing a stroller.")
    WALKING_STROLLER: 116,

    @summary("Elevator")
    @doc("Activity type for riding in an elevator.")
    ELEVATOR: 117,

    @summary("Escalator")
    @doc("Activity type for riding on an escalator.")
    ESCALATOR: 118,

    @summary("Archery")
    @doc("Activity type for practicing archery.")
    ARCHERY: 119,

    @summary("Softball")
    @doc("Activity type for playing softball.")
    SOFTBALL: 120,

    @summary("Guided Breathing")
    @doc("Activity type for practicing guided breathing exercises.")
    GUIDED_BREATHING: 122,

    @summary("Cardio Training")
    @doc("Activity type for general cardiovascular exercise.")
    CARDIO_TRAINING: 123,

    @summary("Lacrosse")
    @doc("Activity type for playing lacrosse.")
    LACROSSE: 124,

    @summary("Stretching")
    @doc("Activity type for stretching exercises.")
    STRETCHING: 125,

    @summary("Triathlon")
    @doc("Activity type for triathlon events combining swimming, cycling and running.")
    TRIATHLON: 126,

    @summary("Inline Skating")
    @doc("Activity type for inline skating or rollerblading.")
    INLINE_SKATING: 127,

    @summary("Sky Diving")
    @doc("Activity type for sky diving or parachuting.")
    SKY_DIVING: 128,

    @summary("Paddling")
    @doc("Activity type for general paddling activities.")
    PADDLING: 129,

    @summary("Mountaineering")
    @doc("Activity type for mountaineering or alpine climbing.")
    MOUNTAINEERING: 130,

    @summary("Fishing")
    @doc("Activity type for fishing activities.")
    FISHING: 131,

    @summary("Water Skiing")
    @doc("Activity type for water skiing.")
    WATER_SKIING: 132,

    @summary("Indoor Running")
    @doc("Activity type for running indoors.")
    INDOOR_RUNNING: 133,

    @summary("Padel Tennis")
    @doc("Activity type for playing padel tennis.")
    PADEL_TENNIS: 134,

    @summary("Driving")
    @doc("Activity type for driving a vehicle.")
    DRIVING: 135,

    @summary("Off-Road Driving")
    @doc("Activity type for driving off-road or on unpaved surfaces.")
    OFF_ROAD_DRIVING: 136,

    @summary("Motorbiking")
    @doc("Activity type for riding a motorcycle.")
    MOTORBIKING: 137,

    @summary("Motor Racing")
    @doc("Activity type for motorsport racing.")
    MOTOR_RACING: 138,

    @summary("Enduro")
    @doc("Activity type for enduro motorcycle racing.")
    ENDURO: 139,

    @summary("Canoeing")
    @doc("Activity type for canoeing on water.")
    CANOEING: 140,

    @summary("Orienteering")
    @doc("Activity type for orienteering navigation sport.")
    ORIENTEERING: 141,

    @summary("Hang Gliding")
    @doc("Activity type for hang gliding.")
    HANG_GLIDING: 142,

    @summary("Flying")
    @doc("Activity type for piloting an aircraft.")
    FLYING: 143,

    @summary("Hot Air Ballooning")
    @doc("Activity type for hot air balloon flying.")
    HOT_AIR_BALLOONING: 144,

    @summary("Jet Skiing")
    @doc("Activity type for riding a jet ski on water.")
    JET_SKIING: 145,

    @summary("Power Boating")
    @doc("Activity type for operating a motorized boat.")
    POWER_BOATING: 146,

    @summary("Gaelic Football")
    @doc("Activity type for playing Gaelic football.")
    GAELIC_FOOTBALL: 147,

    @summary("Hurling")
    @doc("Activity type for playing hurling.")
    HURLING: 148,
}

@doc("Flag indicating the atrial fibrillation classification of the individual")
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

@doc("The upload type for the associated workout, providing information on whether this was an automatic workout or user-entered")
enum SleepUploadType {
    Unknown: 0,
    Manual: 1,
    Automatic: 2,
    Tentative: 3,
    Indeterminate: 4,
}

@doc("Stroke type used for the workout step (e.g. breaststroke)")
enum StrokeType {
    OTHER: "other",
    FREESTYLE: "freestyle",
    BACKSTROKE: "backstroke",
    BREASTSTROKE: "breaststroke",
    BUTTERFLY: "butterfly",
}

@doc("Flag indicating state of user's blood glucose level")
enum GlucoseFlag {
    NORMAL: 0,
    HIGH: 1,
    LOW: 2,
}

@doc("Represents units used for nutrition measurements")
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

@doc("User's recovery score for a given day, resulting from the sleep session")
enum RecoveryLevel {
    Unknown: 0,
    `Very Poor`: 1,
    Poor: 2,
    Compromised: 3,
    Ok: 4,
    Good: 5,
    `Very Good`: 6,
}

@doc("Flag indicating the current trend in the user's blood glucose level (e.g. rising, constant, falling)")
enum TrendArrow {
    UNKNOWN: 0,
    FALLING_QUICKLY: 1,
    FALLING: 2,
    FLAT: 3,
    RISING: 4,
    RISING_QUICKLY: 5,
}

@doc("Flag indicating the strength of the user's menstrual flow")
enum MenstruationFlow {
    UNKNOWN: 0,
    NONE: 1,
    LIGHT: 2,
    MEDIUM: 3,
    HEAVY: 4,
    HAD: 5,
}

@doc("Enum representing the category the consumed food/meal falls under (i.e. Breakfast/Lunch/Dinner etc)")
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
