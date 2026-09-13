---
description: Write or revise the six-section project plan in .info/PLAN.md, then show the design direction visually.
argument-hint: [project or feature]
---

Planning rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/planning.md
Artifact rules: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/artifacts.md

Plan $ARGUMENTS.

1. Ask whether the plan should be lean (one page, internal validation) or full (15 to 25 pages, investors or lenders). Ask once, then proceed.
2. Check `.info/INDEX.md`. If a plan already exists, edit that file. Never create a second plan document.
3. Write `.info/PLAN.md` with the six sections in order: Executive Summary, Product & Tech Stack, Market & Competitor Analysis, Go-to-Market, Operations & Infrastructure, Financial Projections.
4. Label every number as own data, a named benchmark, or a stated assumption. Never invent a figure.
5. Write `.info/CONTEXT.md` if it does not exist.
6. Show the design direction visually. One screen or one component. Add the note that the build may differ slightly once iteration begins.
7. Update `.info/INDEX.md` and the document changelogs.

This phase is not gated. Ask whether they like the direction, then keep moving.

Report in chat: bold one-line answer, the file paths, and the single open question if there is one.
