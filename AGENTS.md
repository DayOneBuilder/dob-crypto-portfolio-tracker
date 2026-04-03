# AGENTS.md

This repository is an installable DayOneBuilder product repo for `dob-crypto-portfolio-tracker`.

If the user asks to install or set up this repo:
1. Run `./install.sh` from the repo root.
2. Verify these paths exist afterward:
   - `~/.agents/skills/dob-crypto-portfolio-tracker/SKILL.md`
   - `~/.claude/skills/dob-crypto-portfolio-tracker/SKILL.md`
   - `~/.local/bin/dob-crypto-portfolio-tracker`
3. Mention the installed helper command: `~/.dayonebuilder/dob-crypto-portfolio-tracker/bin/new-tracker.sh [target-file-or-directory]`

If the user asks to create local files from this product, use the helper in `bin/new-tracker.sh`.
Keep the work productized. Do not invent hosted services or extra dependencies.
