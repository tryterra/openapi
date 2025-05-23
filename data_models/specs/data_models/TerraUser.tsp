namespace Schemas;

// Terrauser Model
model TerraUser {
    @doc("Terra identifier for the wearable connection")
    @example("123e4567-e89b-12d3-a456-426614174000")
    @minLength(1)
    user_id: string; // not null

    @doc("Connection data source")
    @example("FITBIT")
    @minLength(1)
    provider: string; // not null

    @doc("Last time at which a webhook update was sent for the connection")
    @example("2022-12-12T10:00:00.000000+00:00")
    last_webhook_update?: string;

    @doc("(when available) Permissions granted by the user during authentication - to be used as debugging metadata")
    @example("activity:read,sleep:read")
    scopes?: string;

    @doc("Connection identifier on the developer's end, used to tie connection back to a user on the developer's platform")
    @example("user123@email.com")
    reference_id?: string;

    @doc("whether the user is active or not (inactive users will not receive any data updates and are in considered ")
    @example(true)
    active?: boolean;
}
// End of Terrauser Model
