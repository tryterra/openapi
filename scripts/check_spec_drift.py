#!/usr/bin/env python3
"""Compare apis/v2.yaml's documented paths against the live v2 route inventory.

The inventory is produced by the terra-v6 route-inventory golden test
(services/api/internal/endpoints/v2/route_inventory.json). In CI a scheduled
job fetches that file from terra-v6 and runs this script; locally, pass --inventory.

Exit non-zero (a real drift signal) only when the spec documents a path that the
router does not serve — a spec that lies to customers. Undocumented public-looking
routes are reported for triage but do not fail, since adding an endpoint to the
spec is a deliberate compatibility decision.

See support-agent analysis/openapi-v6-surface-analysis.md §8.3.
"""
import argparse
import json
import re
import sys

import yaml

# Router path prefixes that are internal/admin/proxy/beta and are intentionally
# NOT part of the published v2 spec. A route under one of these is never reported
# as an "undocumented public" candidate.
INTERNAL_PREFIXES = (
    "/dashboard", "/agents", "/partners", "/synthetic", "/migrate",
    "/oauth/callback", "/mcp", "/teams", "/normalize", "/hooks",
    "/workouts", "/plannedWorkouts", "/routes", "/pushedRoutes",
    "/lab-reports", "/data-links", "/ai-context", "/chat",
    "/sdk", "/coverage", "/preflight", "/backfills",
    "/auth/zepp", "/auth/initSDK", "/auth/authenticateSDKUser",
    "/auth/subscribe", "/providers",
)


def spec_paths(spec_file):
    doc = yaml.safe_load(open(spec_file))
    # normalise {param} placeholders to a canonical token for comparison
    out = set()
    for p in doc.get("paths", {}):
        out.add(re.sub(r"\{[^}]+\}", "{}", p))
    return out


def router_paths(inventory_file):
    routes = json.load(open(inventory_file))
    out = set()
    for r in routes:
        _, path = r.split(" ", 1)
        out.add((path, re.sub(r"\{[^}]+\}", "{}", path)))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--spec", default="apis/v2.yaml")
    ap.add_argument("--inventory", required=True,
                    help="path to terra-v6 route_inventory.json")
    args = ap.parse_args()

    spec = spec_paths(args.spec)
    routes = router_paths(args.inventory)
    route_norm = {n for _, n in routes}

    # (A) documented but not served — the failing condition
    lies = sorted(p for p in spec if p not in route_norm)

    # (B) public-looking router paths not in the spec — informational
    undocumented = sorted(
        raw for raw, norm in routes
        if norm not in spec and not raw.startswith(INTERNAL_PREFIXES)
    )

    if undocumented:
        print("Undocumented public-looking v2 routes (triage — not a failure):")
        for p in undocumented:
            print(f"  ? {p}")
        print()

    if lies:
        print("ERROR: spec documents paths the v2 router does not serve:")
        for p in lies:
            print(f"  - {p}")
        print("\nFix the spec (remove/relocate) or the router.")
        return 1

    print(f"OK: all {len(spec)} documented paths are served by the v2 router.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
