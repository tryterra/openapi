#!/bin/bash
# Promotes the generated JSON schemas to the repo-root schemas/ directory.
#
# The @typespec/json-schema emitter requires @jsonSchema() to be a valid
# absolute URL, so main.tsp keeps a github raw base. We rewrite that base out
# here so the promoted schemas use bare relative sibling refs ($ref: Foo.yaml)
# and carry no $id. This keeps the spec hermetic: `redocly bundle` resolves the
# whole graph from local files with no network access, and old checkouts no
# longer resolve against master HEAD. See analysis/openapi-v6-surface-analysis.md §8.
set -euo pipefail

BASE="https://raw.githubusercontent.com/tryterra/openapi/refs/heads/master/schemas/"
SRC="tsp-output/@typespec/json-schema"
DEST="../schemas"

rm -rf "$DEST"/*
cp "$SRC"/*.yaml "$DEST"/

python3 - "$DEST" "$BASE" <<'PY'
import glob, os, sys
dest, base = sys.argv[1], sys.argv[2]
for f in glob.glob(os.path.join(dest, "*.yaml")):
    out = []
    for ln in open(f):
        if ln.startswith("$id:"):          # drop absolute $id; refs resolve by file path
            continue
        out.append(ln.replace(base, ""))   # remote $ref base -> bare relative sibling
    open(f, "w").write("".join(out))
PY

# Guard: no promoted schema may carry the remote base anymore.
if grep -rl "raw.githubusercontent.com/tryterra/openapi" "$DEST" >/dev/null 2>&1; then
  echo "ERROR: promoted schemas still contain remote refs" >&2
  grep -rl "raw.githubusercontent.com/tryterra/openapi" "$DEST" >&2
  exit 1
fi
echo "Promoted $(ls "$DEST"/*.yaml | wc -l | tr -d ' ') schemas with local relative refs."
