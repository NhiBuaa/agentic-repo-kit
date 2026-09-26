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

The current toolkit skills are:

- `establish-project-overview` — create or reconcile a trustworthy project foundation through evidence plus adaptive clarification;
- `normalize-agentic-repo` — normalize an existing repository after that foundation is established.

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

The repository is in design-review and dogfooding mode.

The immediate priority is validating the existing-repository flow:

```text
establish-project-overview
        ↓
PROJECT-OVERVIEW.md
        ↓
normalize-agentic-repo
```

A complex existing repository will be used as the first pilot before a dedicated fresh-repository initialization skill is designed.

## Known Limitations

- fresh-repository initialization is not yet shipped as a dedicated skill;
- the toolkit is currently delivered as skills rather than a CLI or validator;
- the existing-repository workflow has not yet been stress-tested across several real project types;
- cross-tool adapter conventions remain intentionally undecided.

## Canonical References

- Project foundation: `PROJECT-OVERVIEW.md`
- Documentation map: `docs/README.md`
- Project-local agent config: `.agents/README.md`
- Project overview workflow: `skills/establish-project-overview/SKILL.md`
- Existing repository normalization: `skills/normalize-agentic-repo/SKILL.md`
- Reusable templates: `templates/README.md`
- Work status: repository Issues and Pull Requests
