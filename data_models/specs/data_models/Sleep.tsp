import "./DataDevice.tsp";
import "./enums.tsp";
import "./Samples.tsp";
import "./common.tsp";
namespace Terra.Models;

model Sleep {
    @doc("Object containing additional enrichment data for the sleep session.")
    data_enrichment?: SleepDataEnrichment;

    @doc("Object containing information on the device which recorded data for the payload.")
    device_data?: DeviceData;

    @doc("Object containing information on the user's heart rate during the sleep session.")
    heart_rate_data?: HeartRateData;

    @doc("Object containing daily summary metadata.")
    metadata: SleepMetadata;

    @doc("Object containing information on the user's readiness for the day, based off the quality and duration of their sleep.")
    readiness_data?: ReadinessData;

    @doc("Object containing information on the user's respiration throughout the sleep session.")
    respiration_data?: RespirationData;

    @doc("User's sleep score")
    scores?: {
        @doc("User's sleep score.")
        sleep_score?: float;
    };

    @doc("Object containing information on the user's duration spent in various sleep stages.")
    sleep_durations_data?: SleepDurationsData;

    @doc("Object containing body temperature information of the user during the sleep recording session.")
    temperature_data?: SleepTemperatureData;
}

model SleepMetadata {
    @doc("The end time of the associated sleep session, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-24T08:00:00.000000+01:00")
    end_time: string;

    @doc("Flag indicating whether the sleep session was a nap, or the user's main sleep session for the day.")
    @example(false)
    is_nap?: boolean;

    @doc("The start time of the associated sleep session, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T22:00:00.000000+02:00")
    start_time: string;

    @doc("A unique identifier for the sleep session.")
    summary_id?: string;

    timestamp_localization?: Terra.Enums.TimestampLocalization;

    @doc("The upload type for the associated sleep session, providing information on whether this was an automatic sleep or user-entered.")
    @example(1)
    upload_type: Terra.Enums.SleepUploadType;
}

model SleepDataEnrichment {
    sleep_contributors?: DataContributor[];
    sleep_score?: float;
}

model ReadinessData {
    @doc("User's readiness score for a given day, resulting from the sleep session.")
    @example(85)
    @minValue(0)
    @maxValue(100)
    readiness?: integer;

    @doc("User's recovery score for a given day, resulting from the sleep session - takes Enum value.")
    recovery_level?: Terra.Enums.RecoveryLevel;
}

model RespirationData {
    @doc("Object containing information on breathing rate for the sleep session.")
    breaths_data?: BreathsData;

    @doc("Object containing information on saturation metrics for the sleep session.")
    oxygen_saturation_data?: OxygenSaturationData;

    @doc("Object containing information on snoring metrics for the sleep session.")
    snoring_data?: SnoringData;
}

model BreathsData {
    @doc("Average breathing rate of the user during the sleep session.")
    @example(14.0)
    avg_breaths_per_min?: float;

    @doc("Maximum breathing rate of the user during the sleep session.")
    @example(18.0)
    max_breaths_per_min?: float;

    @doc("Minimum breathing rate of the user during the sleep session.")
    @example(10.0)
    min_breaths_per_min?: float;

    @doc("Flag indicating if the reading was performed on demand, or if it was automatically captured by the device.")
    @example(false)
    on_demand_reading?: boolean;

    @doc("List of breathing rate information sampled throughout the sleep session.")
    samples?: BreathSample[];

    @doc("The start time of the recording of breathing rate data, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T22:00:00.000000+02:00")
    start_time?: string;

    @doc("The end time of the recording of breathing rate data, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-24T08:00:00.000000+01:00")
    end_time?: string;
}

model OxygenSaturationData {
    @doc("Average Oxygen Saturation percentage of the user during the sleep session.")
    @example(97.0)
    avg_saturation_percentage?: float;

    @doc("The end time of the recording of oxygen saturation, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-24T08:00:00.000000+01:00")
    end_time?: string;

    @doc("Array of Oxygen Saturation percentage datapoints sampled throughout the sleep session.")
    samples?: OxygenSaturationSample[];

    @doc("The start time of the recording of oxygen saturation, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T22:00:00.000000+02:00")
    start_time?: string;
}

model SnoringData {
    @doc("The start time of the recording of snoring data, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T22:00:00.000000+02:00")
    start_time?: string;

    @doc("The end time of the recording of snoring data, in ISO8601 format with microsecond precision. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-11-24T08:00:00.000000+01:00")
    end_time?: string;

    @doc("Number of times over the sleep period when the user started snoring, as determined by the device.")
    @example(12)
    num_snoring_events?: integer;

    @doc("List of snoring information data points sampled throughout the sleep session.")
    samples?: SnoringSample[];

    @doc("Total duration for which the user was snoring.")
    @example(3600.0)
    total_snoring_duration_seconds?: float;
}

model SleepDurationsData {
    @doc("Object containing information on the duration the user spent asleep during the sleep recording session.")
    asleep?: AsleepDurations;

    @doc("Object containing information on the duration the user spent awake during the sleep recording session.")
    awake?: AwakeDurations;

    @doc("List of sleep stage (Hypnogram) samples recorded during the user's sleep session.")
    hypnogram_samples?: SleepHypnogramSample[];

    @doc("Object containing information on the miscellaneous duration data for the sleep recording session.")
    other?: OtherSleepDurations;

    @doc("Sleep efficiency of the user given as a percentage, measured as time spent asleep divided by time spent in bed.")
    @example(87.5)
    @minValue(0.0)
    @maxValue(100.0)
    sleep_efficiency?: float;
}

model AsleepDurations {
    @doc("Total duration for which the user was asleep, in any state.")
    @example(25200.0)
    duration_asleep_state_seconds?: float;

    @doc("Total duration for which the user was in a state of deep sleep.")
    @example(5400.0)
    duration_deep_sleep_state_seconds?: float;

    @doc("Total duration for which the user was in a state of light sleep.")
    @example(14400.0)
    duration_light_sleep_state_seconds?: float;

    @doc("Total duration for which the user was in a state of REM sleep.")
    @example(5400.0)
    duration_REM_sleep_state_seconds?: float;

    @doc("Number of periods of REM sleep captured during the sleep session.")
    @example(4)
    num_REM_events?: integer;
}

model AwakeDurations {
    @doc("Total duration for which the user was awake during the sleep session.")
    @example(1200.0)
    duration_awake_state_seconds?: float;

    @doc("Total duration for which the user was awake during the sleep session, when the interruption of their sleep was greater than 90 seconds.")
    @example(600.0)
    duration_long_interruption_seconds?: float;

    @doc("Total duration for which the user was awake during the sleep session, when the interruption of their sleep was less than 90 seconds.")
    @example(180.0)
    duration_short_interruption_seconds?: float;

    @doc("Number of times the user got out of bed during the sleep session.")
    @example(1)
    num_out_of_bed_events?: integer;

    @doc("Number of times the user woke up during the sleep session.")
    @example(3)
    num_wakeup_events?: integer;

    @doc("Sleep latency, defined as time between the moment the user lays in bed with the intention to sleep and the moment they actually fall asleep.")
    @example(900.0)
    sleep_latency_seconds?: float;

    @doc("Wake up latency, defined as time between the moment the user wakes up and the moment they get out of bed.")
    @example(300.0)
    wake_up_latency_seconds?: float;
}

model OtherSleepDurations {
    @doc("Total duration of time spent in bed.")
    @example(28800.0)
    duration_in_bed_seconds?: float;

    @doc("Total duration during which the user's state (awake, asleep, REM, etc) was unmeasurable during the sleep session.")
    @example(300.0)
    duration_unmeasurable_sleep_seconds?: float;
}

model SleepTemperatureData {
    @doc("Variation in user's skin temperature from their baseline.")
    @example(0.5)
    delta?: float;
}
