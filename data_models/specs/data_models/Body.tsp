import "./DataDevice.tsp";
import "./Samples.tsp";
import "./common.tsp";
namespace Terra.Models;

// Body Model
model Body {
    blood_pressure_data?: BloodPressureData;
    device_data?: DeviceData;
    heart_data?: HeartData;
    hydration_data?: HydrationData;
    ketone_data?: KetoneData;
    measurements_data?: MeasurementsData;
    metadata: BodyMetadata;
    oxygen_data?: OxygenData;
    temperature_data?: TemperatureData;
}

model BloodPressureData {
    blood_pressure_samples?: BloodPressureSample[];
}

model HeartData {
    afib_classification_samples?: AFibClassificationSample[];
    ecg_signal?: ECGReading[];
    heart_rate_data?: HeartRateData;
    pulse_wave_velocity_samples?: PulseVelocitySample[];
    rr_interval_samples?: RRInterval[];
}

model HydrationData {
    day_total_water_consumption_ml?: integer;
    hydration_amount_samples?: HydrationLevelSample[];
    hydration_level_samples?: HydrationMeasurementSample[];
}

model KetoneData {
    ketone_samples?: KetoneSample[];
}

model MeasurementsData {
    measurements?: MeasurementDataSample[];
}

model BodyMetadata {
    end_time: string;
    start_time: string;
}

model TemperatureData {
    ambient_temperature_samples?: TemperatureSample[];
    body_temperature_samples?: TemperatureSample[];
    skin_temperature_samples?: TemperatureSample[];
    day_avg_blood_glucose_mg_per_dL?: integer;
    daily_patterns?: DailyPatternSample[];
    detailed_blood_glucose_samples?: GlucoseDataSample[];
    gmi?: float; // what is this?
    sensor_usage?: integer;
    time_in_range?: integer;
}
// End of Body Model
