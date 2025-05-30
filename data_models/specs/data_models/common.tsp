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

model ScoreData {
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
    avg_saturation_percentage?: float;
    saturation_samples?: OxygenSaturationSample[];
    vo2_samples?: Vo2MaxSample[];
    vo2max_ml_per_min_per_kg?: float;
}

model ActiveDurationsData {
    activity_levels_samples?: ActivityLevelSample[];
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
