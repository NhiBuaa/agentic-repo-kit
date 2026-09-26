# Agentic Repo Kit — Project Overview

## Problem

Software repositories increasingly use coding agents, but project knowledge, agent instructions, work state, and tool-specific configuration are often mixed together. This creates duplicated truth, stale context, and unnecessary complexity.

## Product

Agentic Repo Kit is a vendor-neutral repository structure and bootstrap workflow for software projects developed by humans and coding agents.

A user should be able to analyze a project, capture the foundation in `PROJECT-OVERVIEW.md`, run the bootstrap skill, and receive a predictable repository structure with clear local instructions.

## Scope

### In Scope

- canonical root project-context files;
- ordered durable documentation categories;
- project-local agent rules and references under `.agents/`;
- reusable templates and bootstrap workflow;
- Issues/PRs as the work plane;
- optional future tool-specific adapters.

### Out of Scope

- replacing Issues or Pull Requests;
- storing agent chat history or hidden reasoning;
- copying personal/global skills into every project;
- making agent-specific files canonical owners of product architecture;
- creating commands or hooks by default when workflow planning already covers orchestration.

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

## Development Workflow

```text
Issue
  ↓
relevant project knowledge / rules / references / skill
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

The current redesign keeps `.agents/` but narrows its purpose to project-local agent rules and references, while the toolkit bootstrap skill remains under root `skills/`.

The documentation model now explicitly separates root project foundation from expanded overview material and treats `99-notes` as a canonical location with optional contents.

## Open Questions

- Which tool-specific adapters should eventually ship as examples?
- Should bootstrap remain skill-only or later gain a CLI?
