---
status: current
last_verified: 2026-09-26
---

# Current Project Context

## Current Product Boundary

Agentic Repo Kit currently defines:

- `PROJECT-OVERVIEW.md`, `AGENTS.md`, and `CONTEXT.md` as root project context files;
- numbered durable documentation under `docs/`;
- project-local agent configuration under `.agents/`;
- reusable source templates under `templates/`;
- toolkit-provided skills under root `skills/`.

## Current Structural Direction

The current design keeps Issues and Pull Requests as the work plane while retaining `.agents/` for project-local agent configuration.

Default `.agents/` content is intentionally small:

```text
.agents/
├── rules/
└── references/
```

`commands/`, `hooks/`, and project-local `skills/` are not part of the default structure.

## Work Plane

- Issues own task scope, acceptance criteria, implementation planning, progress, and handoff updates.
- Pull Requests own implementation discussion, review, CI, and verification.
- durable findings are promoted into `docs/` when they become project knowledge.

## Active Direction

The repository is in design-review mode. The priority is validating the simplified structure before adding more automation or OSS machinery.

## Known Limitations

- bootstrap is currently delivered as a skill, not a CLI;
- the structure has not yet been stress-tested across several real project types;
- cross-tool adapter conventions remain intentionally undecided.

## Canonical References

- Project foundation: `PROJECT-OVERVIEW.md`
- Documentation map: `docs/README.md`
- Project-local agent config: `.agents/README.md`
- Bootstrap workflow: `skills/bootstrap-agentic-repo/SKILL.md`
- Reusable templates: `templates/README.md`
- Work status: repository Issues and Pull Requests
