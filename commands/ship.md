---
description: Run the ship checklist, README pills, logo, developer docs, class index, changelogs, runbook.
---

Artifact rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/artifacts.md
Developer doc rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/developer-docs.md
CI and quality rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/ci-and-quality.md

Prepare the project to ship.

1. `README.md`: pills row under the title (status, version, license, stack), logo, then what it does, requirements with exact versions, install, run, test, configuration table, deploy. Follow it literally on a clean checkout to verify.
2. Master README updated with this project's row, if one exists.
3. `assets/logo.svg` present. Ask for the author's logo before generating anything.
4. `.info/DEVELOPER.md`: all seven sections: overview, quickstart, setup and auth, guides, API/SDK reference, troubleshooting, changelog.
5. `.info/CLASSES.md` regenerated and accurate.
6. `.info/RUNBOOK.md`: deploy, roll back, health checks, failure modes.
7. `CHANGELOG.md` and every `.info/` document changelog current.
8. Pipeline green on a clean checkout. Definition of done met for every slice.
9. Commits carry the author's name only. No AI attribution anywhere in the repo.

Report as a checklist result, not prose. Name what is outstanding.
