#!/usr/bin/env bash
set -euo pipefail
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${SKILL_DIR}/assets/crypto-portfolio-tracker-starter.xml"
if [ ! -f "$SRC" ]; then
  echo "Tracker workbook asset not found: $SRC" >&2
  exit 1
fi
TARGET="${1:-$(pwd)/crypto-portfolio-tracker-starter.xml}"
if [ -d "$TARGET" ]; then
  TARGET="$TARGET/crypto-portfolio-tracker-starter.xml"
fi
mkdir -p "$(dirname "$TARGET")"
cp "$SRC" "$TARGET"
echo "Created tracker workbook at: $TARGET"
