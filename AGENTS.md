# Repository Guidance

## Mission

<!-- Replace with a concise description of what this repository exists to build or maintain. -->

## Authority Map

Use repository information according to the following ownership model:

- `AGENTS.md` — repository-wide agent working agreements.
- `CONTEXT.md` — current project-state projection.
- `docs/architecture/` — current system architecture.
- `docs/standards/` — normative implementation rules, if present.
- `docs/adr/` — rationale for significant architectural decisions, if present.
- `docs/specs/` — accepted required behavior.
- the Issue / PR tracker — work status and execution tracking.
- `.agents/` — task-local plans, handoffs, reviews, and evidence.

Do not treat task-local artifacts as durable architecture authority.

## Read Order

For meaningful work:

1. Read this file.
2. Read `CONTEXT.md`.
3. Read the relevant Issue or task.
4. Read relevant Specifications.
5. Read only the Architecture, Standards, and ADRs relevant to the change.
6. Inspect implementation and tests.

Do not load unrelated documentation without a reason.

## Critical Invariants

<!-- Keep only high-signal repository-wide invariants here. Link to Standards for detailed rules. -->

- Preserve security and authorization boundaries.
- Do not expose secrets or credentials.
- Do not silently change public contracts.
- Do not bypass canonical repository authority for convenience.

## Working Agreements

- Understand the existing implementation before editing.
- Prefer the smallest independently verifiable change.
- Avoid unrelated refactors.
- Do not treat plans, handoffs, or reviews as authoritative requirements.
- Preserve backward compatibility unless the task explicitly changes it.
- When repository reality conflicts with task-local notes, verify the current implementation and canonical documentation before proceeding.

## Validation

Run the checks relevant to the changed area.

```sh
# Replace with repository-specific commands.
<test-command>
<lint-command>
<build-command>
```

Use targeted validation first and broader regression checks when risk justifies them.

## Documentation Synchronization

After a meaningful implementation change, ask:

- Did current architecture change?
  - Update `docs/architecture/`.
- Did a normative implementation rule change?
  - Update `docs/standards/` if that artifact class exists.
- Was a significant architectural decision made?
  - Add or supersede an ADR if ADRs are used.
- Did required behavior change?
  - Update the relevant Specification.
- Did the project's current boundary, milestone, limitation, or active transition materially change?
  - Update `CONTEXT.md`.

Do not duplicate the same authoritative fact across multiple files.

## Governance Changes

Changes to this file or other high-authority governance artifacts must be intentional and reviewable.

An agent must not rewrite governing rules merely to make an implementation appear compliant.

## Definition of Done

A task is complete when:

- requested behavior is implemented;
- relevant tests or verification pass;
- architectural and security invariants remain satisfied;
- durable documentation is synchronized where necessary;
- unnecessary temporary artifacts are cleaned up.
