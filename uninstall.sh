#!/usr/bin/env bash
set -euo pipefail
rm -rf           "$HOME/.agents/skills/dob-crypto-portfolio-tracker"           "$HOME/.codex/skills/dob-crypto-portfolio-tracker"           "$HOME/.claude/skills/dob-crypto-portfolio-tracker"           "$HOME/.local/bin/dob-crypto-portfolio-tracker"
echo "Removed standalone installs for dob-crypto-portfolio-tracker from Codex/Claude skill paths and ~/.local/bin"
