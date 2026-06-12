# Terra OpenAPI Specifications (published artifacts)

This repository contains the **published OpenAPI artifacts** for the Terra API.
It is generated — the source of truth lives in Terra's private engineering
monorepo, and CI pushes updated artifacts here automatically on every change.

**Do not open pull requests against this repository**; they cannot be merged.
To report an inaccuracy in a spec, contact dev@tryterra.co or your Terra
support channel.

## Contents

| Path | What it is |
|---|---|
| `dist/core/v2-bundled.yaml` | The Terra API (served at `https://access.tryterra.co/api/v2`) — self-contained bundle |
| `dist/core/widget-bundled.yaml` | Authentication-widget session API |
| `dist/core/teams-bundled.yaml` | Team-based API |
| `dist/core/rt-bundled.yaml` | Real-Time streaming API |
| `dist/vantage/` | Vantage (blood & DNA) API — published once its first endpoints are documented |
| `schemas/core/*.yaml` | JSON Schema (2020-12) definitions for every Terra data model and webhook event payload — usable for client-side validation and codegen |

Each top-level directory under `dist/` and `schemas/` is owned by one source
repository and synced independently — the layout is uniform per publisher.

All bundles are fully self-contained (no remote `$ref`s) and lint clean against
OpenAPI 3.1. Stable raw URLs:

```
https://raw.githubusercontent.com/tryterra/openapi/refs/heads/master/dist/<namespace>/<name>-bundled.yaml
https://raw.githubusercontent.com/tryterra/openapi/refs/heads/master/schemas/<namespace>/<Model>.yaml
```

## Usage

The bundles can be used for API reference rendering, SDK/client generation,
Postman/Insomnia import, and request/response validation. The `schemas/`
directory is useful for validating webhook payloads against Terra's data
models.

Docs: https://docs.tryterra.co
