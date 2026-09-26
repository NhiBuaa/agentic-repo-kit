# Repository Guidance

## Mission

<!-- Concisely describe what this repository exists to build or maintain. -->

## Authority Map

- `PROJECT-OVERVIEW.md` — project foundation and explicit open questions.
- `CONTEXT.md` — current project-state projection.
- `docs/` — durable project knowledge.
- `agent/skills/` — reusable agent workflows.
- `agent/references/` — non-normative supporting material.
- Issues — task scope, planning, progress, and handoff state.
- Pull Requests — implementation discussion, review, CI, and verification.
- source code and tests — implementation reality.

Do not duplicate Issue/PR state in repository markdown files.

## Read Order

For meaningful work:

1. Read this file.
2. Read `PROJECT-OVERVIEW.md` and `CONTEXT.md` when the task requires project-level context.
3. Read the relevant Issue or task.
4. Read only the relevant numbered `docs/` areas.
5. Read an applicable skill/reference when useful.
6. Inspect implementation and tests.

## Critical Invariants

<!-- Keep only high-signal repository-wide invariants here. -->

- Preserve security and authorization boundaries.
- Do not expose secrets or credentials.
- Do not silently change public contracts.
- Do not invent missing product or architecture decisions.

## Working Agreements

- Understand existing implementation before editing.
- Prefer the smallest independently verifiable change.
- Avoid unrelated refactors.
- Preserve unresolved questions instead of guessing.
- Promote durable findings into the correct `docs/` category when needed.

## Validation

```sh
# Replace with project-specific commands.
<test-command>
<lint-command>
<build-command>
```

## Documentation Synchronization

After a meaningful change, ask whether architecture, product knowledge, standards, specifications, decisions, guides, runbooks, or current context changed.

Update only the canonical owner of the affected information.

## Agent Capability Rules

- `agent/skills/` stores reusable workflows, not task state.
- `agent/references/` stores non-normative support material.
- tool-specific directories are adapters only and must not create competing truth.

## Definition of Done

A task is complete when requested behavior is implemented, relevant validation passes, durable documentation is synchronized where necessary, and the Issue/PR reflects the actual work state.
