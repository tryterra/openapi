import "./enums.tsp";
namespace Schemas;

// Sample data models
model MenstruationFlowSample {
    timestamp: string;
    flow: MenstruationFlow;
}

model DailyPatternSample {
    time_from_midnight: integer;
    percentile_5: integer;
    percentile_25: integer;
    percentile_50: integer;
    percentile_75: integer;
    percentile_95: integer;
}

model DrinkSample {
    timestamp: string;
    drink_volume: float;
    drink_unit: string;
    drink_name: string;
}

model KetoneSample {
    timestamp: string;
    ketone_mg_per_dL: float;
    sample_type: KetoneSampleType;
}

model TorqueSample {
    timestamp: string;
    timer_duration_seconds: float;
    torque_newton_meters: float;
}

model RawECGSample {
    potential_uV: float;
    timestamp: string;
}

model ECGReading {
    start_timestamp: string;
    avg_hr_bpm: float;
    afib_classification: AFibFlag;
    raw_signal: RawECGSample[];
}

model GlucoseDataSample {
    timestamp: string;
    blood_glucose_mg_per_dL: float;
    glucose_level_flag: integer;
    trend_arrow: integer;
}

model HeartRateDataSample {
    timestamp: string;
    bpm: float;
    timer_duration_seconds: float;
    context: HeartRateContext;
}

model LapSample {
    start_time: string;
    end_time: string;
    distance_meters: float;
    calories: float;
    total_strokes: integer;
    stroke_type: StrokeType;
    avg_speed_meters_per_second: float;
}

model HeartRateVariabilityDataSampleRMSSD {
    timestamp: string;
    hrv_rmssd: float;
}

model HeartRateVariabilityDataSampleSDNN {
    timestamp: string;
    hrv_sdnn: float;
}

model HeartRateZoneData {
    zone: HeartRateZone;
    start_percentage: float;
    end_percentage: float;
    name: string;
    duration_seconds: float;
}

model FloorsClimbedSample {
    timestamp: string;
    floors_climbed: integer;
    timer_duration_seconds: float;
}

model CalorieSample {
    timestamp: string;
    calories: float;
    timer_duration_seconds: float;
}

model DistanceSample {
    timestamp: string;
    distance_meters: float;
    timer_duration_seconds: float;
}

model StepSample {
    timestamp: string;
    steps: integer;
    timer_duration_seconds: float;
}

model ElevationSample {
    timestamp: string;
    elev_meters: float;
    timer_duration_seconds: float;
}

model PositionSample {
    timestamp: string;
    coords_lat_lng_deg: float[];
    timer_duration_seconds: float;
}

model PowerSample {
    timestamp: string;
    watts: float;
    timer_duration_seconds: float;
}

model SpeedSample {
    timestamp: string;
    speed_meters_per_second: float;
    timer_duration_seconds: float;
}

model CadenceSample {
    timestamp: string;
    cadence_rpm: float;
    timer_duration_seconds: float;
}

model ActivityLevelSample {
    timestamp: string;
    level: ActivityLevel;
}

model METSample {
    timestamp: string;
    level: float;
}

model TSSSample {
    planned: float;
    actual: float;
    method: string;
    intensity_factor_planned: float;
    intensity_factor_actual: float;
    normalized_power_watts: float;
}

model SleepHypnogramSample {
    timestamp: string;
    level: SleepLevel;
}

model OxygenSaturationSample {
    timestamp: string;
    percentage: float;
}

model BreathSample {
    timestamp: string;
    breaths_per_min: float;
}

model SnoringSample {
    timestamp: string;
    duration_seconds: float;
}

model StressSample {
    timestamp: string;
    level: float;
}

model BodyBatterySample {
    timestamp: string;
    level: float;
}

model BloodPressureSample {
    timestamp: string;
    diastolic_bp: float;
    systolic_bp: float;
}

model MeasurementDataSample {
    measurement_time: string;
    BMI: float;
    BMR: float;
    RMR: float;
    estimated_fitness_age: float;
    skin_fold_mm: float;
    bodyfat_percentage: float;
    weight_kg: float;
    height_cm: float;
    bone_mass_g: float;
    muscle_mass_g: float;
    lean_mass_g: float;
    water_percentage: float;
    insulin_units: float;
    insulin_type: string;
    urine_color: string;
    user_notes: string;
}

model TemperatureSample {
    timestamp: string;
    temperature_celsius: float;
}

model HydrationLevelSample {
    timestamp: string;
    hydration_level: float;
}

model HydrationMeasurementSample {
    timestamp: string;
    hydration_kg: float;
}

model Vo2MaxSample {
    timestamp: string;
    vo2max_ml_per_min_per_kg: float;
}

model PulseVelocitySample {
    timestamp: string;
    pulse_wave_velocity_meters_per_second: float;
}

model AFibClassificationSample {
    timestamp: string;
    afib_classification: AFibFlag;
}

model NutritionQuantity {
    unit: NutritionUnits;
    amount: float;
}

model NutritionMacros {
    calories: float;
    protein_g: float;
    carbohydrates_g: float;
    fat_g: float;
    sugar_g: float;
    cholesterol_mg: float;
    fiber_g: float;
    sodium_mg: float;
    alcohol_g: float;
}

model NutritionMicros {
    selenium_mg: float;
    niacin_mg: float;
    magnesium_mg: float;
    copper_mg: float;
    vitamin_B12_mg: float;
    vitamin_B6_mg: float;
    vitamin_C_mg: float;
    zinc_mg: float;
    vitamin_E_mg: float;
    manganese_mg: float;
    vitamin_D_mg: float;
    iodine_mg: float;
    chloride_mg: float;
    folate_mg: float;
    calcium_mg: float;
    molybdenum_mg: float;
    vitamin_A_mg: float;
    riboflavin_mg: float;
    folic_acid_mg: float;
    iron_mg: float;
    thiamin_mg: float;
    pantothenic_acid_mg: float;
    caffeine_mg: float;
    vitamin_K_mg: float;
    chromium_mg: float;
    potassium_mg: float;
    biotin_mg: float;
    phosphorus_mg: float;
}

model Meal {
    name: string;
    id: string;
    timestamp: string;
    type: integer;
    quantity: NutritionQuantity;
    macros: NutritionMacros;
    micros: NutritionMicros;
}

model TagEntry {
    timestamp: string;
    tag_name: string;
    notes: string;
}

model RRInterval {
    timestamp: string;
    rr_interval_ms: float;
    hr_bpm: float;
}
// End of sample data models
