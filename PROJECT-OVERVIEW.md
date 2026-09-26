# Agentic Repo Kit — Project Overview

## Problem

Software repositories increasingly use coding agents, but project knowledge, agent instructions, work state, and tool-specific configuration are often mixed together. This creates duplicated truth, stale context, and unnecessary complexity.

## Product

Agentic Repo Kit is a vendor-neutral repository structure and toolkit workflow for software projects developed by humans and coding agents.

For existing repositories, the current workflow first establishes a trustworthy `PROJECT-OVERVIEW.md`, then normalizes repository knowledge and agent configuration around that foundation without inventing missing decisions or recreating work tracking inside the repository.

A dedicated fresh-repository initialization workflow is planned after the existing-repository path has been validated through dogfooding.

## Scope

### In Scope

- canonical root project-context files;
- ordered durable documentation categories;
- project-local agent rules and references under `.agents/`;
- reusable templates;
- a skill for establishing or reconciling `PROJECT-OVERVIEW.md`;
- a skill for normalizing existing repositories;
- Issues/PRs as the work plane;
- optional future tool-specific adapters and fresh-repository initialization.

### Out of Scope

- replacing Issues or Pull Requests;
- storing agent chat history or hidden reasoning;
- copying personal/global skills into every project;
- making agent-specific files canonical owners of product architecture;
- creating commands or hooks by default when workflow planning already covers orchestration;
- silently inventing product or architecture decisions to complete repository structure.

## Architecture Direction

```text
PROJECT-OVERVIEW.md = project foundation
AGENTS.md            = repository-wide agent entrypoint + routing
CONTEXT.md           = current project-state projection
docs/                = durable project knowledge
.agents/rules/        = detailed/scoped agent-only rules
.agents/references/   = non-normative supporting material
Issues / PRs          = work state
skills/               = skills shipped by Agentic Repo Kit itself
```

Current toolkit flow for existing repositories:

```text
available user context + repository reality
        ↓
establish-project-overview
        ↓
PROJECT-OVERVIEW.md
        ↓
normalize-agentic-repo
        ↓
normalized existing repository
```

## Documentation Direction

`docs/` uses numbered categories for discoverability:

```text
01-overview
02-architecture
03-product
04-standards
05-specs
06-decisions
07-guides
08-runbooks
99-notes
```

Every category keeps a `README.md` so the structure remains visible before project-specific content exists.

`PROJECT-OVERVIEW.md` owns the project foundation. `docs/01-overview/` may expand stable reader orientation when distinct material is useful, but it must not maintain a paraphrased copy of the root overview.

`docs/99-notes/` is the canonical location for useful non-authoritative retained notes. The location is part of the canonical skeleton; project-specific notes inside it are optional.

## Major Invariants

- `AGENTS.md` does not become a full architecture manual.
- `CONTEXT.md` does not become project history.
- `docs/` does not contain task progress.
- `docs/01-overview/` expands orientation only when it adds distinct value; it does not duplicate `PROJECT-OVERVIEW.md`.
- `docs/99-notes/` contains optional non-authoritative retained notes, not scratch work or task state.
- `.agents/` does not become a second work tracker.
- `.agents/rules/` contains agent-only behavior; human/software standards belong in `docs/04-standards/`.
- `.agents/references/` is non-normative.
- `commands/`, `hooks/`, and project-local `skills/` are not default `.agents/` primitives.
- Issues/PRs remain the work plane.
- missing or conflicting project decisions are surfaced rather than invented.
- existing repository normalization is planned and reviewed before material migration.

## Development Workflow

```text
Issue
  ↓
relevant project knowledge / rules / references / toolkit skill
  ↓
implementation
  ↓
Pull Request
  ↓
review + CI + verification
  ↓
promote durable findings into docs when needed
```

## Current State

The repository currently ships two focused toolkit skills:

- `establish-project-overview` for creating or reconciling the project foundation through repository evidence plus adaptive user clarification;
- `normalize-agentic-repo` for safely normalizing an existing repository after that foundation is trustworthy.

The prior all-in-one `bootstrap-agentic-repo` skill has been retired to avoid mixing fresh initialization, project-foundation establishment, and existing-repository migration into one workflow.

The next validation target is dogfooding the establish → normalize path on a complex existing repository before designing a dedicated fresh-repository initialization skill.

## Open Questions

- Which tool-specific adapters should eventually ship as examples?
- Should the toolkit remain skill-only or later gain a CLI/validator layer?
