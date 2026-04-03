#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PRODUCT_HOME="${HOME}/.dayonebuilder/dob-crypto-portfolio-tracker"
SRC="${PRODUCT_HOME}/assets/crypto-portfolio-tracker-starter.xml"
if [ ! -f "$SRC" ]; then
  SRC="$(cd "$SCRIPT_DIR/.." && pwd)/assets/crypto-portfolio-tracker-starter.xml"
fi
if [ ! -f "$SRC" ]; then
  echo "Tracker workbook asset not found." >&2
  exit 1
fi
TARGET="${1:-$(pwd)/crypto-portfolio-tracker-starter.xml}"
if [ -d "$TARGET" ]; then
  TARGET="$TARGET/crypto-portfolio-tracker-starter.xml"
fi
mkdir -p "$(dirname "$TARGET")"
cp "$SRC" "$TARGET"
echo "Created tracker workbook at: $TARGET"
