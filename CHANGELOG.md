# Changelog

All notable changes to this plugin are documented here. Format follows Keep a Changelog.

## [1.1.0] - 2026-09-13

### Added
- `no-dashes` Stop hook that blocks a reply containing an em dash or an en dash
- Usage examples with screenshots from real runs

### Fixed
- Commands referenced skill files by a path relative to the project, so they did not resolve once installed
- Commands did not load the response contract, so the house standard was skipped when a command was used

## [1.0.0] - 2026-09-13

### Added
- `agentic-solution-architecture-engineering` skill with six reference files
- Commands: `/plan`, `/dispatch`, `/classes`, `/audit`, `/ship`
- Agents: `slice-reviewer`, `design-auditor`
