#!/bin/bash
set -e

PLUGIN_DIR="$HOME/.config/opencode/plugins"
PLUGIN_NAME="opencode-plugin-collection.js"

# If running from a cloned repo (dist/index.js exists or can be built)
if [ -f "dist/index.js" ]; then
  mkdir -p "$PLUGIN_DIR"
  cp dist/index.js "$PLUGIN_DIR/$PLUGIN_NAME"
  echo "Installed $PLUGIN_NAME to $PLUGIN_DIR"
  exit 0
fi

# Otherwise, clone and build
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "Cloning opencode-plugin-collection..."
git clone --depth 1 https://github.com/Commit-Software/opencode-plugin-collection.git "$TEMP_DIR"

echo "Building..."
cd "$TEMP_DIR"
bun install && bun run build

mkdir -p "$PLUGIN_DIR"
cp dist/index.js "$PLUGIN_DIR/$PLUGIN_NAME"
echo "Installed $PLUGIN_NAME to $PLUGIN_DIR"
