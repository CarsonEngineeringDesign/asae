# Documents and artifacts

Read before writing any document. Never paste a document into chat, write the file, then give the path and one sentence.

## Contents

- Folder layout
- INDEX.md: the one-doc-per-concept register
- Document changelog
- Proprietary notice
- Central README and pills
- Logo and context
- Rules for all documents

## Folder layout

```
project/
├── README.md          # pills, links to master README
├── CHANGELOG.md       # release history
├── LICENSE            # proprietary
├── assets/logo.svg    # every app has one
└── .info/             # gitignored, all other documentation
    ├── AGENTS.md       # single master subagent file
    ├── ARCHITECTURE.md
    ├── CLASSES.md      # alphabetical symbol → file link map
    ├── CONTEXT.md      # what this app is, who it's for, why it exists
    ├── DECISIONS.md    # all architecture decisions, one file
    ├── DEVELOPER.md    # the seven-section developer documentation
    ├── INDEX.md        # register of every document and its concept
    ├── PLAN.md         # six-section plan
    └── RUNBOOK.md
```

`.info/` is untracked. Confirm `.info/` is in `.gitignore` before writing into it. Two consequences to work under: the documents have no version-control history, so the per-document changelog is the record; and they are not backed up by the repo, so never store anything in `.info/` that cannot be reconstructed.

## INDEX.md

The register that enforces one document per concept. Read it before creating any file in `.info/`. If the concept is listed, open that file and edit it.

```markdown
# Document index

| Concept | File | Updated |
|---|---|---|
| App context | CONTEXT.md | 2026-03-09 |
| Architecture decisions | DECISIONS.md | 2026-03-12 |
| Business & product plan | PLAN.md | 2026-03-11 |
| Class index | CLASSES.md | 2026-03-14 |
| Developer documentation | DEVELOPER.md | 2026-03-13 |
| Operations runbook | RUNBOOK.md | 2026-03-14 |
| Subagent roles | AGENTS.md | 2026-03-12 |
| System architecture | ARCHITECTURE.md | 2026-03-11 |

Rows are alphabetical by concept.

## Changelog
| Date | Change |
|---|---|
| 2026-03-14 | Added RUNBOOK.md |
```

New concept, new row. New information on an existing concept goes into the existing file, as a new section if needed, never as a new file.

Decisions are a single file, `DECISIONS.md`, appended newest-first. One decision per section, each with context, choice, runner-up, and consequences. Superseded decisions are marked, not deleted.

## Document changelog

Ends every document in `.info/`, newest first.

```markdown
## Changelog
| Date | Change |
|---|---|
| 2026-03-12 | Reworked §6 margins after API pricing change |
| 2026-03-09 | Initial version |
```

No author column. Git already records who committed, and names do not belong in document prose. The rule that matters here is the one about credit: nothing in this repo is ever attributed to an assistant.

## Proprietary notice

First lines of every document:

```markdown
> **Proprietary and confidential.** © 2026 [Author]. All rights reserved.
> Not for distribution.
```

And in source files, as a comment in the language's syntax:

```
// Proprietary and confidential. © 2026 [Author]. All rights reserved.
```

Get `[Author]` from `git config user.name`. If unset, ask.

## Central README and pills

One master `README.md` indexes every project. Each project README links back to it.

Pills are shields.io badges in a row directly under the title. Every README opens with them.

```markdown
<h1 align="center">
  <img src="assets/logo.svg" width="96" alt=""><br>
  Project Name
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/status-active-2ea44f?style=for-the-badge" alt="status">
  <img src="https://img.shields.io/badge/version-1.4.0-blue?style=for-the-badge" alt="version">
  <img src="https://img.shields.io/badge/license-proprietary-red?style=for-the-badge" alt="license">
  <img src="https://img.shields.io/badge/node-22-339933?style=for-the-badge&logo=node.js&logoColor=white" alt="node">
</p>
```

Keep the pill style consistent across every README, same `style=`, same order: status, version, license, then stack. Use static badges, not live CI badges, since a private repo's live badge renders broken.

Master README body:

```markdown
## Projects

| Project | Status | Stack | Description |
|---|---|---|---|
| [name](./name) | ![](https://img.shields.io/badge/active-2ea44f) | Node · Postgres | One line |
```

Project README body, in order: what it does (one sentence), requirements with exact versions, install, run, test, configuration table of every environment variable with default and required flag, deploy. Verify it by following it literally on a clean checkout.

## Logo and context

Every app has both.

**Logo**: `assets/logo.svg`, used in the README header. Ask whether the author has one before generating anything. If generating, keep it simple: a mark that reads at 32px, two colors maximum, SVG.

**Context**: `.info/CONTEXT.md`:

```markdown
# Context: [app]

## What it is
[One paragraph.]

## Who it's for
[The specific user, not "everyone".]

## Why it exists
[The problem, and what people do today without it.]

## What it is not
[Scope boundaries that stop feature creep.]

## Changelog
| Date | Change |
|---|---|
```

Write `CONTEXT.md` before writing code. Subagents read it to make choices consistent with intent.

## Rules for all documents

**Write during, not after.** A decision recorded the day it was made captures the alternatives. Recorded later, it's a rationalization.

**No invented content.** An empty section gets a `TODO` naming the missing fact. Never fill a template with plausible filler, the next reader will take it as fact.

**Say the uncomfortable part.** Documented trade-offs and known weaknesses are the value. A document where everything sounds easy is worthless.

**Chat summary is a pointer.** "Updated `.info/DECISIONS.md`, Postgres over SQLite, for concurrent writes." One line.
