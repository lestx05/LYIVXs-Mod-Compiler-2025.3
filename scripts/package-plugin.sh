#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN_DIR="$ROOT_DIR/plugin"
DIST_DIR="$ROOT_DIR/dist"
ZIP_NAME="${ZIP_NAME:-lyivxs-mod-compiler-2025.3-forge-1.20.1.zip}"
ZIP_PATH="$DIST_DIR/$ZIP_NAME"

for required_file in "$PLUGIN_DIR/plugin.json" "$PLUGIN_DIR/apis/use_compiled_mods.yaml"; do
  if [[ ! -f "$required_file" ]]; then
    echo "Missing ${required_file#$ROOT_DIR/}" >&2
    exit 1
  fi
done

mkdir -p "$DIST_DIR"
rm -f "$ZIP_PATH"

cd "$PLUGIN_DIR"
zip -qr "$ZIP_PATH" . -x "*.DS_Store" "__MACOSX/*"

echo "Created $ZIP_PATH"
