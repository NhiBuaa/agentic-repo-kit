# Skill: Bootstrap Agentic Repository

## Purpose

Initialize or normalize a software repository using Agentic Repo Kit from a project-level `PROJECT-OVERVIEW.md`.

The workflow should make the repository easier to navigate without inventing missing project decisions or recreating task tracking inside the repository.

## Primary Input

`PROJECT-OVERVIEW.md`

Read it for:

- problem and product intent;
- scope and boundaries;
- architecture direction;
- domain concepts;
- constraints and invariants;
- development workflow;
- current state;
- explicit open questions.

Treat open questions as unresolved. Do not convert them into decisions merely to complete the template.

## Required Repository Inspection

Before creating or replacing files:

1. inspect the existing tree;
2. read existing root instructions and current-context files;
3. identify existing architecture, product, standard, specification, decision, guide, and runbook documentation;
4. identify the repository work tracker when available;
5. identify tool-specific agent configuration such as `.claude/` or `.github/`;
6. preserve useful existing information and report authority conflicts instead of silently choosing a winner.

## Canonical Output Structure

Ensure the repository has this discoverable skeleton:

```text
README.md
PROJECT-OVERVIEW.md
AGENTS.md
CONTEXT.md

docs/
├── README.md
├── 01-overview/README.md
├── 02-architecture/README.md
├── 03-product/README.md
├── 04-standards/README.md
├── 05-specs/README.md
├── 06-decisions/README.md
├── 07-guides/README.md
├── 08-runbooks/README.md
└── 99-notes/README.md

agent/
├── README.md
├── skills/README.md
└── references/README.md
```

The folder README files should exist even when no project-specific content is available yet. They are local manuals and keep the intended structure visible in Git.

## Root File Generation

### `AGENTS.md`

Generate concise repository-wide agent guidance from verified project information.

It should contain:

- repository mission;
- authority map;
- read order;
- high-signal invariants;
- validation expectations;
- documentation synchronization rules;
- guidance for Issues/PRs as the work plane.

Do not place complete architecture, task plans, or project history in `AGENTS.md`.

### `CONTEXT.md`

Generate a bounded current-state projection from repository reality and verified overview information.

Include:

- current product boundary;
- current implementation state;
- active direction;
- important transitions;
- meaningful limitations;
- canonical references.

Do not turn it into an issue backlog or historical diary.

## Durable Documentation

Create project-specific documentation only when supported by `PROJECT-OVERVIEW.md`, existing code, existing documentation, or explicit decisions.

Do not create speculative content merely because a numbered directory exists.

Route information by meaning:

- stable orientation → `docs/01-overview/`
- current architecture → `docs/02-architecture/`
- product/domain knowledge → `docs/03-product/`
- normative implementation rules → `docs/04-standards/`
- required behavior → `docs/05-specs/`
- significant decision rationale → `docs/06-decisions/`
- normal procedures → `docs/07-guides/`
- abnormal recovery procedures → `docs/08-runbooks/`
- non-authoritative retained notes → `docs/99-notes/`

## Agent Capabilities

Use `agent/skills/` for reusable workflows and `agent/references/` for non-normative supporting material.

Do not create repository-owned task-state directories such as:

```text
.agents/plans/
.agents/handoffs/
.agents/reviews/
.agents/evidence/
```

Task planning, progress, handoff updates, review discussion, CI, and verification should remain in the repository Issue/PR system when available.

## Tool-Specific Configuration

Preserve existing tool-specific configuration.

Create or modify `.claude/`, `.github/`, or similar adapters only when the project or user explicitly needs them.

Adapters should point to canonical repository knowledge rather than duplicate it.

## Existing Repository Safety

When bootstrapping an existing project:

- do not overwrite useful documentation blindly;
- do not delete history just to fit the new layout;
- classify existing material before moving or consolidating it;
- preserve source code and build configuration;
- report ambiguous ownership or conflicting truth;
- prefer incremental normalization when migration risk is non-trivial.

## Idempotency

Running this workflow again should converge rather than duplicate structure.

On repeated runs:

- reuse existing canonical directories;
- update root guidance only when repository reality changed;
- do not create duplicate architecture/specification/decision documents;
- do not recreate removed task-workspace directories;
- report unresolved conflicts.

## Completion Report

At completion, report:

### Created
Files and folders newly created.

### Updated
Existing artifacts changed and why.

### Preserved
Important existing structures deliberately left unchanged.

### Derived
Project facts inferred from existing evidence, with their source.

### Open Questions
Information intentionally left unresolved.

### Conflicts
Any competing sources of truth that require human review.
