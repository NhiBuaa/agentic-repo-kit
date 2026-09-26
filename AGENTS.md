# Repository Guidance

## Mission

Agentic Repo Kit is a vendor-neutral repository operating system for software projects developed by humans and coding agents.

This repository defines the standard, reusable templates, and skills used to bootstrap that operating model into other projects.

## Authority Map

Use repository information according to the following ownership model:

- `PROJECT-OVERVIEW.md` — foundation, scope, constraints, design direction, and open questions for Agentic Repo Kit itself.
- `AGENTS.md` — repository-wide instructions for agents working on this repository.
- `CONTEXT.md` — bounded current-state projection for this repository.
- `docs/` — durable documentation and canonical folder contracts.
- `templates/` — reusable files intended for consumer projects; these are not live governance for this repository.
- `skills/` — reusable automation for applying Agentic Repo Kit conventions.
- Issue / PR tracker — execution status as project work is tracked there.
- `.agents/` — task-local plans, handoffs, reviews, evidence, and scratch work.

Do not confuse root live files with files under `templates/`.

## Read Order

For meaningful work on Agentic Repo Kit:

1. Read this file.
2. Read `CONTEXT.md`.
3. Read the relevant Issue or task when one exists.
4. Read `PROJECT-OVERVIEW.md` when project scope, foundational intent, or open questions matter.
5. Read only the documentation, template, or skill files relevant to the change.
6. Verify the resulting repository structure and references.

Do not load every template or folder manual for unrelated changes.

## Critical Invariants

- Remain vendor-neutral; no coding-agent vendor may become the canonical source of project truth.
- Root `AGENTS.md`, `CONTEXT.md`, and `PROJECT-OVERVIEW.md` describe Agentic Repo Kit itself. Reusable consumer versions belong under `templates/`.
- Keep one canonical owner for each important information class and prefer references over duplicated authority.
- Canonical folders remain visible with local `README.md` contracts even when no project-specific artifact exists inside them yet.
- The bootstrap skill must not silently convert open questions or missing information into project decisions.
- `docs/` owns durable knowledge; `.agents/` owns task-local agent work.
- Do not reintroduce the legacy `.template/` structure.

## Working Agreements

- Prefer simple conventions that a developer can understand without memorizing a large framework.
- Keep templates concise and remove fields that do not serve a clear purpose.
- Keep skills deterministic, idempotent where practical, and explicit about unresolved information.
- Avoid adding new artifact classes unless an existing class cannot own the information cleanly.
- Do not perform unrelated refactors while changing repository conventions.
- When changing a canonical convention, update affected templates, folder manuals, skills, and README guidance as needed so they do not drift.

## Validation

There is no executable product test suite yet.

For repository-structure or documentation changes, verify at minimum:

- no obsolete `.template/` paths remain;
- root live files are not written as consumer placeholders;
- template references resolve to `templates/`;
- canonical folders retain their local `README.md` contracts;
- `skills/bootstrap-agentic-repo/SKILL.md` remains consistent with the documented target structure;
- no new duplicate authority is introduced.

If executable tooling is added later, add its real validation commands here.

## Documentation Synchronization

After a meaningful change, update only the artifact classes whose owned truth changed:

- project foundation → `PROJECT-OVERVIEW.md`;
- current repository state → `CONTEXT.md`;
- durable repository model → `docs/`;
- consumer starter content → `templates/`;
- automation behavior → `skills/`;
- public usage flow → `README.md`.

Do not keep independent copies of the same authoritative rule in multiple locations.

## Governance Changes

Changes to this file, the authority model, canonical structure, or bootstrap behavior are governance changes and must be intentional and reviewable.

An agent must not rewrite governing rules merely to make an implementation appear compliant.

## Definition of Done

A task is complete when:

- the requested repository-model change is implemented;
- related templates, skills, and local manuals remain consistent;
- obsolete paths or duplicated authority introduced by the change are removed;
- the public README still describes the actual user flow;
- `CONTEXT.md` is synchronized when current project state materially changes.
