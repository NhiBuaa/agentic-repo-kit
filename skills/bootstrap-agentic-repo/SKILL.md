---
name: bootstrap-agentic-repo
description: Bootstrap or align a software repository using Agentic Repo Kit conventions, with PROJECT-OVERVIEW.md as the primary project input.
---

# Bootstrap Agentic Repository

## Purpose

Initialize or normalize a software repository from a project-level `PROJECT-OVERVIEW.md` without inventing missing decisions or recreating task tracking inside the repository.

The flow is:

```text
Analyze project
    ↓
PROJECT-OVERVIEW.md
    ↓
bootstrap-agentic-repo
    ↓
canonical repository structure
    ↓
normal development
```

## Primary Input

Read `PROJECT-OVERVIEW.md` completely for:

- problem and product intent;
- scope and boundaries;
- architecture direction;
- domain concepts;
- constraints and invariants;
- development workflow;
- current state;
- explicit open questions.

Treat open questions as unresolved. Do not convert them into decisions merely to complete the structure.

## Required Repository Inspection

Before creating or replacing files:

1. inspect the existing tree;
2. read existing root instructions and current-context files;
3. identify existing architecture, product, standard, specification, decision, guide, and runbook documentation;
4. identify repository-local agent infrastructure and tool-specific configuration;
5. identify the Issue/PR work tracker when available;
6. preserve useful existing information and report authority conflicts instead of silently choosing a winner.

## Canonical Consumer Structure

Ensure the target repository has this discoverable skeleton:

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

.agents/
├── README.md
├── commands/README.md
├── hooks/README.md
├── references/README.md
└── rules/README.md
```

The folder `README.md` files intentionally keep the structure visible even when no project-specific content exists yet.

Do **not** scaffold `.agents/skills/` by default. User or organization skills may be installed globally or managed through the user's preferred agent environment.

The Agentic Repo Kit system skill itself remains in the toolkit repository at `skills/bootstrap-agentic-repo/SKILL.md`; it is not part of the consumer repository skeleton.

## Root File Generation

### `AGENTS.md`

Generate concise repository-wide agent guidance from verified project information.

It should include:

- repository mission;
- authority map;
- read order;
- high-signal invariants;
- validation expectations;
- documentation synchronization rules;
- routing to relevant `.agents/rules/`, commands, hooks, or references when they exist;
- guidance for Issues/PRs as the work plane.

Do not place complete architecture, task plans, or project history in `AGENTS.md`.

### `CONTEXT.md`

Generate a bounded current-state projection from repository reality and verified overview information.

Include current product boundary, implementation state, active direction, important transitions, meaningful limitations, and canonical references.

Do not turn it into an issue backlog or historical diary.

## Durable Documentation

Create project-specific documents only when supported by `PROJECT-OVERVIEW.md`, repository reality, existing documentation, or explicit decisions.

Route durable information by meaning:

- stable orientation → `docs/01-overview/`
- current architecture → `docs/02-architecture/`
- product/domain knowledge → `docs/03-product/`
- normative implementation rules → `docs/04-standards/`
- required behavior → `docs/05-specs/`
- significant decision rationale → `docs/06-decisions/`
- normal procedures → `docs/07-guides/`
- abnormal recovery procedures → `docs/08-runbooks/`
- non-authoritative retained notes → `docs/99-notes/`

Do not create speculative content merely because a directory exists.

## Repository-Local Agent Infrastructure

`.agents/` is agent infrastructure, not a task-state archive.

Use:

- `.agents/commands/` for repository-local explicit command/workflow entrypoints;
- `.agents/hooks/` for event-triggered automation and guardrails;
- `.agents/rules/` for scoped agent-working rules;
- `.agents/references/` for non-authoritative supporting material.

Do not create repository-owned task-state directories such as:

```text
.agents/plans/
.agents/handoffs/
.agents/reviews/
.agents/evidence/
```

Task scope, planning, progress, and handoff updates belong in Issues. Implementation discussion, review, CI, and verification belong in Pull Requests when the repository host provides those capabilities.

## Rules Boundary

Keep a strict distinction:

```text
AGENTS.md
= repository-wide agent entry guidance

.agents/rules/
= scoped agent-working rules

docs/04-standards/
= durable implementation standards that apply beyond agents
```

If a rule applies equally to humans and agents implementing the system, prefer `docs/04-standards/`.

## Commands and Hooks Boundary

Commands and hooks automate workflows; they do not own project truth.

- A command may orchestrate skills, scripts, validation, or documentation workflows.
- A hook may run safety checks, validation, synchronization, or policy enforcement.
- Tool-specific invocation/configuration may live in optional adapters such as `.claude/` or `.github/`.
- Shared intent should remain repository-local and vendor-neutral where practical.

## Existing Repository Safety

When bootstrapping an existing project:

- do not overwrite useful documentation blindly;
- do not delete history merely to fit the new layout;
- classify existing material before moving or consolidating it;
- preserve source code and build configuration;
- preserve existing global/user agent setup rather than copying it into `.agents/`;
- report ambiguous ownership or conflicting truth;
- prefer incremental normalization when migration risk is non-trivial.

## Idempotency

Repeated runs should converge rather than duplicate structure.

- reuse existing canonical directories;
- update root guidance only when repository reality changed;
- do not create duplicate architecture/specification/decision documents;
- do not recreate task-workspace directories;
- do not add `.agents/skills/` unless explicitly requested by the user/project;
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
Competing sources of truth or configuration that require human review.
