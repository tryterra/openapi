import "./DataDevice.tsp";
namespace Terra.Models;

// Athlete Model
model Athlete {
    age?: int32;
    country?: string;
    bio?: string;
    state?: string;
    last_name?: string;
    sex?: string;
    city?: string;
    email?: string;
    date_of_birth?: string;
    first_name?: string;
    gender?: string;
    joined_provider?: string;
    devices?: DeviceData[];
}
// End of Athlete Model
