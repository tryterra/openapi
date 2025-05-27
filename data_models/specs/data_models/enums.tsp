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
@example(AFibFlag.POSITIVE)
@oneOf
union AFibFlag {
    @summary("Negative")
    @doc("AFib was not detected in the heart rhythm analysis.")
    NEGATIVE: 0,

    @summary("Positive")
    @doc("AFib was detected in the heart rhythm analysis.")
    POSITIVE: 1,

    @summary("Inconclusive")
    @doc("The heart rhythm analysis couldn't determine whether AFib was present or absent.")
    INCONCLUSIVE: 2,
}

@doc("Represents data types that a certain device contributed to.")
@example(DeviceDataType.STEPS)
@oneOf
union DeviceDataType {
    @summary("Steps")
    @doc("Count of steps taken by the user.")
    STEPS: "STEPS",

    @summary("Active Minutes")
    @doc("Duration of time the user spent in physical activity.")
    ACTIVE_MINUTES: "ACTIVE_MINUTES",

    @summary("Basal Metabolic Rate")
    @doc("User's basal metabolic rate - calories burned at rest.")
    BMR: "BMR",

    @summary("Calories")
    @doc("Calories burned by the user during activity.")
    CALORIES: "CALORIES",

    @summary("Distance")
    @doc("Distance traveled by the user during activity.")
    DISTANCE: "DISTANCE",

    @summary("Heart Rate")
    @doc("User's heart rate measurements.")
    HEART_RATE: "HEART_RATE",

    @summary("Oxygen Saturation")
    @doc("Blood oxygen saturation level (SpO2) of the user.")
    OXYGEN_SATURATION: "OXYGEN_SATURATION",

    @summary("Sleep Classification")
    @doc("Classification of user's sleep stages or types.")
    SLEEP_TYPE: "SLEEP_TYPE",

    @summary("Speed")
    @doc("User's movement speed during activity.")
    SPEED: "SPEED",

    @summary("Cadence")
    @doc("Rate of movement repetition during activity (steps per minute).")
    CADENCE: "CADENCE",
}

@doc("Intensity of the user's activity at an instant in time")
@example(ActivityLevel.MEDIUM_INTENSITY)
@oneOf
union ActivityLevel {
    @summary("Unknown")
    @doc("Activity level is unknown or could not be determined.")
    UNKNOWN: 0,

    @summary("Rest")
    @doc("User is at rest, with minimal to no physical activity.")
    REST: 1,

    @summary("Inactive")
    @doc("User is awake but inactive or sedentary.")
    INACTIVE: 2,

    @summary("Low Intensity")
    @doc("User is engaged in light physical activity such as casual walking.")
    LOW_INTENSITY: 3,

    @summary("Medium Intensity")
    @doc("User is engaged in moderate physical activity such as brisk walking or light exercise.")
    MEDIUM_INTENSITY: 4,

    @summary("High Intensity")
    @doc("User is engaged in vigorous physical activity such as running or intense exercise.")
    HIGH_INTENSITY: 5,
}

@doc("Represents the heart rate zone the user is currently in during a workout or activity")
@example(HeartRateZone.ZONE_2)
@oneOf
union HeartRateZone {
    @summary("Zone 0")
    @doc("Resting heart rate zone.")
    ZONE_0: 0,

    @summary("Zone 1")
    @doc("Very light activity zone.")
    ZONE_1: 1,

    @summary("Zone 2")
    @doc("Light activity zone.")
    ZONE_2: 2,

    @summary("Zone 3")
    @doc("Moderate activity zone.")
    ZONE_3: 3,

    @summary("Zone 4")
    @doc("Hard activity zone.")
    ZONE_4: 4,

    @summary("Zone 5")
    @doc("Maximum effort zone.")
    ZONE_5: 5,

    @summary("Other")
    @doc("Heart rate zone that doesn't fit into the standard zones or couldn't be classified.")
    OTHER: 6,
}

@doc("Represents the sleep level of the user during a sleep session, indicating the depth and quality of sleep")
@example(SleepLevel.SLEEPING)
@oneOf
union SleepLevel {
    @summary("Unknown")
    @doc("Sleep level is unknown or could not be determined.")
    UNKNOWN: 0,

    @summary("Awake")
    @doc("User is awake during the sleep session.")
    AWAKE: 1,

    @summary("Sleeping")
    @doc("User is in a general sleep state.")
    SLEEPING: 2,

    @summary("Out of bed")
    @doc("User has left the bed during a sleep session.")
    OUT_OF_BED: 3,

    @summary("Light sleep")
    @doc("User is in light sleep stage.")
    LIGHT: 4,

    @summary("Deep sleep")
    @doc("User is in deep sleep stage.")
    DEEP: 5,

    @summary("REM sleep")
    @doc("User is in REM sleep stage.")
    REM: 6,
}

@doc("The type of upload for the associated workout, providing information on how the workout data was recorded or entered")
@oneOf
union UploadType {
    @summary("Unknown")
    @doc("The upload type is unknown or could not be determined.")
    UNKNOWN: 0,

    @summary("Automatic")
    @doc("The workout was automatically detected and recorded by a device or service.")
    AUTOMATIC: 1,

    @summary("Manual")
    @doc("The workout was manually entered by the user.")
    MANUAL: 2,

    @summary("Update")
    @doc("The workout data represents an update to a previously recorded workout.")
    UPDATE: 3,

    @summary("Delete")
    @doc("The workout was marked for deletion.")
    DELETE: 4,

    @summary("Pending")
    @doc("The workout upload is pending processing or confirmation.")
    PENDING: 5,

    @summary("Third party upload")
    @doc("The workout was uploaded or synced from a third-party service or application.")
    THIRD_PARTY_UPLOAD: 6,
}

@doc("The upload type for the associated workout, providing information on whether this was an automatic workout or user-entered")
@example(SleepUploadType.MANUAL)
@oneOf
union SleepUploadType {
    @summary("Unknown")
    @doc("The sleep data upload type is unknown or could not be determined.")
    UNKNOWN: 0,

    @summary("Manual")
    @doc("The sleep data was manually entered by the user.")
    MANUAL: 1,

    @summary("Automatic")
    @doc("The sleep data was automatically detected and recorded by a device or service.")
    AUTOMATIC: 2,

    @summary("Tentative")
    @doc("The sleep data is preliminary or tentative and may be subject to change.")
    TENTATIVE: 3,

    @summary("Indeterminate")
    @doc("The sleep data upload type cannot be clearly categorized.")
    INDETERMINATE: 4,
}

@doc("Stroke type used for the workout step (e.g. breaststroke)")
@example(StrokeType.BACKSTROKE)
@oneOf
union StrokeType {
    @summary("Other")
    @doc("Any swimming stroke style that doesn't fit the standard categories.")
    OTHER: "other",

    @summary("Freestyle")
    @doc("Front crawl stroke where swimmers alternate arm movements with face in water.")
    FREESTYLE: "freestyle",

    @summary("Backstroke")
    @doc("Swimming stroke performed on the back with alternating arm movements.")
    BACKSTROKE: "backstroke",

    @summary("Breaststroke")
    @doc("Swimming stroke where arms move simultaneously in a heart-shaped pattern with a frog kick.")
    BREASTSTROKE: "breaststroke",

    @summary("Butterfly")
    @doc("Swimming stroke with simultaneous overhead arm movements and dolphin kick.")
    BUTTERFLY: "butterfly",
}

@doc("Flag indicating state of user's blood glucose level")
@example(GlucoseFlag.HIGH)
@oneOf
union GlucoseFlag {
    @summary("Normal")
    @doc("Blood glucose level is within the normal/healthy range.")
    NORMAL: 0,

    @summary("High")
    @doc("Blood glucose level is above the normal range (hyperglycemia).")
    HIGH: 1,

    @summary("Low")
    @doc("Blood glucose level is below the normal range (hypoglycemia).")
    LOW: 2,
}

@doc("Represents units used for nutrition measurements")
@example(NutritionUnits.CUP)
@oneOf
union NutritionUnits {
    @summary("Unknown")
    @doc("The unit of measurement is unknown or not specified.")
    UNKNOWN: 0,

    @summary("Gram")
    @doc("Measurement in grams, a metric unit of mass.")
    GRAM: 1,

    @summary("Teaspoon")
    @doc("Measurement in teaspoons, approximately 5 milliliters.")
    TEASPOON: 2,

    @summary("Tablespoon")
    @doc("Measurement in tablespoons, approximately 15 milliliters.")
    TABLESPOON: 3,

    @summary("Cup")
    @doc("Measurement in cups, approximately 240 milliliters.")
    CUP: 4,

    @summary("Medium Egg")
    @doc("Quantity measured in medium-sized eggs.")
    MEDIUM_EGG: 5,

    @summary("Large Egg")
    @doc("Quantity measured in large-sized eggs.")
    LARGE_EGG: 6,

    @summary("Small Egg")
    @doc("Quantity measured in small-sized eggs.")
    SMALL_EGG: 7,

    @summary("Milliliter")
    @doc("Measurement in milliliters, a metric unit of volume.")
    MILLILITER: 8,

    @summary("Ounce")
    @doc("Measurement in ounces, approximately 28 grams.")
    OUNCE: 9,

    @summary("Count")
    @doc("Quantity measured by individual count or number of items.")
    COUNT: 10,

    @summary("Scoop")
    @doc("Quantity measured in scoops, typically used for protein powder or supplements.")
    SCOOP: 11,

    @summary("Fluid Ounce")
    @doc("Measurement in fluid ounces, approximately 30 milliliters.")
    FLUID_OUNCE: 12,
}

@doc("User's recovery score for a given day, resulting from the sleep session")
@example(RecoveryLevel.GOOD)
@oneOf
union RecoveryLevel {
    @summary("Unknown")
    @doc("Recovery level could not be determined or is not available.")
    UNKNOWN: 0,

    @summary("Very Poor")
    @doc("Extremely low recovery.")
    VERY_POOR: 1,

    @summary("Poor")
    @doc("Low recovery level.")
    POOR: 2,

    @summary("Compromised")
    @doc("Below average recovery.")
    COMPROMISED: 3,

    @summary("Ok")
    @doc("Moderate recovery level.")
    OK: 4,

    @summary("Good")
    @doc("Above average recovery.")
    GOOD: 5,

    @summary("Very Good")
    @doc("Excellent recovery level.")
    VERY_GOOD: 6,
}

@doc("Flag indicating the current trend in the user's blood glucose level (e.g. rising, constant, falling)")
@example(TrendArrow.RISING)
@oneOf
union TrendArrow {
    @summary("Unknown")
    @doc("Glucose trend cannot be determined.")
    UNKNOWN: 0,

    @summary("Falling Quickly")
    @doc("Glucose level is decreasing rapidly.")
    FALLING_QUICKLY: 1,

    @summary("Falling")
    @doc("Glucose level is decreasing gradually.")
    FALLING: 2,

    @summary("Flat")
    @doc("Glucose level is remaining stable.")
    FLAT: 3,

    @summary("Rising")
    @doc("Glucose level is increasing gradually.")
    RISING: 4,

    @summary("Rising Quickly")
    @doc("Glucose level is increasing rapidly.")
    RISING_QUICKLY: 5,
}

@doc("Flag indicating the strength of the user's menstrual flow")
@example(MenstruationFlow.HEAVY)
@oneOf
union MenstruationFlow {
    @summary("Unknown")
    @doc("Flow status is unknown or not recorded.")
    UNKNOWN: 0,

    @summary("None")
    @doc("No menstrual flow present.")
    NONE: 1,

    @summary("Light")
    @doc("Light menstrual flow.")
    LIGHT: 2,

    @summary("Medium")
    @doc("Moderate menstrual flow.")
    MEDIUM: 3,

    @summary("Heavy")
    @doc("Heavy menstrual flow.")
    HEAVY: 4,

    @summary("Had")
    @doc("Menstrual flow occurred but intensity not specified.")
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
@example(StressLevel.MEDIUM)
@oneOf
union StressLevel {
    @summary("Unknown")
    @doc("Stress level is unknown or could not be determined.")
    UNKNOWN: 0,

    @summary("Rest")
    @doc("Very low stress level (range 1-25).")
    REST: 1,

    @summary("Low")
    @doc("Low stress level (range 26-50).")
    LOW: 2,

    @summary("Medium")
    @doc("Moderate stress level (range 51-75).")
    MEDIUM: 3,

    @summary("High")
    @doc("High stress level (range 76-100).")
    HIGH: 4,
}

@doc("Represents the context in which heart rate was measured.")
@example(HeartRateContext.ACTIVE)
@oneOf
union HeartRateContext {
    @summary("Not Set")
    @doc("Heart rate measurement context is not specified.")
    NOT_SET: 0,

    @summary("Active")
    @doc("Heart rate was measured during physical activity or exercise.")
    ACTIVE: 1,

    @summary("Not Active")
    @doc("Heart rate was measured during rest or non-active periods.")
    NOT_ACTIVE: 2,
}

@doc("Represents menstrual cycle phases.")
@example(MenstrualPhase.MENSTRUAL)
@oneOf
union MenstrualPhase {
    @summary("Menstrual")
    @doc("The menstrual phase when bleeding occurs.")
    MENSTRUAL: "menstrual",

    @summary("Follicular")
    @doc("The follicular phase when follicles in ovaries develop.")
    FOLLICULAR: "follicular",

    @summary("Ovulation")
    @doc("The ovulation phase when an egg is released.")
    OVULATION: "ovulation",

    @summary("Luteal")
    @doc("The luteal phase following ovulation.")
    LUTEAL: "luteal",

    @summary("PMS")
    @doc("Premenstrual syndrome phase before menstruation begins.")
    PMS: "pms",

    @summary("Fertile")
    @doc("The fertile window when conception is most likely.")
    FERTILE: "fertile",

    @summary("First Trimester")
    @doc("First third of pregnancy, weeks 1-12.")
    FIRST_TRIMESTER: "first_trimester",

    @summary("Second Trimester")
    @doc("Middle third of pregnancy, weeks 13-26.")
    SECOND_TRIMESTER: "second_trimester",

    @summary("Third Trimester")
    @doc("Final third of pregnancy, weeks 27-40.")
    THIRD_TRIMESTER: "third_trimester",

    @summary("Unknown")
    @doc("Menstrual cycle phase could not be determined.")
    UNKNOWN: "unknown",
}

@doc("Flag indicating the ketone sample type (e.g. blood, breath, urine)")
@example(KetoneSampleType.BLOOD)
@oneOf
union KetoneSampleType {
    @summary("Unknown")
    @doc("The type of ketone sample is unknown or not specified.")
    UNKNOWN: 0,

    @summary("Blood")
    @doc("Ketone sample taken from blood.")
    BLOOD: 1,

    @summary("Urine")
    @doc("Ketone sample taken from urine.")
    URINE: 2,

    @summary("Breath")
    @doc("Ketone sample taken from breath.")
    BREATH: 3,
}
