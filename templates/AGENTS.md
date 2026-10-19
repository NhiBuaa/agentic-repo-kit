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

## Selective Issue/PR Closeout

At normal task closeout, consider only reusable findings; no new lesson is a valid outcome.

- Verify each candidate against code/tests or an accepted decision, and link its Issue/PR evidence or commit. Distinguish proposed, implemented, accepted, merged and deployed; one does not imply the others.
- Update an existing owner, not a second copy: decisions in the relevant architecture record, software invariants in standards, operational pitfalls in the relevant guide/runbook, and agent-only routing in AGENTS or scoped rules. Prefer a regression check for executable behavior; do not create a skill, hook or knowledge store just to record a lesson.
- Make small, safe corrections within the already approved scope without another approval checkpoint. Include them in the normal diff and completion report.
- Propose out-of-scope policy, architecture or knowledge-authority changes for approval before applying them. Do not block unrelated approved completion on such a proposal. Closeout never grants publication, deployment, installation or permission changes.
- Keep transient progress in the Issue/PR. Preserve historical evidence and untracked files; link rather than copy logs or conversations. Memory and old notes are retrieval aids, not overrides of verified implementation or accepted decisions.

Report briefly: no reusable finding, updated owner + evidence, or an out-of-scope proposal awaiting approval.

## Validation

```sh
# Replace with project-specific commands.
<test-command>
<lint-command>
<build-command>
```

## Definition of Done

A task is complete when requested behavior is implemented, relevant validation passes, durable documentation is synchronized where necessary, and the Issue/PR reflects the actual work state.
