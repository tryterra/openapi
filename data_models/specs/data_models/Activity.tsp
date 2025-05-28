import "./Samples.tsp";
import "./DataDevice.tsp";
import "./common.tsp";
namespace Terra.Models;

// Activity Model
model Activity {
    active_durations_data?: ActiveDurationsData;
    calories_data?: CaloriesData;
    cheat_detection?: float;
    data_enrichment?: DataEnrichment;
    device_data?: DeviceData;
    distance_data?: DistanceData;
    energy_data?: EnergyData;
    heart_rate_data?: HeartRateData;
    lap_data?: LapData;
    MET_data?: METData;
    metadata: ActivityMetadata;
    movement_data?: MovementData;
    oxygen_data?: OxygenData;
    polyline_map_data?: PolylineMapData;
    position_data?: PositionData;
    power_data?: PowerData;
    strain_data?: StrainData;
    TSS_data?: TSSData;
    work_data?: WorkData;
}

model DataEnrichment {
    stress_score?: integer;
}

model DistanceData {
    detailed?: DistanceDataDetailed;
    summary?: DistanceDataSummary;
}

model DistanceDataSummary {
    distance_meters?: integer;
    elevation?: ElevationData;
    floors_climbed?: integer;
    steps?: integer;
    swimming?: SwimmingData;
}

model EnergyData {
    energy_kilojoules?: integer;
    energy_planned_kilojoules?: integer;
}

model LapData {
    laps?: LapSample[];
}

model ActivityMetadata {
    city?: string;
    country?: string;
    end_time: string;
    name?: string;
    start_time: string;
    state?: string;
    summary_id: string;
    timestamp_localization?: integer; // what is this?
    type: ActivityType;
    upload_type: UploadType;
}

model MovementData {
    adjusted_max_speed_meters_per_second?: float;
    avg_cadence_rpm?: float;
    avg_pace_minutes_per_kilometer?: float;
    avg_speed_meters_per_second?: float;
    avg_torque_newton_meters?: float;
    avg_velocity_meters_per_second?: float;
    cadence_samples?: CadenceSample[];
    max_cadence_rpm?: float;
    max_pace_minutes_per_kilometer?: float;
    max_speed_meters_per_second?: float;
    max_torque_newton_meters?: float;
    max_velocity_meters_per_second?: float;
    normalized_speed_meters_per_second?: float;
    speed_samples?: SpeedSample[];
    torque_samples?: TorqueSample[];
}

model PolylineMapData {
    summary_polyline?: string;
}

model PositionData {
    center_pos_lat_lng_deg?: float[];
    end_pos_lat_lng_deg?: float[];
    position_samples?: PositionSample[];
    start_pos_lat_lng_deg?: float[];
}

model PowerData {
    avg_watts?: float;
    max_watts?: float;
    power_samples?: PowerSample[];
}

model TSSData {
    TSS_samples?: TSSSample[];
}

model WorkData {
    work_kilojoules?: float;
}
// End of Activity Model
