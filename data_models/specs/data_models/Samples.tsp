import "./enums.tsp";
namespace Terra.Models;

// Sample data models
model MenstruationFlowSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Flag indicating the strength of the user's menstrual flow.")
    flow?: Terra.Enums.MenstruationFlow;
}
model DailyPatternSample {
    @doc("Hour of the day, represented as an integer from 0 to 23, where 0 is midnight and 23 is the hour before the next midnight.")
    @minValue(0)
    @maxValue(23)
    @example(9)
    time_from_midnight?: integer;

    @doc("Percentile 5 of the glucose level at the given time of day.")
    percentile_5?: integer;

    @doc("Percentile 25 of the glucose level at the given time of day.")
    percentile_25?: integer;

    @doc("Percentile 50 of the glucose level at the given time of day.")
    percentile_50?: integer;

    @doc("Percentile 75 of the glucose level at the given time of day.")
    percentile_75?: integer;

    @doc("Percentile 95 of the glucose level at the given time of day.")
    percentile_95?: integer;
}

model DrinkSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Volume of drink consumed")
    @example(250.0)
    drink_volume?: float;

    @doc("Unit of measurement for the drink")
    @example("ml")
    drink_unit?: string;

    @doc("Name of drink consumed.")
    @example("Water")
    drink_name?: string;
}

model KetoneSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Ketone in mg per dL")
    @example(1.5)
    ketone_mg_per_dL?: float;

    @doc("Flag indicating the ketone sample type (e.g. blood, breath, urine)")
    sample_type?: Terra.Enums.KetoneSampleType;
}

model TorqueSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(300.0)
    timer_duration_seconds?: float;

    @doc("Torque generated at a given instant in time, in Newton-meters")
    @example(45.5)
    torque_newton_meters?: float;
}

model RawECGSample {
    @doc("Potential uV in the RawECG Sample")
    @example(1250.5)
    potential_uV?: float;

    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;
}

model ECGReading {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    start_timestamp?: string;

    @doc("User's average heart rate throughout the day, in beats per minute (bpm).")
    @example(72.5)
    avg_hr_bpm?: float;

    @doc("User's afib classification throught the day.")
    afib_classification?: Terra.Enums.AFibFlag;

    @doc("List of raw ECG readings sampled through the day.")
    raw_signal?: RawECGSample[];
}

model GlucoseDataSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's blood glucose reading")
    @example(95)
    blood_glucose_mg_per_dL?: integer;

    @doc("Flag indicating state of user's blood glucose level")
    glucose_level_flag?: Terra.Enums.GlucoseFlag;

    @doc("Flag indicating the current trend in the user's blood glucose level (e.g. rising, constant, falling)")
    trend_arrow?: Terra.Enums.TrendArrow;
}

model HeartRateDataSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's heart rate in bpm")
    @example(142.0)
    bpm?: float;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(600.0)
    timer_duration_seconds?: float;

    @doc("Represents the context in which heart rate was measured.")
    context?: Terra.Enums.HeartRateContext;
}

model LapSample {
    @doc("Calories burned during the lap")
    @example(50)
    calories?: float;

    @doc("Average heart rate in bpm, for the Lap sample")
    @example(145)
    avg_hr_bpm?: float;

    @doc("The start time of the associated lap, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time")
    @example("1999-11-23T09:00:00.000000+02:00")
    start_time?: string;

    @doc("Average speed of the user during the lap")
    @example(3.5)
    avg_speed_meters_per_second?: float;

    @doc("Distance covered during the lap")
    @example(400)
    distance_meters?: float;

    @doc("Total strokes performed during the lap - only relevant for swimming activities")
    @example(20)
    total_strokes?: integer;

    @doc("The end time of the associated lap, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time")
    @example("2022-10-28T10:00:00.000000+01:00")
    end_time?: string;

    @doc("Stroke type - only relevant for swimming activities")
    @example(Terra.Enums.StrokeType.FREESTYLE)
    stroke_type?: Terra.Enums.StrokeType;
}

model HeartRateVariabilityDataSampleRMSSD {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's Heart Rate Variability, computed using RMSSD")
    @example(42.1)
    hrv_rmssd?: float;
}

model HeartRateVariabilityDataSampleSDNN {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's Heart Rate Variability, computed using SDNN")
    @example(48.3)
    hrv_sdnn?: float;
}

model HeartRateZoneData {
    @doc("Heart rate zone designation")
    zone?: Terra.Enums.HeartRateZone;

    @doc("Start percentage (based off user's max HR) of the HR zone")
    @minValue(0.0)
    @maxValue(100.0)
    @example(60.0)
    start_percentage?: float;

    @doc("End percentage (based off user's max HR) of the HR zone")
    @minValue(0.0)
    @maxValue(100.0)
    @example(70.0)
    end_percentage?: float;

    @doc("Name of the associated heart rate zone")
    @example("Aerobic")
    name?: string;

    @doc("Duration spent in the heart rate zone")
    @example(300.0)
    duration_seconds?: float;
}

model FloorsClimbedSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Cumulative number of elevation gain measured in floors climbed up to associated timestamp, since the start of the payload")
    @example(5)
    floors_climbed?: integer;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(600.0)
    timer_duration_seconds?: float;
}

model CalorieSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    calories?: float;
    timer_duration_seconds?: float;
}

model DistanceSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Cumulative distance covered up to associated timestamp, since the start of the payload")
    @example(2500.0)
    distance_meters?: float;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(900.0)
    timer_duration_seconds?: float;
}

model StepSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    steps?: integer;
    timer_duration_seconds?: float;
}

model ElevationSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's altitude at a given point in time, in meters above sea level.")
    @example(925.0)
    elev_meters?: float;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(1200.0)
    timer_duration_seconds?: float;
}

model PositionSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Position of the user a given point in time, represented by a 2-value array of latitude, longitude, wherein each of the two numbers can be nullable")
    @example(#[-18.4911, 130.9123])
    coords_lat_lng_deg?: [float, float];

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(300.0)
    timer_duration_seconds?: float;
}

model PowerSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Power generated at a given instant in time, in Watts")
    @example(250.0)
    watts?: float;

    @doc("Time elapsed since the start of the workout, subtracting time during which the recording was paused")
    @example(1800.0)
    timer_duration_seconds?: float;
}

model SpeedSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    speed_meters_per_second?: float;
    timer_duration_seconds?: float;
}

model CadenceSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    cadence_rpm?: float;
    timer_duration_seconds?: float;
}

model ActivityLevelSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    level?: Terra.Enums.ActivityLevel;
}

model METSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    level?: float;
}

model TSSSample {
    planned?: float;
    actual?: float;
    method?: string;
    intensity_factor_planned?: float;
    intensity_factor_actual?: float;
    normalized_power_watts?: float;
}

model SleepHypnogramSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    level?: Terra.Enums.SleepLevel;
}

model OxygenSaturationSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's oxygen saturation percentage - referring to either SpO2 or SmO2, based on the `type` field")
    @example(98.0)
    percentage?: float;

    @doc("Type of oxygen saturation measurement (i.e. blood vs muscle)")
    type?: Terra.Enums.OxygenSaturationType;
}

model BreathSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's respiration rate")
    @example(16)
    breaths_per_min?: float;
}

model SnoringSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Duration of snoring episode, in seconds")
    @example(120.0)
    duration_seconds?: float;
}

model StressSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    level?: float;
}

model BodyBatterySample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    level?: float;
}

model BloodPressureSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("User's diastolic blood pressure, in mmHg")
    @example(80.5)
    diastolic_bp?: float;

    @doc("User's systolic blood pressure, in mmHg")
    @example(120.5)
    systolic_bp?: float;
}

model MeasurementDataSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    measurement_time?: string;

    @doc("User's Body Mass Index (BMI).")
    @example(22.4)
    BMI?: float;

    @doc("User's Basal Metabolic Rate - minimum amount of calories that a person's body needs to perform necessary functions.")
    @example(1800.0)
    BMR?: float;

    @doc("User's Resting Metabolic Rate - amount of energy that a person's body needs to function while at rest. RMR accounts for additional low-effort daily activities on top of basic body functions.")
    @example(2000.0)
    RMR?: float;

    @doc("Estimate of how fit the user is compared to their actual age, as measured by the device.")
    @example("25")
    estimated_fitness_age?: string;

    @doc("User's skin fold measurement.")
    @example(12.5)
    skin_fold_mm?: float;

    @doc("User's body fat percentage.")
    @example(18.5)
    @minValue(0)
    @maxValue(100)
    bodyfat_percentage?: float;

    @doc("User's body weight.")
    @example(75.5)
    weight_kg?: float;

    @doc("User's height.")
    @example(178.0)
    height_cm?: float;

    @doc("User's total bone mass.")
    @example(3200.0)
    bone_mass_g?: float;

    @doc("User's total muscle mass (i.e. skeletal muscle mass).")
    @example(35000.0)
    muscle_mass_g?: float;

    @doc("Total lean mass of the user - calculated as the difference between total body weight and body fat weight.")
    @example(61500.0)
    lean_mass_g?: float;

    @doc("Total amount of fluid in the user's body.")
    @example(60.5)
    @minValue(0.0)
    @maxValue(100.0)
    water_percentage?: float;

    @doc("Quantity of insulin administered to the user.")
    @example(10.5)
    insulin_units?: float;

    @doc("Type of insulin administered to the user.")
    @example("rapid-acting")
    insulin_type?: string;

    @doc("Color of the user's urine.")
    @example("pale yellow")
    urine_color?: string;

    @doc("User notes associated with the measurement.")
    user_notes?: string;
}

model TemperatureSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    temperature_celsius?: float;
}

model HydrationLevelSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("Total body water composition of the user, in kilograms.")
    @example(40.0)
    hydration_level?: float;
}

model HydrationMeasurementSample {
    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    hydration_kg?: float;
}

model Vo2MaxSample {
    timestamp?: string;
    vo2max_ml_per_min_per_kg?: float;
}

model PulseVelocitySample {
    timestamp: string;
    pulse_wave_velocity_meters_per_second: float;
}

model AFibClassificationSample {
    timestamp: string;
    afib_classification: Terra.Enums.AFibFlag;
}

model NutritionQuantity {
    unit: Terra.Enums.NutritionUnits;
    amount: float;
}

model NutritionMacros {
    @doc("Alcohol content of the associated food(s).")
    @example(14.0)
    alcohol_g?: float;

    @doc("Calorie content of the associated food(s).")
    @example(2000.0)
    calories?: float;

    @doc("Carbohydrates content of the associated food(s).")
    @example(300.0)
    carbohydrates_g?: float;

    @doc("Cholesterol content of the associated food(s).")
    @example(300.0)
    cholesterol_mg?: float;

    @doc("Fat content of the associated food(s).")
    @example(65.0)
    fat_g?: float;

    @doc("Fiber content of the associated food(s).")
    @example(25.0)
    fiber_g?: float;

    @doc("Net carbs content of the associated food(s).")
    @example(275.0)
    net_carbohydrates_g?: float;

    @doc("Protein content of the associated food(s).")
    @example(50.0)
    protein_g?: float;

    @doc("Saturated fat content of the associated food(s).")
    @example(20.0)
    saturated_fat_g?: float;

    @doc("Sodium content of the associated food(s).")
    @example(2300.0)
    sodium_mg?: float;

    @doc("Sugar content of the associated food(s).")
    @example(25.0)
    sugar_g?: float;

    @doc("Trans fat content of the associated food(s).")
    @example(2.0)
    trans_fat_g?: float;
}

model NutritionMicros {
    @doc("Biotin content of the associated food(s).")
    @example(0.03)
    biotin_mg?: float;

    @doc("Caffeine content of the associated food(s).")
    @example(95.0)
    caffeine_mg?: float;

    @doc("Calcium content of the associated food(s).")
    @example(1000.0)
    calcium_mg?: float;

    @doc("Chloride content of the associated food(s).")
    @example(2300.0)
    chloride_mg?: float;

    @doc("Chromium content of the associated food(s).")
    @example(0.035)
    chromium_mg?: float;

    @doc("Copper content of the associated food(s).")
    @example(0.9)
    copper_mg?: float;

    @doc("Folate content of the associated food(s).")
    @example(0.4)
    folate_mg?: float;

    @doc("Folic Acid content of the associated food(s).")
    @example(0.4)
    folic_acid_mg?: float;

    @doc("Iodine content of the associated food(s).")
    @example(0.15)
    iodine_mg?: float;

    @doc("Iron content of the associated food(s).")
    @example(8.5)
    iron_mg?: float;

    @doc("Magnesium content of the associated food(s).")
    @example(320.0)
    magnesium_mg?: float;

    @doc("Manganese content of the associated food(s).")
    @example(2.3)
    manganese_mg?: float;

    @doc("Molybdenum content of the associated food(s).")
    @example(0.045)
    molybdenum_mg?: float;

    @doc("Niacin content of the associated food(s).")
    @example(16.0)
    niacin_mg?: float;

    @doc("Pantothenic content of the associated food(s).")
    @example(5)
    pantothenic_acid_mg?: float;

    @doc("Phosphorus content of the associated food(s).")
    @example(1000.0)
    phosphorus_mg?: float;

    @doc("Potassium content of the associated food(s).")
    @example(3500.0)
    potassium_mg?: float;

    @doc("Riboflavin content of the associated food(s).")
    @example(1.3)
    riboflavin_mg?: float;

    @doc("Selenium content of the associated food(s).")
    @example(0.055)
    selenium_mg?: float;

    @doc("Thiamin content of the associated food(s).")
    @example(1.2)
    thiamin_mg?: float;

    @doc("Vitamin A content of the associated food(s).")
    @example(0.9)
    vitamin_A_mg?: float;

    @doc("Vitamin B12 content of the associated food(s).")
    @example(0.0024)
    vitamin_B12_mg?: float;

    @doc("Vitamin B6 content of the associated food(s).")
    @example(1.7)
    vitamin_B6_mg?: float;

    @doc("Vitamin C content of the associated food(s).")
    @example(90)
    vitamin_C_mg?: float;

    @doc("Vitamin D content of the associated food(s).")
    @example(0.02)
    vitamin_D_mg?: float;

    @doc("Vitamin D2 content of the associated food(s).")
    @example(0.01)
    vitamin_D2_mg?: float;

    @doc("Vitamin D3 content of the associated food(s).")
    @example(0.015)
    vitamin_D3_mg?: float;

    @doc("Vitamin E content of the associated food(s).")
    @example(15.0)
    vitamin_E_mg?: float;

    @doc("Vitamin K content of the associated food(s).")
    @example(0.12)
    vitamin_K_mg?: float;

    @doc("Zinc content of the associated food(s).")
    @example(11.0)
    zinc_mg?: float;

    // Amino acids
    @doc("Cystine content of the associated food(s).")
    @example(0.3)
    cystine_g?: float;

    @doc("Histidine content of the associated food(s).")
    @example(0.6)
    histidine_g?: float;

    @doc("Isoleucine content of the associated food(s).")
    @example(0.8)
    isoleucine_g?: float;

    @doc("Leucine content of the associated food(s).")
    @example(1.2)
    leucine_g?: float;

    @doc("Lysine content of the associated food(s).")
    @example(0.9)
    lysine_g?: float;

    @doc("Methionine content of the associated food(s).")
    @example(0.6)
    methionine_g?: float;

    @doc("Phenylalanine content of the associated food(s).")
    @example(0.9)
    phenylalanine_g?: float;

    @doc("Threonine content of the associated food(s).")
    @example(0.5)
    threonine_g?: float;

    @doc("Tryptophan content of the associated food(s).")
    @example(0.3)
    tryptophan_g?: float;

    @doc("Tyrosine content of the associated food(s).")
    @example(0.7)
    tyrosine_g?: float;

    @doc("Valine content of the associated food(s).")
    @example(0.8)
    valine_g?: float;

    // Fats and fatty acids
    @doc("Monounsaturated fat content of the associated food(s).")
    @example(15.0)
    monounsaturated_fat_g?: float;

    @doc("Polyunsaturated fat content of the associated food(s).")
    @example(13.0)
    polyunsaturated_fat_g?: float;

    @doc("Omega3 content of the associated food(s).")
    @example(1.6)
    omega3_g?: float;

    @doc("Omega6 content of the associated food(s).")
    @example(17.0)
    omega6_g?: float;

    // Carbohydrates
    @doc("Starch content of the associated food(s).")
    @example(25.0)
    starch_g?: float;
}

model Meal {
    @doc("Micronutrient information for associated food.")
    micros: NutritionMicros;

    @doc("Enum representing the category the consumed food/meal falls under (i.e. Breakfast/Lunch/Dinner etc).")
    type: Terra.Enums.MealType;

    @doc("Identifier for food logged by the user.")
    @example("food_123")
    id: string;

    @doc("Timestamp the food is associated with, in ISO8601 format, with microsecond precision.")
    @example("2022-12-12T08:53:00.000000+02:00")
    timestamp: string;

    @doc("Quantity of the food that was consumed, containing information on amount & units in which this was recorded.")
    quantity: NutritionQuantity;

    @doc("Name of food logged by the user.")
    @example("Oatmeal")
    name: string;

    @doc("Macronutrient information for associated food.")
    macros: NutritionMacros;
}

model TagEntry {
    @doc("Time with which the tag is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T09:00:00.000000+02:00")
    timestamp: string;

    @doc("Tag name, representing a certain event associated with the user's day.")
    @example("hot_shower")
    tag_name: string;

    @doc("User-input notes associated with the given tag.")
    @example("Felt refreshed after")
    notes: string;
}

model RRIntervalSample {
    @doc("User's RR Interval for a specific heart beat in milliseconds.")
    @example(850.0)
    rr_interval_ms?: float;

    @doc("Time with which the record is associated, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-23T09:00:00.000000+02:00")
    timestamp?: string;

    @doc("The heart beat value at that specific instance.")
    @example(72.0)
    hr_bpm?: float;
}
// End of sample data models
