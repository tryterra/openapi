namespace Schemas;

// Terrauser Model
model TerraUser {
    @minLength(1) user_id: string; // not null
    @minLength(1) provider: string; // not null
    last_webhook_update?: string;
    scopes?: string;
    reference_id?: string;
    active?: boolean;
}
// End of Terrauser Model
