#!/usr/bin/env bash
set -euo pipefail

SLUG="dob-crypto-portfolio-tracker"
SKILL_NAME="dob-crypto-portfolio-tracker"
TITLE="DayOneBuilder Crypto Portfolio Tracker by Ben Ison"
REPO_URL="https://github.com/DayOneBuilder/dob-crypto-portfolio-tracker"
PRODUCT_URL="https://dayonebuilder.online/products/crypto-portfolio-tracker/"
SUPPORT_URL="https://checkout.dayonebuilder.online/donate/crypto-portfolio-tracker"
HELP_SCRIPT="new-tracker.sh"

INSTALL_CODEX=1
INSTALL_CLAUDE=1
INSTALL_LAUNCHER=1

while [ $# -gt 0 ]; do
  case "$1" in
    --codex-only)
      INSTALL_CLAUDE=0
      ;;
    --claude-only)
      INSTALL_CODEX=0
      ;;
    --no-launcher)
      INSTALL_LAUNCHER=0
      ;;
    *)
      echo "Unknown flag: $1" >&2
      echo "Usage: ./install.sh [--codex-only|--claude-only] [--no-launcher]" >&2
      exit 1
      ;;
  esac
  shift
done

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_SKILL_DIR="$ROOT/skills/$SKILL_NAME"
if [ ! -d "$SRC_SKILL_DIR" ]; then
  echo "Skill directory not found: $SRC_SKILL_DIR" >&2
  exit 1
fi

choose_codex_base() {
  if [ -n "${CODEX_SKILLS_DIR:-}" ]; then
    printf "%s\n" "$CODEX_SKILLS_DIR"
  elif [ -d "$HOME/.codex/skills" ]; then
    printf "%s\n" "$HOME/.codex/skills"
  else
    printf "%s\n" "$HOME/.agents/skills"
  fi
}

CODEX_BASE="$(choose_codex_base)"
CLAUDE_BASE="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
LAUNCHER_PATH="$HOME/.local/bin/$SLUG"

install_skill() {
  local base="$1"
  local dest="$base/$SKILL_NAME"
  mkdir -p "$base"
  rm -rf "$dest"
  cp -R "$SRC_SKILL_DIR" "$dest"
  chmod +x "$dest/scripts/"* 2>/dev/null || true
  printf "%s\n" "$dest"
}

CODEX_DEST=""
CLAUDE_DEST=""
if [ "$INSTALL_CODEX" -eq 1 ]; then
  CODEX_DEST="$(install_skill "$CODEX_BASE")"
fi
if [ "$INSTALL_CLAUDE" -eq 1 ]; then
  CLAUDE_DEST="$(install_skill "$CLAUDE_BASE")"
fi

if [ "$INSTALL_LAUNCHER" -eq 1 ]; then
  mkdir -p "$HOME/.local/bin"
  cat > "$LAUNCHER_PATH" <<'LAUNCHER'
#!/usr/bin/env bash
set -euo pipefail
HELP_SCRIPT="new-tracker.sh"
SKILL_NAME="dob-crypto-portfolio-tracker"
resolve_skill_dir() {
  for base in "${CODEX_SKILLS_DIR:-}" "$HOME/.codex/skills" "$HOME/.agents/skills" "${CLAUDE_SKILLS_DIR:-}" "$HOME/.claude/skills"; do
    [ -n "$base" ] || continue
    if [ -x "$base/$SKILL_NAME/scripts/$HELP_SCRIPT" ]; then
      printf "%s\n" "$base/$SKILL_NAME"
      return 0
    fi
  done
  return 1
}
SKILL_DIR="$(resolve_skill_dir || true)"
if [ -z "$SKILL_DIR" ]; then
  echo "Installed skill not found for $SKILL_NAME." >&2
  exit 1
fi
SCRIPT="$SKILL_DIR/scripts/$HELP_SCRIPT"
if [ $# -eq 0 ] || [ "${1:-}" = "--help" ] || [ "${1:-}" = "help" ]; then
  cat <<HELP
DayOneBuilder Crypto Portfolio Tracker by Ben Ison installed.
Repo: https://github.com/DayOneBuilder/dob-crypto-portfolio-tracker
Product page: https://dayonebuilder.online/products/crypto-portfolio-tracker/
Support: https://checkout.dayonebuilder.online/donate/crypto-portfolio-tracker

Installed skill path:
- $SKILL_DIR

Helper:
- $SCRIPT
HELP
  exit 0
fi
exec "$SCRIPT" "$@"
LAUNCHER
  chmod +x "$LAUNCHER_PATH"
fi

echo "Installed $TITLE"
echo "- Repo: $REPO_URL"
echo "- Product page: $PRODUCT_URL"
if [ -n "$CODEX_DEST" ]; then echo "- Codex skill: $CODEX_DEST"; fi
if [ -n "$CLAUDE_DEST" ]; then echo "- Claude skill: $CLAUDE_DEST"; fi
if [ "$INSTALL_LAUNCHER" -eq 1 ]; then echo "- Launcher: $LAUNCHER_PATH"; fi
echo
echo "Notes:"
echo "- Codex repo-scoped use: launch Codex inside this repo; it auto-discovers .agents/skills/"
echo "- Claude plugin use: launch Claude with --plugin-dir . inside this repo"
