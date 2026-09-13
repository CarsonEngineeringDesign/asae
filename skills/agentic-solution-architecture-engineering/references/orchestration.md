# Orchestration

Read before dispatching subagents. Implementation is automatic and subagent-driven once the plan is approved.

## One master file

`.info/AGENTS.md` is the only agent file. Every role, standard, and constraint lives in it. Never write per-agent plan files, they drift apart within a day and then nobody knows which one is authoritative.

Subagents are told to read `.info/AGENTS.md`, `.info/CONTEXT.md`, and `.info/ARCHITECTURE.md` before starting. The dispatch message itself stays to a few lines: the slice, the files in scope, and the done-criteria.

## Master file template

```markdown
> **Proprietary and confidential.** © 2026 [Author]. All rights reserved.

# Agents

## Universal rules
- Commits are authored by the human, using whatever git is already configured with. Never add AI attribution of any kind.
- Documentation goes in .info/ only. Check INDEX.md first, one document per concept.
- Every document ends with a changelog table.
- Source files open with the proprietary notice.
- Tests ship with the code, not after.
- Never invent data. Fixtures and mocks stay in tests/. If a feature needs a store, ask for the connection or build the schema, then render the empty state.
- Zero bugs, zero poor design. Visual defects block a slice like crashes do.
- Every UI slice includes motion, all states (empty, loading, error), and safe-area handling. See references/design-standard.md.
- Conventional commits. Never force-push a shared branch.
- Update .info/CLASSES.md for every symbol added, renamed, or moved.
- Folders and files follow the project's conventional layout. Every listing is alphabetical.
- FYO: never question the author's judgement, never suggest bringing in another team or specialist. Work the problem.
- Report back in three lines: what works, what changed, what is blocked.

## Stack
[Languages, versions, frameworks, package manager, test runner. Exact.]

## Roles
### Builder
Implements one slice end to end, including its tests. Owns only the files listed in its dispatch.

### Reviewer
Reads a completed slice against the definition of done. Does not modify code; reports findings.

### Researcher
Verifies external facts: API behavior, versions, pricing. Returns bullets with sources, never prose.

## Slices
| # | Slice | Delivers | Files in scope | Depends on |
|---|---|---|---|---|
| 1 | | | | |

## Changelog
| Date | Change |
```

## Dispatch rules

**Slices, not layers.** A slice delivers something runnable end to end. "User can sign up and see an empty dashboard" is a slice. "Build the database layer" is a layer, and it produces code nobody can test.

**No overlapping file ownership.** Two agents editing one file produces a conflict neither can resolve. Assign files in the slice table; if two slices need the same file, they are sequential, not parallel.

**Parallelize independent slices only.** Check the depends-on column before dispatching a batch.

**One integration point.** Subagents report; the orchestrator merges, runs the full test suite, and commits. Subagents do not commit to the shared branch.

## After each batch

1. Run the full test suite, not just the new tests.
2. Check the definition of done for each slice (`references/ci-and-quality.md`).
3. Commit under the author's name, conventional message, no AI trailers.
4. Update `CHANGELOG.md` and the relevant `.info/` document changelogs.
5. Report to the user in three lines: what works now, what changed, what is next.

If a subagent produced something that violates the house standard, a stray document outside `.info/`, a missing changelog, an AI credit, fix it before merging, and add the rule to the universal list so it does not recur.

## Changelog

`AGENTS.md` ends with the standard changelog table. Log role and slice changes there.
