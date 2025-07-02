import "./Samples.tsp";
import "./common.tsp";
import "./DataDevice.tsp";
namespace Terra.Models;
using Terra.Models;

// Daily Model
model Daily {
    @doc("Object containing information related to the time spent in different activity intensities during over the day.")
    active_durations_data?: ActiveDurationsData;

    @doc("Object containing calorie-related information for the user during the specific day.")
    calories_data?: CaloriesData;

    @doc("Object containing additional enrichment data for the day.")
    data_enrichment?: DailyDataEnrichment;

    @doc("Object containing information on the device which recorded data for the day.")
    device_data?: DeviceData;

    @doc("Object containing information related to distance covered during the associated day.")
    distance_data?: DailyDistanceData;

    @doc("Object containing heartrate-related information for the day.")
    heart_rate_data?: HeartRateData;

    @doc("Object containing information on the Metabolic Equivalent of Task for the day.")
    MET_data?: METData;

    @doc("Object containing daily summary metadata.")
    metadata: DailyMetadata;

    @doc("Object containing information on oxygen-related metrics for the day.")
    oxygen_data?: OxygenData;

    @doc("Scores for the user's performance on different metrics for the given day, as calculated by the fitness data provider.")
    scores?: ScoresData;

    @doc("Object containing information on the strain put on the user's body over a day.")
    strain_data?: StrainData;

    @doc("Object containing information on the stress put on the user over a day.")
    stress_data?: StressData;

    @doc("Object containing all user-entered or automatically tagged events in the day.")
    tag_data?: TagData;
}

model DailyMetadata {
    @doc("The end time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h after start_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-10-28T10:00:00.000000+01:00")
    end_time: string;

    @doc("The start time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T09:00:00.000000+02:00")
    start_time: string;

    timestamp_localization?: Terra.Enums.TimestampLocalization;

    @doc("The upload type for data in the associated day, providing information on whether data was automatically uploaded or user-entered. If any data point in a day is altered, the day should be classed as manual.")
    upload_type: Terra.Enums.UploadType;
}

model DailyDistanceData {
    @doc("Object containing detailed distance information - this may include second-by-second samples.")
    detailed?: DistanceDataDetailed;

    @doc("Total distance covered by the user throughout the day.")
    @example(8500)
    distance_meters?: integer;

    @doc("Object containing information on the elevation of the user throughout the day.")
    elevation?: ElevationData;

    @doc("Total number of elevation gain in floors climbed equivalent throughout the day, as determined by the fitness data provider.")
    @example(15)
    @minValue(0)
    floors_climbed?: integer;

    @doc("Total number of steps performed during the day.")
    @example(12000)
    steps?: integer;

    @doc("Summary information of the user's swimming statistics for the day, if applicable.")
    swimming?: SwimmingData;
}

model DailyDataEnrichment {
    @doc("Array of factors contributing to cardiovascular score.")
    cardiovascular_contributors?: DataContributor[];
    
    @doc("Cardiovascular health score for the day.")
    cardiovascular_score?: float;
    
    @doc("Array of factors contributing to immune index.")
    immune_contributors?: DataContributor[];
    
    @doc("Immune system health index for the day.")
    immune_index?: float;
    
    @doc("Array of factors contributing to readiness score.")
    readiness_contributors?: DataContributor[];
    
    @doc("Readiness score for the day.")
    readiness_score?: float;
    
    @doc("Array of factors contributing to respiratory score.")
    respiratory_contributors?: DataContributor[];
    
    @doc("Respiratory health score for the day.")
    respiratory_score?: float;
    
    @doc("Start time for the data enrichment calculation period.")
    start_time?: string;
    
    @doc("Array of factors contributing to stress score.")
    stress_contributors?: DataContributor[];
    
    @doc("Total stress score for the day.")
    total_stress_score?: float;
}

model StressData {
    @doc("Average stress level for the day.")
    @example(45.5)
    avg_stress_level?: float;

    @doc("Total number of seconds spent in a stressed state while active during the day.")
    @example(3600.0)
    @minValue(0.0)
    activity_stress_duration_seconds?: float;

    @doc("Total number of seconds spent in a state of low stress during the day.")
    @example(28800.0)
    @minValue(0.0)
    low_stress_duration_seconds?: float;

    @doc("Maximum stress level recorded during the day.")
    @example(85.0)
    max_stress_level?: float;

    @doc("Total number of seconds spent in a state of medium stress during the day.")
    @example(7200.0)
    @minValue(0.0)
    medium_stress_duration_seconds?: float;

    @doc("Array of stress level data points sampled throughout the day.")
    samples?: StressSample[];

    @doc("Total number of seconds spent in a stressed state while at rest during the day.")
    @example(1800.0)
    @minValue(0.0)
    rest_stress_duration_seconds?: float;

    @doc("Total number of seconds spent in a state of high stress during the day.")
    @example(900.0)
    @minValue(0.0)
    high_stress_duration_seconds?: float;

    @doc("Total number of seconds spent in any stressed state during the day.")
    @example(5400.0)
    @minValue(0.0)
    stress_duration_seconds?: float;

    @doc("Stress rating for the day.")
    stress_rating?: Terra.Enums.StressLevel;

    @doc("Array of Body Battery data points sampled throughout the day.")
    body_battery_samples?: BodyBatterySample[];
}

model TagData {
    @doc("Array of user-entered tags for the day.")
    tags?: TagEntry[];
}

// End of daily model
