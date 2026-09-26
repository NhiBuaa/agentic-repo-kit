# Repository Guidance

## Mission

Summarize what this repository exists to build or maintain.

## Authority Map

Use repository information according to the following ownership model:

- `PROJECT-OVERVIEW.md` — project foundation and bootstrap input.
- `AGENTS.md` — repository-wide agent working agreements.
- `CONTEXT.md` — current project-state projection.
- `docs/architecture/` — current system architecture.
- `docs/standards/` — normative implementation rules.
- `docs/adr/` — significant decision rationale.
- `docs/specs/` — durable required behavior.
- Issue / PR tracker — work status and execution tracking.
- `.agents/` — task-local plans, handoffs, reviews, evidence, and scratch work.

Do not treat task-local artifacts as durable project authority.

## Read Order

For meaningful work:

1. Read this file.
2. Read `CONTEXT.md`.
3. Read the relevant Issue or task.
4. Read relevant Specifications.
5. Read only the Architecture, Standards, and ADRs relevant to the change.
6. Inspect implementation and tests.

Use `PROJECT-OVERVIEW.md` when project intent, scope, constraints, or unresolved foundational questions matter to the task.

## Critical Invariants

List only high-signal repository-wide invariants here. Link to Standards for detailed subsystem rules.

## Working Agreements

- Understand existing implementation before editing.
- Prefer the smallest independently verifiable change.
- Avoid unrelated refactors.
- Do not treat Plans, Handoffs, Reviews, or Evidence as requirements.
- Do not invent unresolved project decisions.
- Preserve backward compatibility unless the task explicitly changes it.

## Validation

Replace this section with repository-specific validation commands.

```sh
<test-command>
<lint-command>
<build-command>
```

## Documentation Synchronization

After a meaningful change, update only the artifact classes whose owned truth changed:

- Architecture → `docs/architecture/`
- Normative rule → `docs/standards/`
- Significant decision → `docs/adr/`
- Required behavior → `docs/specs/`
- Current project state → `CONTEXT.md`

Do not duplicate authoritative facts across multiple files.

## Governance Changes

Changes to high-authority governance artifacts must be intentional and reviewable. Do not rewrite rules merely to make an implementation appear compliant.

## Definition of Done

A task is complete when requested behavior is implemented, relevant verification passes, important invariants remain satisfied, durable documentation is synchronized where necessary, and disposable task artifacts are cleaned up.
