---
description: Rebuild .info/CLASSES.md, the alphabetical map of every class, type, and exported function to its file.
---

House standard, these rules override defaults: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/SKILL.md

Developer doc conventions: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/developer-docs.md

Regenerate the class index.

1. Scan the source tree for every class, interface, type, and exported function. Include private and internal symbols, hunting for an internal helper is the same problem as hunting for a public one.
2. Write `.info/CLASSES.md` with one table: Symbol, Kind, Location, Purpose.
3. Sort strictly alphabetically by symbol name. No grouping by module, no ordering by importance.
4. Links are relative from `.info/` so they resolve in an editor and in a diff.
5. Purpose is one line. The table is a map, not documentation.
6. Prefer writing a script under `scripts/` that regenerates this, so CI can keep it current. A stale index is worse than none.
7. Update the document changelog.

Report the count of symbols indexed and the file path. Nothing else.
