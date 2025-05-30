import "./Samples.tsp";
import "./common.tsp";
import "./DataDevice.tsp";
namespace Terra.Models;
using Terra.Models;

// Daily Model
model Daily {
    active_durations_data?: ActiveDurationsData;
    calories_data?: CaloriesData;
    data_enrichment?: DailyDataEnrichment;
    device_data?: DeviceData;
    distance_data?: DailyDistanceData;
    heart_rate_data?: HeartRateData;
    MET_data?: METData;
    metadata: DailyMetadata;
    oxygen_data?: OxygenData;
    scores?: ScoresData;
    strain_data?: StrainData;
    stress_data?: StressData;
    tag_data?: TagData;
}

model DailyMetadata {
    end_time: string;
    start_time: string;
    timestamp_localization?: integer;
    upload_type: Terra.Enums.UploadType;
}

model DailyDistanceData {
    detailed?: DistanceDataDetailed;
    distance_meters?: integer;
    elevation?: ElevationData;
    floors_climbed?: integer;
    steps?: integer;
    swimming?: SwimmingData;
}

model DailyDataEnrichment {
    cardiovascular_contributors?: DataContributor[];
    cardiovascular_score?: float;
    immune_contributors?: DataContributor[];
    immune_index?: float;
    readiness_contributors?: DataContributor[];
    readiness_score?: float;
    respiratory_contributors?: DataContributor[];
    respiratory_score?: float;
    start_time?: string;
    stress_contributors?: DataContributor[];
    total_stress_score?: float;
}

model StressData {
    activity_stress_duration_seconds?: float;
    avg_stress_level?: float;
    body_battery_samples?: BodyBatterySample[];
    high_stress_duration_seconds?: float;
    low_stress_duration_seconds?: float;
    max_stress_level?: float;
    medium_stress_duration_seconds?: float;
    rest_stress_duration_seconds?: float;
    samples?: StressSample[];
    stress_duration_seconds?: float;
    stress_rating?: float;
}

model TagData {
    tags?: TagEntry[];
}

// End of daily model
