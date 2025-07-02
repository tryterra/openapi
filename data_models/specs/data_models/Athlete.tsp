import "./DataDevice.tsp";
namespace Terra.Models;

// Athlete Model
model Athlete {
    @doc("User's age.")
    @example(28)
    age?: integer;

    @doc("User's country of residence.")
    @example("United States")
    country?: string;

    @doc("User's bio - a short description they display on their profile.")
    @example("Passionate runner and cyclist")
    bio?: string;

    @doc("User's state of residence.")
    @example("California")
    state?: string;

    @doc("User's last name.")
    @example("Smith")
    last_name?: string;

    @doc("User's sex.")
    @example("male")
    sex?: string;

    @doc("User's city of residence.")
    @example("San Francisco")
    city?: string;

    @doc("User's email.")
    @example("user@example.com")
    email?: string;

    @doc("User's date of birth, in ISO8601 format.")
    @example("1999-11-23")
    date_of_birth?: string;

    @doc("User's first name.")
    @example("John")
    first_name?: string;

    @doc("User's gender.")
    @example("male")
    gender?: string;

    @doc("User's account creation date.")
    @example("2023-01-15")
    joined_provider?: string;

    @doc("Array of devices associated with the user's account.")
    devices?: DeviceData[];
}
// End of Athlete Model
