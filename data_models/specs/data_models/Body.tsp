import "./DataDevice.tsp";
import "./Samples.tsp";
import "./common.tsp";
namespace Terra.Models;

// Body Model
model Body {
    @doc("Object containing information on user's Blood Pressure.")
    blood_pressure_data?: BloodPressureData;

    @doc("Object containing information on the device which recorded data for the payload.")
    device_data?: DeviceData;

    @doc("Object containing information on user's heart metrics.")
    heart_data?: HeartData;

    @doc("Object containing information on user's hydration (both internal & consumption of water) for the day.")
    hydration_data?: HydrationData;

    @doc("Object containing information on user's ketone data for the day.")
    ketone_data?: KetoneData;

    @doc("Object containing information on body measurements for the day.")
    measurements_data?: MeasurementsData;

    @doc("Object containing daily summary metadata.")
    metadata: BodyMetadata;

    @doc("Object containing information on user's oxygen-related data.")
    oxygen_data?: OxygenData;

    @doc("Object containing temperature information (core, skin, ambient) during the day.")
    temperature_data?: TemperatureData;

    @doc("Object containing information on user's blood glucose for the day.")
    glucose_data?: GlucoseData;
}

model GlucoseData {
    @doc("List of blood glucose readings sampled throughout the day.")
    blood_glucose_samples?: GlucoseDataSample[];

    @doc("List of blood glucose readings sampled throughout the day - this represents additional data points, potentially at higher frequency from the ones in blood_glucose_samples, which may come at a cost of reduced accuracy.")
    detailed_blood_glucose_samples?: GlucoseDataSample[];

    @doc("User's average glucose level throughout the day.")
    @example(92.5)
    day_avg_blood_glucose_mg_per_dL?: float;
}
model BloodPressureData {
    @doc("List of Blood Pressure measurements sampled throughout the day.")
    blood_pressure_samples?: BloodPressureSample[];
}

model HeartData {
    @doc("List of Atrial Fibrillation classification measurements sampled through the day.")
    afib_classification_samples?: AFibClassificationSample[];

    @doc("List of ECGReadings sampled through the day.")
    ecg_signal?: ECGReading[];

    @doc("Object containing heart rate data.")
    heart_rate_data?: HeartRateData;

    @doc("List of Pulse Wave Velocity measurements sampled throughout the day. This represents a measurement of arterial stiffness that is an independent predictor of cardiovascular risk.")
    pulse_wave_velocity_samples?: PulseVelocitySample[];

    @doc("List of RR Interval samples throughout the day.")
    rr_interval_samples?: RRInterval[];
}

model HydrationData {
    @doc("User's total water consumption throughout the day.")
    @example(2500.0)
    day_total_water_consumption_ml?: float;

    @doc("User's hydration level samples throughout the day.")
    hydration_amount_samples?: HydrationMeasurementSample[];
}

model KetoneData {
    @doc("List of ketone data sampled through the day.")
    ketone_samples?: KetoneSample[];
}

model MeasurementsData {
    @doc("List of body metrics & measurements taken throughout the associated day.")
    measurements?: MeasurementDataSample[];
}

model BodyMetadata {
    @doc("The end time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h after start_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-10-28T10:00:00.000000+01:00")
    end_time: string;

    @doc("The start time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T09:00:00.000000+02:00")
    start_time: string;

    timestamp_localization?: Terra.Enums.TimestampLocalization;
}

model TemperatureData {
    @doc("List of ambient temperature measurements sampled throughout the day.")
    ambient_temperature_samples?: TemperatureSample[];

    @doc("List of body temperature measurements sampled throughout the day.")
    body_temperature_samples?: TemperatureSample[];

    @doc("List of skin temperature measurements sampled throughout the day.")
    skin_temperature_samples?: TemperatureSample[];
}
// End of Body Model
