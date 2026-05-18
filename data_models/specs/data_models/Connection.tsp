namespace Terra.Models;

// Connection Model
//
// v3-native connection block, used in place of the legacy `user` block on
// v3 endpoint responses. Identifies a single connected provider account
// for an end user.
model Connection {
    @doc("Terra connection ID.")
    @example(75001)
    id: integer;

    @doc("External user identifier provided at connect time.")
    @example("user_external_ref_123")
    reference_id?: string;

    @doc("RFC3339 timestamp of when the connection was first authorised.")
    @example("2026-04-22T11:00:00Z")
    created_at: string;

    @doc("Uppercase provider slug, e.g. MIRA or FITBIT.")
    @example("MIRA")
    provider: string;

    @doc("RFC3339 timestamp of the last poll Terra ran against the provider for this connection. May be null for webhook-only flows.")
    last_polled_at?: string;

    @doc("RFC3339 timestamp of the last time Terra received any data from the provider for this connection.")
    last_updated_at?: string;

    @doc("RFC3339 timestamp of the most recent stored sample. May lag last_updated_at when fetches return no new data.")
    most_recent_data_at?: string;

    @doc("Granted OAuth scopes. Empty array for providers without scopes (e.g. Mira).")
    scopes: string[];
}
// End of Connection Model
