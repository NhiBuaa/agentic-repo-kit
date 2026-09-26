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
- reusable agent skills and references under `agent/`;
- reusable source templates under `templates/`.

## Current Structural Direction

The current design simplifies the earlier model in two ways:

1. task state belongs in Issues and Pull Requests instead of repository-owned `.agents/plans`, handoffs, reviews, or evidence;
2. agent-specific repository content is limited to reusable capabilities (`agent/skills`) and supporting references (`agent/references`).

The documentation tree uses numbered categories to give humans and agents a predictable discovery order while preserving semantic authority by document type.

## Work Plane

- Issues own task scope, acceptance criteria, implementation planning, progress, and handoff updates.
- Pull Requests own implementation discussion, review, CI, and verification.
- durable findings are promoted into `docs/` when they become project knowledge.

## Tool Adapters

Tool-specific folders such as `.claude/` or `.github/` are optional adapters. They must not become independent owners of project architecture or rules.

## Active Direction

The repository is in design-review mode. The priority is validating whether the simplified structure is understandable and useful before adding more automation or OSS machinery.

## Known Limitations

- the bootstrap workflow is currently documented as a skill rather than implemented as a standalone CLI;
- cross-tool installation/discovery conventions are not yet packaged;
- the structure has not yet been stress-tested against several real project types.

## Canonical References

- Project foundation: `PROJECT-OVERVIEW.md`
- Documentation map: `docs/README.md`
- Agent capability model: `agent/README.md`
- Bootstrap workflow: `agent/skills/bootstrap-agentic-repo/SKILL.md`
- Reusable templates: `templates/README.md`
- Work status: repository Issues and Pull Requests
