# Developer docs, class index, and layout

Read before writing developer documentation or laying out a new project.

## Contents

- DEVELOPER.md: the seven sections
- CLASSES.md: the class index
- Folder and file conventions

## DEVELOPER.md

One file at `.info/DEVELOPER.md`, with these seven sections in this order. One document per concept holds here, so all seven live together.

### 1. Overview
What the project is, who it is for, and the core concepts. Define the three or four domain terms that everything else assumes. A reader who stops here should still know whether this project is relevant to them.

### 2. Quickstart
A copy-and-paste path to first success, and nothing else. Clone, install, run, see a result. Every command runnable as written, no placeholders the reader has to decode, no steps that assume prior setup. Target: working in under five minutes.

### 3. Setup & Authentication
Prerequisites with exact versions, installation commands, every configuration value, and how auth works, token type, where it comes from, how it is passed, how long it lasts, how to rotate it.

Configuration goes in a table, alphabetical by key:

| Key | Required | Default | Description |
|---|---|---|---|

### 4. Guides & Tutorials
Task-oriented, step-by-step, for real use cases. Titles start with a verb and name the outcome: "Add a background job", not "Background jobs". Each guide ends with the reader having something that works.

### 5. API & SDK Reference
Endpoints or methods, parameters, return shapes, and error codes. Generate from the spec or from source annotations wherever the stack supports it, OpenAPI, TypeDoc, Sphinx, godoc. Hand-written reference drifts from the code within weeks, and a wrong reference is worse than none.

Every error code gets a row: code, meaning, and what the caller should do about it.

### 6. Troubleshooting & FAQ
Common errors with the actual error text the reader will see, so search finds it. Edge cases and known limitations stated plainly. A documented limitation saves an hour; an undocumented one costs a day.

### 7. Changelog & Release Notes
Recent changes, fixes, and migration notes for breaking versions. The root `CHANGELOG.md` is the source; this section links to it and adds migration guidance.

Then the standard document changelog table at the bottom.

## CLASSES.md

The file that answers "where does this live?" without a search. One alphabetical table, every class, type, interface, and exported function.

```markdown
> **Proprietary and confidential.** © 2026 [Author]. All rights reserved.

# Class index

| Symbol | Kind | Location | Purpose |
|---|---|---|---|
| `AuthToken` | class | [src/auth/token.ts](../src/auth/token.ts) | Issues and validates session tokens |
| `BillingClient` | class | [src/billing/client.ts](../src/billing/client.ts) | Wraps the payments provider |
| `CacheEntry` | interface | [src/cache/types.ts](../src/cache/types.ts) | Shape of a cached record |
| `parseConfig` | function | [src/config/parse.ts](../src/config/parse.ts) | Loads and validates env config |

## Changelog
| Date | Change |
```

Rules:

- Strictly alphabetical by symbol name. No grouping by module, no ordering by importance, alphabetical is the only order a reader can predict.
- Links are relative from `.info/`, so they resolve in an editor and in a diff.
- Purpose is one line. The table is a map, not documentation.
- Private and internal symbols are included. Hunting for an internal helper is the same problem as hunting for a public one.
- Regenerate after any file move, rename, or new export. A stale index is worse than no index, because it sends people to the wrong file with confidence.
- Prefer generating it from the source tree with a script rather than maintaining it by hand, a script run in CI cannot forget.

Subagents update `CLASSES.md` as part of their slice. Put that in the universal rules of `.info/AGENTS.md`.

## Folder and file conventions

**Alphabetical everywhere.** Directory listings, index tables, imports where the linter allows it, config keys, environment variables. When order carries no meaning, alphabetical is the order that lets someone find things without reading everything.

**Conventional layout for the stack.** Use what a developer in that ecosystem expects to find, and where they expect to find it:

```
src/            source
tests/          tests, mirroring src/ structure
assets/         logo, images, static files
scripts/        build, generate, and maintenance scripts
config/         configuration files
.info/          all documentation (gitignored)
```

Inside `src/`, group by feature rather than by technical layer, `src/auth/`, `src/billing/`, `src/cache/`, not `src/controllers/`, `src/models/`, `src/utils/`. Feature folders keep related code together and stay alphabetical naturally.

**Naming.** One casing convention per project, matching the ecosystem, `kebab-case.ts` for TypeScript, `snake_case.py` for Python, `PascalCase.cs` for C#. Never mix. The file name matches the primary symbol it exports, so `AuthToken` lives in `token.ts` under `auth/` and nowhere else.

**No junk names.** `utils`, `helpers`, `misc`, `common`, and `temp` are where code goes to become unfindable. Name the folder for what the code does.

**Tests mirror source.** `src/auth/token.ts` is tested by `tests/auth/token.test.ts`. Same path, same name. No searching.
