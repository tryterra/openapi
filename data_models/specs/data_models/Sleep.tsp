import "./DataDevice.tsp";
import "./enums.tsp";
import "./Samples.tsp";
import "./common.tsp";
namespace Terra.Models;

model Sleep {
    data_enrichment?: SleepDataEnrichment;
    device_data?: DeviceData;
    heart_rate_data?: HeartRateData;
    metadata: SleepMetadata;
    readiness_data?: ReadinessData;
    respiration_data?: RespirationData;
    scores?: Scores;
    sleep_durations_data?: SleepDurationsData;
    temperature_data?: SleepTemperatureData;
}

model SleepMetadata {
    end_time: string;
    start_time: string;
    is_nap?: boolean;
    summary_id?: string;
    timestamp_localization?: integer;
    upload_type: Terra.Enums.SleepUploadType;
}

model SleepDataEnrichment {
    sleep_contributors?: DataContributor[];
    sleep_score?: integer;
}

model ReadinessData {
    readiness?: integer;
    recovery_level?: Terra.Enums.RecoveryLevel;
}

model RespirationData {
    breaths_data?: BreathsData;
    oxygen_saturation_data?: OxygenSaturationData;
    snoring_data?: SnoringData;
}

model BreathsData {
    avg_breaths_per_min?: integer;
    end_time?: string;
    max_breaths_per_min?: integer;
    min_breaths_per_min?: integer;
    on_demand_reading?: boolean;
    samples?: BreathSample[];
    start_time?: string;
}

model OxygenSaturationData {
    avg_saturation_percentage?: integer;
    end_time?: string;
    samples?: OxygenSaturationSample[];
    start_time?: string;
}

model SnoringData {
    end_time?: string;
    num_snoring_events?: integer;
    samples?: SnoringSample[];
    start_time?: string;
    total_snoring_duration_seconds?: integer;
}

model SleepDurationsData {
    asleep?: AsleepDurations;
    awake?: AwakeDurations;
    hypnogram_samples?: SleepHypnogramSample[];
    other?: OtherSleepDurations;
    sleep_efficiency?: integer;
}

model AsleepDurations {
    duration_asleep_state_seconds?: integer;
    duration_deep_sleep_state_seconds?: integer;
    duration_light_sleep_state_seconds?: integer;
    duration_REM_sleep_state_seconds?: integer;
    num_REM_events?: integer;
}

model AwakeDurations {
    duration_awake_state_seconds?: integer;
    duration_long_interruption_seconds?: integer;
    duration_short_interruption_seconds?: integer;
    num_out_of_bed_events?: integer;
    num_wakeup_events?: integer;
    sleep_latency_seconds?: integer;
    wake_up_latency_seconds?: integer;
}

model OtherSleepDurations {
    duration_in_bed_seconds?: integer;
    duration_unmeasurable_sleep_seconds?: integer;
}

model SleepTemperatureData {
    delta?: integer;
}
