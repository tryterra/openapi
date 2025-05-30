import "./enums.tsp";
namespace Terra.Models;

// Device Data Model
model DeviceData {
    @doc("Activation timestamp of the device, if applicable.")
    @example("2022-12-25T00:00:00.000000+05:00")
    activation_timestamp?: string;

    @doc("Data provided by the device, as enumerated types.")
    data_provided?: Terra.Enums.DeviceDataType[];

    @doc("Hardware version of the device.")
    @example("v2.1")
    hardware_version?: string;

    @doc("Last upload date from the device.")
    last_upload_date?: string;

    @doc("Device manufacturer name.")
    @example("Garmin")
    manufacturer?: string;

    @doc("Device name - note that this can also be the name of the application/package which the data comes from, if coming from a data aggregator such as Google Fit.")
    @example("Forerunner 945")
    name?: string;

    @doc("Data pertaining to other devices which may have contributed data for this workout.")
    other_devices?: OtherDeviceData[];

    @doc("Sensor state of the device.")
    sensor_state?: string;

    @doc("Device Serial Number.")
    @example("GR123456789")
    serial_number?: string;

    @doc("Device Software Version.")
    @example("5.2.1")
    software_version?: string;
}

model OtherDeviceData {
    @doc("Device manufacturer name.")
    @example("Garmin")
    manufacturer?: string;

    @doc("Hardware version of the device.")
    @example("v2.1")
    hardware_version?: string;

    @doc("Device Serial Number.")
    @example("GR123456789")
    serial_number?: string;

    @doc("Device name - note that this can also be the name of the application/package which the data comes from, if coming from a data aggregator such as Google Fit.")
    @example("Forerunner 945")
    name?: string;

    @doc("Device Software Version.")
    @example("5.2.1")
    software_version?: string;

    activation_timestamp?: string;
    data_provided?: Terra.Enums.DeviceDataType[];
    last_upload_date?: string;
}
// End of Device Data Model
