# AGENTS.md

This repository is a shared agent product repo for `dob-crypto-portfolio-tracker`.

Packaging contract:
- Codex repo-scoped path: `.agents/skills/dob-crypto-portfolio-tracker`
- Codex plugin manifest: `.codex-plugin/plugin.json`
- Codex local marketplace: `.agents/plugins/marketplace.json`
- Claude plugin manifest: `.claude-plugin/plugin.json`
- Self-contained skill logic lives under `skills/dob-crypto-portfolio-tracker/`

When changing this repo:
1. Keep the skill self-contained. If someone installs only the skill folder, it should still work.
2. Do not hardcode a single Codex home path. Fallback installers must handle `~/.codex/skills` and `~/.agents/skills`.
3. Keep repo-scoped use as the least noisy path: Codex in-repo, Claude with `--plugin-dir .`.
4. Treat `install.sh` as optional convenience, not the only way the product works.
