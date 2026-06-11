#!/bin/bash
# Bundle every API listed in redocly.yaml to dist/<name>-bundled.yaml.
# Registry-driven: adding an API to redocly.yaml's `apis:` is all that's needed —
# no workflow edits. Bundles are self-contained (schemas + components inlined).
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p dist
# REDOCLY defaults to the global `redocly` (CI installs it globally); override
# locally with REDOCLY="npx redocly".
REDOCLY="${REDOCLY:-redocly}"
names=$(python3 -c "import yaml,sys; print('\n'.join(yaml.safe_load(open('redocly.yaml'))['apis'].keys()))")

for n in $names; do
  echo "bundling $n -> dist/${n}-bundled.yaml"
  $REDOCLY bundle "$n" -o "dist/${n}-bundled.yaml"
done
