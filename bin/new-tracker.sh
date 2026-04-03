#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
exec "$ROOT/skills/dob-crypto-portfolio-tracker/scripts/new-tracker.sh" "$@"
