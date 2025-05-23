import "./enums.tsp";
namespace Schemas;

// Device Data Model
model DeviceData {
    activation_timestamp?: string;
    data_provided?: DeviceDataType[];
    hardware_version?: string;
    last_upload_date?: string;
    manufacturer?: string;
    name?: string;
    other_devices?: OtherDeviceData[];
    sensor_state?: string;
    serial_number?: string;
    software_version?: string;
}

model OtherDeviceData {
    activation_timestamp?: string;
    data_provided?: DeviceDataType[];
    hardware_version?: string;
    last_upload_date?: string;
    manufacturer?: string;
    name?: string;
    serial_number?: string;
    software_version?: string;
}
// End of Device Data Model
