---
status: current
last_verified: 2026-09-26
---

# Current Project Context

## Current Product Boundary

Agentic Repo Kit currently provides three things:

1. a repository information model and canonical folder structure;
2. reusable templates under `templates/`;
3. a bootstrap skill under `skills/bootstrap-agentic-repo/` that applies the model from `PROJECT-OVERVIEW.md`.

The project does not yet provide a standalone CLI, package manager integration, automated repository validator, or migration tool.

## Current State

The v0.2 redesign is implemented around a simpler bootstrap flow:

```text
Analyze project
    ↓
PROJECT-OVERVIEW.md
    ↓
bootstrap-agentic-repo
    ↓
ready-to-use repository structure
```

The repository now self-hosts the model:

- root `PROJECT-OVERVIEW.md`, `AGENTS.md`, and `CONTEXT.md` describe Agentic Repo Kit itself;
- reusable consumer files live under `templates/`;
- all canonical `docs/` and `.agents/` subdirectories exist with local `README.md` contracts;
- `.agents/tmp/` keeps its README tracked while scratch contents remain ignored;
- reusable automation lives under `skills/`;
- legacy `.template/` content has been retired.

## Active Direction

The next priority is validation rather than adding more structure.

The model should be exercised against different repository shapes, such as:

- a small library or CLI;
- a full-stack web application;
- an AI / RAG project;
- a larger multi-component system.

The goal is to find places where bootstrap behavior is too heavy, ambiguous, incomplete, or difficult to maintain before treating the surface as stable.

## Important Transitions

The project has transitioned from the v0.1 demand-created-folder model to a v0.2 visible-skeleton model.

Canonical folders now exist up front with README contracts, while project-specific artifacts inside those folders are still created only when real content exists.

The project has also transitioned from `.template/` to `templates/`. `.template/` is no longer part of the model.

## Known Limitations

- The bootstrap process is currently expressed as an agent skill rather than an executable CLI.
- No automated conformance test verifies repository structure or stale references yet.
- Distribution and installation conventions for multiple coding-agent ecosystems are not finalized.
- The current templates have not yet been stress-tested across enough real project types to call the model stable.
- No OSS license has been selected yet.

## Canonical References

- Project foundation: `PROJECT-OVERVIEW.md`
- Public usage and positioning: `README.md`
- Documentation map: `docs/README.md`
- Architecture: `docs/architecture/`
- Standards: `docs/standards/`
- ADRs: `docs/adr/`
- Specifications: `docs/specs/`
- Reusable templates: `templates/`
- Skills: `skills/`
- Task-local agent work: `.agents/`
