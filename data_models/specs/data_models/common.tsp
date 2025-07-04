import "./Samples.tsp";
namespace Terra.Models;
using Terra.Models;

model DataContributor {
    @doc("Name of the factor contributing to the score.")
    contributor_name: string;
    
    @doc("Numerical score representing the contribution of this factor.")
    contributor_score: float;
}

model HeartRateData {
    @doc("Object containing detailed heart rate information for the associated workout.")
    detailed?: HeartRateDataDetailed;

    @doc("Object containing summary heart rate information for the associated workout.")
    summary?: HeartRateDataSummary;
}

model HeartRateDataDetailed {
    @doc("Array of HeartRate data samples recorded for the user during the workout.")
    hr_samples?: HeartRateDataSample[];

    @doc("Array of HeartRate Variability data samples recorded for the user during the workout, computed using RMSSD.")
    hrv_samples_rmssd?: HeartRateVariabilityDataSampleRMSSD[];

    @doc("Array of HeartRate Variability data samples recorded for the user during the workout, computed using SDNN.")
    hrv_samples_sdnn?: HeartRateVariabilityDataSampleSDNN[];
}

model HeartRateDataSummary {
    @doc("Average HeartRate of the user during the workout.")
    @example(145.0)
    @minValue(0.0)
    avg_hr_bpm?: float;

    @doc("Average HeartRate Variability of the user during the workout, computed using RMSSD.")
    @example(35.2)
    avg_hrv_rmssd?: float;

    @doc("Average HeartRate Variability of the user during the workout, computed using SDNN.")
    @example(45.5)
    avg_hrv_sdnn?: float;

    @doc("Array of time spent in various HR zones throughout the workout.")
    hr_zone_data?: HeartRateZoneData[];

    @doc("Maximum HeartRate of the user during the workout.")
    @example(180.0)
    @minValue(0.0)
    max_hr_bpm?: float;

    @doc("Minimum HeartRate of the user during the workout.")
    @example(85.0)
    @minValue(0.0)
    min_hr_bpm?: float;

    @doc("Resting HeartRate of the user, as determined by the fitness data provider.")
    @example(65.0)
    @minValue(0.0)
    resting_hr_bpm?: float;

    @doc("User's maximum HeartRate based on their age, and other factors as determined by the fitness data provider.")
    @example(190.0)
    user_max_hr_bpm?: float;
}

model ScoresData {
    @doc("Activity score for the given day.")
    @example(92.0)
    @minValue(0.0)
    @maxValue(100.0)
    activity?: float;

    @doc("Recovery score for the given day.")
    @example(78.0)
    @minValue(0.0)
    @maxValue(100.0)
    recovery?: float;

    @doc("Sleep score for the given day, pertaining to the previous night's sleep.")
    @example(85.0)
    @minValue(0.0)
    @maxValue(100.0)
    sleep?: float;
}

model OxygenData {
    @doc("Average Oxygen Saturation percentage of the user during the day (SpO2 or SmO2).")
    @example(98)
    avg_saturation_percentage?: float;

    @doc("Array of Oxygen Saturation percentage datapoints sampled throughout the day.")
    saturation_samples?: OxygenSaturationSample[];

    @doc("Array of VO2 datapoints sampled throughout the day.")
    vo2_samples?: Vo2MaxSample[];

    @doc("VO2Max for the given user.")
    @example(45.5)
    vo2max_ml_per_min_per_kg?: float;
}

model ActiveDurationsData {
    @doc("Array of detailed samples of the intensity the user was in at various points during the workout.")
    activity_levels_samples?: ActivityLevelSample[];

    @doc("Total number of seconds spent in an active state during the workout.")
    @example(1800.0)
    @minValue(0.0)
    activity_seconds?: float;

    @doc("Total number of seconds spent in an inactive state during the workout.")
    @example(600.0)
    @minValue(0.0)
    inactivity_seconds?: float;

    @doc("Total number of seconds spent in a low intensity state during the workout.")
    @example(900.0)
    @minValue(0.0)
    low_intensity_seconds?: float;

    @doc("Total number of seconds spent in a moderate intensity state during the workout.")
    @example(600.0)
    @minValue(0.0)
    moderate_intensity_seconds?: float;

    @doc("Maximum number of continuous periods spent in an inactive state during the workout.")
    @example(3)
    @minValue(0)
    num_continuous_inactive_periods?: integer;

    @doc("Total number of seconds spent resting during the workout.")
    @example(120.0)
    @minValue(0.0)
    rest_seconds?: float;

    @doc("Total number of seconds spent in a state of vigorous intensity during the workout.")
    @example(300.0)
    @minValue(0.0)
    vigorous_intensity_seconds?: float;

    standing_hours_count?: float;
    standing_seconds?: float;
}

model CaloriesData {
    @doc("Basal Metabolic Rate calories - calories burned at rest.")
    BMR_calories?: integer;
    
    @doc("Array of calorie data samples recorded throughout the time period.")
    calorie_samples?: CalorieSample[];
    
    @doc("Net calories burned through activity (excluding BMR).")
    net_activity_calories?: integer;
    
    @doc("Net calories consumed through food and drink intake.")
    net_intake_calories?: integer;
    
    @doc("Total calories burned including BMR and activity.")
    total_burned_calories?: integer;
}

model METData {
    @doc("An array of Metabolic Equivalent Time samples, as calculated by the user's wearable.")
    MET_samples?: METSample[];

    @doc("The average MET level of the activity.")
    @example(3.8)
    avg_level?: float;

    @doc("Number of minutes spent in High Intensity during the workout - based off MET scale.")
    @example(10.0)
    @minValue(0.0)
    num_high_intensity_minutes?: float;

    @doc("Number of minutes spent in state of Inactivity during the workout - based off MET scale.")
    @example(5.0)
    @minValue(0.0)
    num_inactive_minutes?: float;

    @doc("Number of minutes spent in Low Intensity during the workout - based off MET scale.")
    @example(15.0)
    @minValue(0.0)
    num_low_intensity_minutes?: float;

    @doc("Number of minutes spent in Moderate Intensity during the workout - based off MET scale.")
    @example(25.0)
    @minValue(0.0)
    num_moderate_intensity_minutes?: float;
}

model StrainData {
    @doc("Level of cardiovascular strain imposed on the user during the day.")
    @example(14.5)
    strain_level?: float;
}

model DistanceDataDetailed {
    @doc("Array of detailed samples of distance covered throughout the workout.")
    distance_samples?: DistanceSample[];

    @doc("Array of detailed samples of elevation throughout the workout.")
    elevation_samples?: ElevationSample[];

    @doc("Array of detailed samples of floors climbed throughout the workout, as determined by the fitness data provider.")
    floors_climbed_samples?: FloorsClimbedSample[];

    @doc("Array of detailed samples of steps performed throughout the workout.")
    step_samples?: StepSample[];
}

model ElevationData {
    @doc("Average elevation of the user throughout the workout.")
    @example(950.0)
    avg_meters?: float;

    @doc("Actual elevation gain of the user throughout the workout - this includes all elevation gain, and does _not_ represent net gain.")
    @example(550.0)
    @minValue(0.0)
    gain_actual_meters?: float;

    @doc("Planned elevation gain for the workout.")
    @example(500.0)
    @minValue(0.0)
    gain_planned_meters?: float;

    @doc("Elevation loss of the user throughout the workout.")
    @example(450.0)
    @minValue(0.0)
    loss_actual_meters?: float;

    @doc("Maximum elevation of the user during the workout.")
    @example(1200.0)
    max_meters?: float;

    @doc("Minimum elevation of the user during the workout.")
    @example(800.0)
    min_meters?: float;
}

model SwimmingData {
    @doc("Total number of swimming laps performed during the day.")
    @example(20)
    @minValue(0)
    num_laps?: integer;

    @doc("Total number of swimming strokes performed during the day.")
    @example(500)
    @minValue(0)
    num_strokes?: integer;

    @doc("Pool length for associated with the day.")
    @example(25)
    @minValue(0)
    pool_length_meters?: integer;
}
