        # DayOneBuilder Crypto Portfolio Tracker by Ben Ison

        Starter crypto portfolio tracker workbook for wallets, transactions, cost basis, and P&L.

        - Product page: https://dayonebuilder.online/products/crypto-portfolio-tracker/
        - Support / donations: https://checkout.dayonebuilder.online/donate/crypto-portfolio-tracker
        - Direct free download: https://dayonebuilder.online/downloads/dayonebuilder-crypto-portfolio-tracker.zip

        ## Install with your agent

        Preferred phrase:

        ```text
        Install dayonebuilder/dob-crypto-portfolio-tracker by Ben Ison.
        ```

        This repo is named for agent discovery and installability:
        - GitHub repo: `DayOneBuilder/dob-crypto-portfolio-tracker`
        - repo-scoped skill for Codex: `.agents/skills/dob-crypto-portfolio-tracker`
        - repo-scoped skill for Claude Code: `.claude/skills/dob-crypto-portfolio-tracker`

        If your agent does not infer the shell steps automatically yet, the honest fallback is:

        ```bash
        git clone https://github.com/DayOneBuilder/dob-crypto-portfolio-tracker.git
        cd dob-crypto-portfolio-tracker
        ./install.sh
        ```

        ## What install.sh does

        - installs the skill into `~/.agents/skills/dob-crypto-portfolio-tracker` for Codex
        - installs the same skill into `~/.claude/skills/dob-crypto-portfolio-tracker` for Claude Code
        - copies bundled assets into `~/.dayonebuilder/dob-crypto-portfolio-tracker/assets`
        - installs a helper launcher at `~/.local/bin/dob-crypto-portfolio-tracker`

        ## Test after install

        ```bash
        ~/.local/bin/dob-crypto-portfolio-tracker --help
        ```

        Example prompts for your agent:

        - `Install dayonebuilder/dob-crypto-portfolio-tracker by Ben Ison.`
- `Use DOB Crypto Portfolio Tracker to create a fresh tracker workbook in ./ops/portfolio.xml.`
- `Use DOB Crypto Portfolio Tracker to explain how to log a bridge, a staking reward, and an LP withdrawal.`

        ## What is inside the repo

        - `assets/crypto-portfolio-tracker-starter.xml` — the starter workbook
- `skills/dob-crypto-portfolio-tracker/` — installable Agent Skill for Codex and Claude Code
- `bin/new-tracker.sh` — creates a fresh tracker workbook at your target path

        ## How to use it after install

        Use the installed skill to create a fresh workbook, then use the bundled guidance to fill wallet, transaction, holdings, and dashboard tabs correctly.
