#!/usr/bin/env bash
set -euo pipefail
rm -rf "${HOME}/.agents/skills/dob-crypto-portfolio-tracker"                "${HOME}/.claude/skills/dob-crypto-portfolio-tracker"                "${HOME}/.dayonebuilder/dob-crypto-portfolio-tracker"                "${HOME}/.local/bin/dob-crypto-portfolio-tracker"
echo "Removed dob-crypto-portfolio-tracker from Codex, Claude, ~/.dayonebuilder, and ~/.local/bin"
