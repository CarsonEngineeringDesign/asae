---
description: Run the zero-defect audit on the current UI, padding, overlap, safe areas, states, motion, contrast, and generic-AI tells.
argument-hint: [screen or component]
---

Design standard: @${CLAUDE_PLUGIN_ROOT}/skills/agentic-solution-architecture-engineering/references/design-standard.md

Audit $ARGUMENTS against the zero-bug, zero-poor-design bar.

Check every item and report pass or fail with evidence:

- Padding consistent and drawn from one spacing scale
- No overlap at 320px, 768px, 1280px, and the largest target
- Safe areas respected: notch, home indicator, status bar, keyboard open, landscape
- Tap targets at least 44×44px with spacing between them
- Contrast at WCAG AA, including over any translucent surface in motion
- Every state designed: empty, loading, error, offline, long content, zero items, many items
- Transitions present on state change and navigation; feedback on every action
- `prefers-reduced-motion` honored with a cross-fade rather than nothing
- No layout shift after load
- No invented data on screen. Placeholder users, lorem content and hardcoded rows are failures
- No generic-AI tells: unmodified library defaults, identical rounded cards, gradient washes, all-caps eyebrows, arrows on buttons, 01/02/03 on non-sequences, emoji as icons

Take a screenshot and look at the picture, not the code, if the environment allows it.

Report failures only, each with the file and the fix. If everything passes, say so in one line.
