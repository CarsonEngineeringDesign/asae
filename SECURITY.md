# Security

## What this plugin contains

Markdown instructions, plus one local shell script. No MCP servers, no network
calls, and no third party software is installed by it.

That script is `hooks/no-dashes.sh`, a Stop hook. It reads the reply you just
received, checks it for an em dash or an en dash, and asks for a rewrite if it
finds one. It reads the session transcript and writes a short JSON verdict to
standard output. It sends nothing anywhere, and it exits without blocking if
anything at all goes wrong, including `python3` not being installed.

Its two agents run with read tools. `slice-reviewer` has `Bash` so it can run a
test suite. `design-auditor` has no shell access at all.

Nothing in this plugin collects, stores, or transmits any data about you or your
projects. There is no telemetry.

## Reporting a vulnerability

Use GitHub private vulnerability reporting on this repository. Open the Security
tab and choose Report a vulnerability. That keeps the report private until it is
resolved.

If you cannot use GitHub, email info@carsonengi.com instead.

Please do not open a public issue for a security problem.

Expect an acknowledgement within three working days.

## Supply chain

This plugin is distributed from its GitHub repository. Changes pushed to the
default branch flow to the marketplace automatically, which makes write access to
that repository the sensitive asset.

Controls on the repository:

- Two factor authentication enforced across the organization
- Commit email privacy on, so no personal address appears in the history
- Two factor authentication required on every account with access
- Branch protection on the default branch: no force push, no deletion, pull
  request review required before merge
- Signed commits
- Write access limited to the smallest possible number of people
- Every external pull request reviewed as untrusted input, because a skill file
  is a set of instructions to an agent and a harmful edit can read as ordinary
  prose

## If you are reviewing this plugin before installing it

Read `skills/agentic-solution-architecture-engineering/SKILL.md` first. That file
is loaded into context when the skill activates, and it holds the behaviour rules.
The files under `references/` load only when the relevant phase begins. The
`commands/` and `agents/` directories hold the rest.

There are no inline shell execution lines in any command, skill, or agent file, so
nothing runs on your machine when the skill loads. The single executable is
`hooks/no-dashes.sh`, which runs when a reply finishes. It is about sixty lines and
worth reading before you install.
