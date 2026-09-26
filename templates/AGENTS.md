# Repository Guidance

## Mission

<!-- Concisely describe what this repository exists to build or maintain. -->

## Authority Map

- `PROJECT-OVERVIEW.md` — project foundation and explicit open questions.
- `CONTEXT.md` — current project-state projection.
- `docs/` — durable project knowledge.
- `.agents/rules/` — detailed/scoped agent-only rules.
- `.agents/references/` — non-normative supporting material for agents.
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
5. Read applicable `.agents/rules/` or `.agents/references/` when useful.
6. Inspect implementation and tests.

## Critical Invariants

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

## Agent Configuration Rules

- `.agents/rules/` is for agent-only behavior.
- `.agents/references/` is non-normative support material.
- If humans or the software must obey a rule too, prefer `docs/04-standards/`.
- Do not create `.agents/commands/`, `.agents/hooks/`, or `.agents/skills/` unless the project has a concrete need for them.

## Validation

```sh
# Replace with project-specific commands.
<test-command>
<lint-command>
<build-command>
```

## Definition of Done

A task is complete when requested behavior is implemented, relevant validation passes, durable documentation is synchronized where necessary, and the Issue/PR reflects the actual work state.
