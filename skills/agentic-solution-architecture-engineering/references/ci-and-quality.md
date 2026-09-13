# CI and quality

Read at phase 5 (Harden), or earlier if the user asks about tests, automation, or release readiness.

## Contents

- Test strategy
- Pipeline stages
- Definition of done
- Security baseline
- Reporting failures

## Test strategy

Write tests with the code in each slice. Tests added at the end test what the code does, not what it should do.

**Unit tests** cover logic with branches: parsers, calculators, state machines, permission checks. Fast, no network, no disk.

**Integration tests** cover the seams: database queries, HTTP handlers, queue consumers. Use a real database in a container rather than a mock; mocked databases pass while the real query is malformed.

**End-to-end tests** cover the few paths that must never break. Signup, checkout, login. Keep the count low, they're slow and they flake.

Coverage percentage is a weak signal. Better question: if this function broke silently, would a test catch it? Prioritize by blast radius, not by line count.

**Never delete or weaken a failing test to make the pipeline green.** A failing test is information. If it's genuinely wrong, fix the test and say in the commit message why it was wrong.

## Pipeline stages

Order matters: fail on the cheap checks first so feedback arrives in seconds, not minutes.

1. **Lint and format**: fail the build on violations, don't auto-fix in CI
2. **Type check**: if the language has types, this is the highest-value stage
3. **Unit tests**
4. **Build**: produce the actual artifact
5. **Integration tests**: against real dependencies in containers
6. **Security scan**: dependency audit and secret detection
7. **Deploy**: only from the main branch, only after everything above passes

Rules:
- The pipeline must pass on a clean checkout with no local state.
- Pin dependency versions with a lockfile; an unpinned build is not reproducible.
- Cache dependencies, never build artifacts.
- No secrets in the config file: reference the platform's secret store.
- Keep it under ten minutes for the pre-deploy stages, or people start bypassing it.

Match the platform the user already has. GitHub Actions, GitLab CI, and CircleCI all express the same stages; don't migrate someone's CI as a side effect of a feature request.

## Definition of done

A slice is done when all of these hold:

- [ ] It runs on a clean checkout following the README
- [ ] Tests cover the new behavior and pass
- [ ] The full pipeline is green
- [ ] Errors are handled: no silent failures, no swallowed exceptions
- [ ] Logs exist at the decision points, with no secrets or personal data in them
- [ ] Configuration is externalized, not hardcoded
- [ ] No invented data outside `tests/`. Every value on screen came from a real store, a real API or the person who owns it
- [ ] Docs updated: README if the interface changed, `.info/DECISIONS.md` if a decision was made, changelogs always
- [ ] No commented-out code and no stray debug output
- [ ] UI only: no padding or overlap defects at any width, safe areas respected, empty/loading/error states designed, transitions present, reduced motion honored, contrast at AA

Report it as a checklist result. "Done except logging. That lands in the next commit."

## Data

Test doubles live in `tests/` and stay there. Fixtures, factories, stubs and mocks are never imported by application code, and a lint rule or an import boundary check is worth the ten minutes it takes to add.

Application code never carries a hardcoded record set. If a screen needs rows and no store exists yet, the screen renders its empty state and the work item becomes the store.

Before writing any feature that reads or writes data, confirm three things with the person who owns the system: where the data lives, how to connect to it, and what the schema is. Ask once, plainly, and wait for the answer.

Seed scripts are allowed for local development only when the person asks for them. Keep them under `scripts/`, name them so nobody mistakes the output for production content, and never run them against a shared environment.

## Security baseline

Apply to every project, no matter how small:

- Validate input at the boundary, and encode output at the point of use
- Parameterized queries only: never build SQL by string concatenation
- Secrets from the environment or a secret manager, never in the repo
- Dependencies audited, and known-vulnerable versions upgraded before ship
- Authentication checked on every protected route, not just in the UI layer
- Rate limits on anything public and expensive

Flag anything you find that violates this, even when it's outside the current task. One line, then continue.

## Reporting failures

When a build or test fails, report in this order:

1. What failed, named exactly (`test: session survives restart`)
2. The actual cause, if verified, or clearly labeled as a hypothesis if not
3. The fix, or the one question blocking it

Do not paste the full stack trace into chat. Paste the three relevant lines, and say where the full log is.

Wrong: three paragraphs narrating the debugging journey.
Right: "`auth.spec.ts:88` fails, the mock clock doesn't advance past the token TTL. Fixing the fixture, not the code."

## Git hygiene

- Conventional commits: `feat(auth): add token refresh`.
- Author is the human, always. No `Co-Authored-By: Claude`, no generated-with trailers, no AI credit in any commit, PR, or file header.
- Trunk-based: short-lived branches, merged daily, never force-pushed once shared.
- `.info/` must be in `.gitignore` before any document is written into it.
- Before the first commit, check that `git config` names the human author. Do not ask for personal details, just report if it is unset.

## Modern conventions

Match the project's existing tooling first. Where the project is new, default to current conventional practice: typed language or strict type checking, a lockfile committed, dependencies pinned, containerized services for local development, infrastructure as code, structured logging, and secrets from a secret manager rather than files.
