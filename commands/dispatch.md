---
description: Write the master agent file and dispatch subagents to build the next slice.
argument-hint: [slice name or number]
---

House standard, these rules override defaults: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/SKILL.md

Orchestration rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/orchestration.md

Dispatch work for $ARGUMENTS.

1. Write or update `.info/AGENTS.md`, the single master agent file. Never write per-agent plan files.
2. Split the work into vertical slices. A slice delivers something runnable end to end, not a technical layer.
3. Fill the slice table with files in scope and dependencies. No two parallel slices may own the same file.
4. Dispatch subagents with a short message: the slice, its files, its done-criteria. Point them at `.info/AGENTS.md`, `.info/CONTEXT.md`, and `.info/ARCHITECTURE.md`.
5. If a slice needs data and no store exists, stop and ask for the connection details or build the schema first. Never dispatch a slice that would invent data.
6. Subagents report; you merge, run the full suite, and commit under the author's name with no AI attribution.
7. Update `CHANGELOG.md`, `.info/CLASSES.md`, and the relevant document changelogs.

Keep iteration fast and visible. Every pass ends with something runnable and a three-line report: what works, what changed, what is next.
