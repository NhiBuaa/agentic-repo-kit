# Agentic Repo Kit — Repository Guidance

## Mission

Maintain Agentic Repo Kit as a small, vendor-neutral repository convention for human + coding-agent development.

Favor clear ownership, low duplication, predictable discovery, and simple adoption over documentation volume or agent-specific complexity.

## Authority Map

- `PROJECT-OVERVIEW.md` — product intent, scope, design direction, constraints, and unresolved questions for this project.
- `CONTEXT.md` — current project-state projection.
- `docs/` — durable project knowledge.
- `agent/skills/` — reusable agent workflows.
- `agent/references/` — supporting examples and non-normative reference material.
- Issues — work scope, implementation planning, progress, and handoff state.
- Pull Requests — implementation discussion, review, CI, and verification.
- source code and tests — implementation reality.

Do not recreate Issue/PR state inside repository markdown files.

## Read Order

For onboarding or broad repository changes:

1. Read this file.
2. Read `PROJECT-OVERVIEW.md`.
3. Read `CONTEXT.md`.
4. Read the relevant Issue or task.
5. Read only the relevant numbered `docs/` areas.
6. Read an applicable skill or reference when the task calls for one.
7. Inspect implementation and tests.

For small changes, use the minimum context required.

## Repository Model

Keep these boundaries intact:

```text
PROJECT-OVERVIEW → project foundation
AGENTS           → agent working rules
CONTEXT          → current project state
docs             → durable project knowledge
agent            → reusable agent capabilities
Issues / PRs     → work state
```

`agent/` must not become a second knowledge base or task tracker.

## Documentation Rules

- Keep one canonical owner for each durable fact.
- Prefer references over duplicated explanations.
- Keep numbered `docs/` folders as stable discovery categories.
- Use `docs/04-standards/` for normative implementation rules.
- Use `docs/06-decisions/` for significant decision rationale.
- Use `docs/99-notes/` only for non-authoritative material that does not belong elsewhere.
- Promote durable findings from Issues/PRs into the correct documentation category when necessary.

## Agent Capability Rules

- Skills should encode reusable workflows, not project truth.
- References may provide examples, patterns, or supporting material, but must not silently become normative rules.
- Tool-specific configuration such as `.claude/` or `.github/` is an adapter layer only.
- Do not duplicate canonical rules across vendor-specific adapters.

## Change Discipline

- Inspect existing repository reality before editing.
- Avoid unrelated refactors.
- Do not invent missing product or architecture decisions.
- Preserve unresolved questions as unresolved questions.
- Changes to the canonical repository model should update the root README, bootstrap skill, and affected templates together.

## Validation

For structural changes:

- verify all documented paths exist;
- verify removed paths are no longer referenced;
- verify templates and the bootstrap skill describe the same output structure;
- verify root live files remain distinct from reusable templates;
- verify no task-state artifact is reintroduced without an explicit reason.

## Definition of Done

A structural change is complete when the repository model, documentation map, templates, and bootstrap workflow agree with one another and no duplicate authority remains.
