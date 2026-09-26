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
5. inspect existing `.agents/` project-local agent configuration when present;
6. preserve useful existing information and report authority conflicts instead of silently choosing a winner.

## Canonical Output Structure

Ensure the consumer repository has this discoverable skeleton:

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
├── rules/README.md
└── references/README.md
```

Do not create `.agents/commands/`, `.agents/hooks/`, or `.agents/skills/` by default.

- commands are unnecessary when the project already uses explicit workflow planning and reusable skills;
- hooks can duplicate workflow gates if they are used as orchestration;
- personal/global skills remain outside the consumer repository unless the user explicitly wants project-local skills.

Folder README files should exist even when no project-specific content is available yet. They keep the intended structure visible in Git and explain the local contract. Project-specific documents inside those folders are optional and should exist only when supported by real project information.

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
- routing to `.agents/rules/` and `.agents/references/` when relevant;
- guidance for Issues/PRs as the work plane.

Do not place complete architecture, task plans, or project history in `AGENTS.md`.

### `CONTEXT.md`

Generate a bounded current-state projection from repository reality and verified overview information.

Include current product boundary, implementation state, active direction, important transitions, meaningful limitations, and canonical references.

Do not turn it into an issue backlog or historical diary.

## Durable Documentation

Create project-specific documentation only when supported by `PROJECT-OVERVIEW.md`, existing code, existing documentation, or explicit decisions.

Route information by meaning:

- expanded stable orientation distinct from the root project foundation → `docs/01-overview/`
- current architecture → `docs/02-architecture/`
- product/domain knowledge → `docs/03-product/`
- normative implementation rules → `docs/04-standards/`
- required behavior → `docs/05-specs/`
- significant decision rationale → `docs/06-decisions/`
- normal procedures → `docs/07-guides/`
- abnormal recovery procedures → `docs/08-runbooks/`
- useful non-authoritative retained notes → `docs/99-notes/`

### `PROJECT-OVERVIEW.md` vs `docs/01-overview/`

`PROJECT-OVERVIEW.md` is the canonical project foundation. It owns project intent, scope, major constraints, architecture direction, current state, and explicit open questions.

Use `docs/01-overview/` only when there is distinct stable orientation worth retaining, such as a glossary, repository map, domain map, system landscape, or conceptual navigation material.

Do not create overview documents merely to paraphrase or mirror `PROJECT-OVERVIEW.md`. If no distinct orientation material exists, keep only `docs/01-overview/README.md`.

### `docs/99-notes/`

`docs/99-notes/` is the canonical location for useful non-authoritative retained notes. The folder and its `README.md` are part of the skeleton; actual note files are optional.

Do not create notes merely to populate the directory. Do not use it for scratch work, task progress, handoffs, review logs, or verification evidence.

If a note becomes durable authoritative project knowledge, promote it into the appropriate stronger documentation category and remove or reduce the competing note.

## Project-Local Agent Configuration

Use `.agents/` only for configuration that helps agents work inside the project:

- `.agents/rules/` — detailed or scoped agent-only rules;
- `.agents/references/` — non-normative supporting material.

Do not use `.agents/` for task plans, progress, handoffs, PR reviews, or verification evidence. Keep those in Issues and Pull Requests.

If a rule also applies to human developers or defines software behavior, place it in `docs/04-standards/` instead of `.agents/rules/`.

## Toolkit Skills

`bootstrap-agentic-repo` is a skill provided by Agentic Repo Kit itself and lives in the toolkit repository under:

```text
skills/bootstrap-agentic-repo/SKILL.md
```

Do not copy the toolkit `skills/` directory into the consumer repository by default.

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
- do not create `01-overview` documents that merely repeat `PROJECT-OVERVIEW.md`;
- do not create `99-notes` files just because the directory exists;
- preserve explicit user choices about global vs project-local skills;
- report unresolved conflicts.

## Completion Report

Report created, updated, preserved, derived, open questions, and conflicts.
