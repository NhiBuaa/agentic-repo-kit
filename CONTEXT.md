---
status: current
last_verified: 2026-09-26
---

# Current Project Context

## Current Product Boundary

Agentic Repo Kit is a reusable repository convention for software projects developed by humans and coding agents.

Its current scope is intentionally narrow:

- a project foundation file (`PROJECT-OVERVIEW.md`);
- repository-wide agent guidance (`AGENTS.md`);
- bounded current-state context (`CONTEXT.md`);
- ordered durable documentation under `docs/`;
- repository-local agent infrastructure under `.agents/`;
- reusable source templates under `templates/`;
- Agentic Repo Kit system skills under root `skills/`.

## Current Structural Direction

The current design separates three concerns:

1. durable project knowledge belongs in numbered `docs/` categories;
2. repository-local agent infrastructure belongs in `.agents/{commands,hooks,rules,references}`;
3. task state belongs in Issues and Pull Requests rather than repository-owned plan/handoff/review/evidence directories.

The bootstrap skill remains a capability of Agentic Repo Kit itself at `skills/bootstrap-agentic-repo/SKILL.md`. It is not scaffolded into `.agents/skills/` by default; users may manage personal or organization skills globally.

## Work Plane

- Issues own task scope, acceptance criteria, implementation planning, progress, and handoff updates.
- Pull Requests own implementation discussion, review, CI, and verification.
- durable findings are promoted into `docs/` when they become project knowledge.

## Agent Infrastructure

- `.agents/commands/` — repository-local explicit workflow entrypoints.
- `.agents/hooks/` — event-triggered automation and guardrails.
- `.agents/rules/` — scoped agent-working instructions.
- `.agents/references/` — non-authoritative support material.

`.agents/` is not a task archive or source of product truth.

## Tool Adapters

Tool-specific folders such as `.claude/` or `.github/` are optional adapters. They may bridge vendor-specific loaders, commands, or hooks to the shared repository model but must not become independent owners of project architecture or standards.

## Active Direction

The repository is in design-review mode. The priority is validating whether the revised `.agents/` infrastructure, numbered documentation tree, and external Issue/PR work plane are understandable before adding more automation or OSS machinery.

## Known Limitations

- cross-tool installation/discovery conventions are not yet packaged;
- commands and hooks are defined structurally but do not yet have concrete cross-tool examples;
- the structure has not yet been stress-tested against several real project types.

## Canonical References

- Project foundation: `PROJECT-OVERVIEW.md`
- Documentation map: `docs/README.md`
- Repository agent infrastructure: `.agents/README.md`
- Agentic Repo Kit system skills: `skills/README.md`
- Bootstrap workflow: `skills/bootstrap-agentic-repo/SKILL.md`
- Reusable templates: `templates/README.md`
- Work status: repository Issues and Pull Requests
