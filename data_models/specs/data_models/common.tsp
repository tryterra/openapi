import "./Samples.tsp";
namespace Terra.Models;
using Terra.Models;

model DataContributor {
    contributor_name: string;
    contributor_score: float;
}

model HeartRateData {
    detailed?: HeartRateDataDetailed;
    summary?: HeartRateDataSummary;
}

model HeartRateDataDetailed {
    hr_samples?: HeartRateDataSample[];
    hrv_samples_rmssd?: HeartRateVariabilityDataSampleRMSSD[];
    hrv_samples_sdnn?: HeartRateVariabilityDataSampleSDNN[];
}

model HeartRateDataSummary {
    avg_hr_bpm?: integer;
    avg_hrv_rmssd?: integer;
    avg_hrv_sdnn?: integer;
    hr_zone_data?: HeartRateZoneData[];
    max_hr_bpm?: integer;
    min_hr_bpm?: integer;
    resting_hr_bpm?: integer;
    user_max_hr_bpm?: integer;
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
    BMR_calories?: integer;
    calorie_samples?: CalorieSample[];
    net_activity_calories?: integer;
    net_intake_calories?: integer;
    total_burned_calories?: integer;
}

model METData {
    MET_samples?: METSample[];
    avg_level?: integer;
    num_high_intensity_minutes?: integer;
    num_inactive_minutes?: integer;
    num_low_intensity_minutes?: integer;
    num_moderate_intensity_minutes?: integer;
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

    @doc("Planned elevation gain for the workout.")
    @example(550.0)
    @minValue(0.0)
    gain_actual_meters?: float;

    @doc("Elevation gain of the user throughout the workout - this includes all elevation gain, and does _not_ represent net gain.")
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
