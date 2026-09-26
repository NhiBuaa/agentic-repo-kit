# Agentic Repo Kit — Repository Guidance

## Mission

Maintain Agentic Repo Kit as a small, vendor-neutral repository convention for human + coding-agent development.

Favor clear ownership, predictable discovery, reusable agent infrastructure, and simple adoption over documentation volume or duplicated task tracking.

## Authority Map

- `PROJECT-OVERVIEW.md` — product intent, scope, design direction, constraints, and unresolved questions for this project.
- `CONTEXT.md` — current project-state projection.
- `docs/` — durable project knowledge.
- `.agents/commands/` — repository-local explicit workflow entrypoints.
- `.agents/hooks/` — repository-local event-triggered automation and guardrails.
- `.agents/rules/` — scoped agent-working rules.
- `.agents/references/` — non-authoritative supporting material.
- `skills/` — reusable skills shipped by Agentic Repo Kit itself.
- Issues — work scope, implementation planning, progress, and handoff state.
- Pull Requests — implementation discussion, review, CI, and verification.
- source code and tests — implementation reality.

Do not recreate Issue/PR state inside `.agents/` or repository documentation.

## Read Order

For onboarding or broad repository changes:

1. Read this file.
2. Read `PROJECT-OVERVIEW.md`.
3. Read `CONTEXT.md`.
4. Read the relevant Issue or task.
5. Read only the relevant numbered `docs/` areas.
6. Read relevant `.agents/rules/`, references, commands, or hooks when the task calls for them.
7. Read an applicable system skill under `skills/` when performing an Agentic Repo Kit workflow.
8. Inspect implementation and tests.

For small changes, use the minimum context required.

## Repository Model

```text
PROJECT-OVERVIEW → project foundation
AGENTS           → repository-wide agent entry guidance
CONTEXT          → current project state
docs             → durable project knowledge
.agents          → repository-local agent infrastructure
skills           → Agentic Repo Kit system skills
Issues / PRs     → work state
```

`.agents/` must not become a second knowledge base or task tracker.

## Documentation Rules

- Keep one canonical owner for each durable fact.
- Prefer references over duplicated explanations.
- Keep numbered `docs/` folders as stable discovery categories.
- Use `docs/04-standards/` for normative implementation rules.
- Use `docs/06-decisions/` for significant decision rationale.
- Use `docs/99-notes/` only for non-authoritative retained notes.
- Promote durable findings from Issues/PRs into the correct documentation category when necessary.

## Agent Infrastructure Rules

- Commands encode explicit repository-local workflow entrypoints; they do not own project truth.
- Hooks automate existing checks, synchronization, or guardrails; they must not hide unique business rules.
- `.agents/rules/` is for scoped agent-working instructions. If a rule applies to human implementations as well, prefer `docs/04-standards/`.
- `.agents/references/` may contain examples, patterns, and checklists, but these are non-authoritative.
- Do not add `.agents/skills/` by default. Personal or organization skills may be managed globally by the user.
- The bootstrap skill belongs to this toolkit at `skills/bootstrap-agentic-repo/SKILL.md`.
- Tool-specific configuration such as `.claude/` or `.github/` is an adapter layer only.

## Work Plane

Use Issues for task scope, acceptance criteria, planning, progress, and handoff updates.

Use Pull Requests for implementation discussion, review, CI, and verification.

Do not recreate plans, handoffs, review logs, or evidence directories under `.agents/` unless a future explicit design decision changes this model.

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
- verify templates and the bootstrap skill describe the same consumer structure;
- verify root live files remain distinct from reusable templates;
- verify Issue/PR responsibilities are not duplicated in `.agents/`.

## Definition of Done

A structural change is complete when the repository model, documentation map, agent infrastructure, templates, and bootstrap workflow agree with one another and no duplicate authority remains.
