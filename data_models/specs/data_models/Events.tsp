import "@typespec/json-schema";
import "./common.tsp";
import "./TerraUser.tsp";
import "./Activity.tsp";
import "./Menstruation.tsp";
import "./Daily.tsp";
import "./Nutrition.tsp";
import "./Athlete.tsp";
import "./Body.tsp";
import "./Sleep.tsp";

namespace Terra.Events;

using Terra.Models;

/**
 * Base webhook event structure that all events extend from
 */
@doc("Base webhook event structure that all events extend from")
@discriminator("type")
model WebhookEvent {
    @doc("The type of event")
    type: string;

    @doc("Status of the event")
    status?: string;
}

@doc("Healthcheck event sent periodically to verify your webhook endpoint is functional")
model HealthcheckEvent extends WebhookEvent {
    type: "healthcheck";

    @doc("Status of the healthcheck")
    status: string;

    @doc("Timestamp when the event was created")
    creation_timestamp: string;

    @doc("Percentage change in trends")
    trend_percentage: integer;

    @doc("Number of webhooks sent in the last hour")
    sent_webhooks_last_hour: integer;
}

@doc("Authentication event")
@discriminator("status")
model AuthEvent extends WebhookEvent {
    type: "auth";

    @doc("Status of the event")
    status: string;
}

@doc("Authentication success event")
model AuthSuccessEvent extends AuthEvent {
    @doc("Status of authentication")
    status: "success";

    @doc("User who authenticated")
    user: TerraUser;

    @doc("Client-provided reference ID")
    reference_id: string;

    @doc("Widget session identifier")
    widget_session_id: string;
}

@doc("Authentication error event")
model AuthErrorEvent extends AuthEvent {
    @doc("Status of authentication")
    status: "error";

    @doc("User who attempted to authenticate")
    user: TerraUser;

    @doc("Provider information")
    provider: string;

    @doc("Error message")
    message: string;

    @doc("Reason for the error")
    reason: string;

    @doc("Client-provided reference ID")
    reference_id: string;

    @doc("Widget session identifier")
    widget_session_id: string;
}

@doc("User deauthentication event")
model DeauthEvent extends WebhookEvent {
    type: "deauth";

    @doc("User who deauthenticated")
    user: TerraUser;

    @doc("Status of deauthentication")
    status: "success";

    @doc("Confirmation message")
    message: string;
}

@doc("User re-authentication event")
model UserReauthEvent extends WebhookEvent {
    type: "user_reauth";

    @doc("The new user record")
    new_user: TerraUser;

    @doc("The old user record that will be deleted")
    old_user: TerraUser;

    @doc("Status of the re-authentication")
    status: "warning";

    @doc("Information about the re-authentication")
    message: string;
}

@doc("Access revoked event when a user revokes access through the provider")
model AccessRevokedEvent extends WebhookEvent {
    type: "access_revoked";

    @doc("User who revoked access")
    user: TerraUser;

    @doc("Status of the event")
    status: "warning";

    @doc("Information about the access revocation")
    message: string;
}

@doc("Connection error event")
model ConnectionErrorEvent extends WebhookEvent {
    type: "connection_error";

    @doc("User with connection issues")
    user: TerraUser;

    @doc("Status of the event")
    status: "warning";

    @doc("Information about the connection issue")
    message: string;
}

@doc("Google no datasource event")
model GoogleNoDatasourceEvent extends WebhookEvent {
    type: "google_no_datasource";

    @doc("Affected user")
    user: TerraUser;

    @doc("Status of the event")
    status: "warning";

    @doc("Information about the issue")
    message: string;
}

@doc("Permission change event")
model PermissionChangeEvent extends WebhookEvent {
    type: "permission_change";

    @doc("User who changed permissions")
    user: TerraUser;

    @doc("Status of the event")
    status: "warning";

    @doc("Information about the permission change")
    message: string;

    @doc("API version")
    version: string;

    @doc("Newly added scopes")
    scopes_added: string;

    @doc("Removed scopes")
    scopes_removed: string;
}

@doc("Processing event returned when data is being fetched asynchronously")
model ProcessingEvent extends WebhookEvent {
    type: "processing";

    @doc("Status of the processing")
    status: "success";

    @doc("Information about the processing")
    message: string;

    @doc("User whose data is being processed")
    user: TerraUser;

    @doc("Seconds to wait before retrying")
    retry_after_seconds: integer;
}

@doc("Large request processing event")
model LargeRequestProcessingEvent extends WebhookEvent {
    type: "large_request_processing";

    @doc("Status of the processing")
    status: "processing";

    @doc("Information about the processing")
    message: string;

    @doc("User whose data is being processed")
    user: TerraUser;

    @doc("Reference ID for tracking this request")
    reference: string;
}

@doc("Large request sending event")
model LargeRequestSendingEvent extends WebhookEvent {
    type: "large_request_sending";

    @doc("User whose data is being sent")
    user: TerraUser;

    @doc("Reference ID for tracking this request")
    reference: string;

    @doc("Information about the request")
    message: string;

    @doc("Number of expected payload events")
    expected_payloads: integer;
}

@doc("Rate limit hit event")
model RateLimitHitEvent extends WebhookEvent {
    type: "rate_limit_hit";

    @doc("User whose request hit rate limits")
    user: TerraUser;

    @doc("Start date of the requested data range")
    start_date: string;

    @doc("End date of the requested data range")
    end_date: string;

    @doc("When the request will be retried")
    retrying_at: string;

    @doc("Information about the rate limit")
    message: string;
}

@doc("Activity data event")
model ActivityEvent extends WebhookEvent {
    type: "activity";

    @doc("Array of activity data")
    data: Activity[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Athlete data event")
model AthleteEvent extends WebhookEvent {
    type: "athlete";

    @doc("Athlete data")
    athlete: Athlete;

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Body data event")
model BodyEvent extends WebhookEvent {
    type: "body";

    @doc("Array of body data")
    data: Body[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Daily data event")
model DailyEvent extends WebhookEvent {
    type: "daily";

    @doc("Array of daily data")
    data: Daily[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Menstruation data event")
model MenstruationEvent extends WebhookEvent {
    type: "menstruation";

    @doc("Array of menstruation data")
    data: Menstruation[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Nutrition data event")
model NutritionEvent extends WebhookEvent {
    type: "nutrition";

    @doc("Array of nutrition data")
    data: Nutrition[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("Sleep data event")
model SleepEvent extends WebhookEvent {
    type: "sleep";

    @doc("Array of sleep data")
    data: Sleep[];

    @doc("User whose data is being provided")
    user: TerraUser;

    @doc("API version")
    version: string;
}

@doc("S3 Upload event with data download URL")
model S3PayloadEvent extends WebhookEvent {
    type: "s3_payload";

    @doc("Status of the upload")
    status: "success";

    @doc("URL to download the data")
    url: string;

    @doc("Time in seconds until URL expiration")
    expires_in: integer;
}

@doc("Union of all possible webhook event types")
@TypeSpec.JsonSchema.oneOf
union WebhookEventType {
    HealthcheckEvent,
    AuthSuccessEvent,
    AuthErrorEvent,
    DeauthEvent,
    UserReauthEvent,
    AccessRevokedEvent,
    ConnectionErrorEvent,
    GoogleNoDatasourceEvent,
    PermissionChangeEvent,
    ProcessingEvent,
    LargeRequestProcessingEvent,
    LargeRequestSendingEvent,
    RateLimitHitEvent,
    ActivityEvent,
    AthleteEvent,
    BodyEvent,
    DailyEvent,
    MenstruationEvent,
    NutritionEvent,
    SleepEvent,
    S3PayloadEvent,
}
