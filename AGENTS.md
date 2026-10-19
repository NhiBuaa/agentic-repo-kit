# Agentic Repo Kit — Repository Guidance

## Mission

Maintain Agentic Repo Kit as a small, vendor-neutral repository convention for human + coding-agent development.

Favor clear ownership, low duplication, predictable discovery, and simple adoption over documentation volume or agent-specific complexity.

## Authority Map

- `PROJECT-OVERVIEW.md` — project foundation, design direction, constraints, and unresolved questions.
- `CONTEXT.md` — current project-state projection.
- `docs/` — durable project knowledge.
- `.agents/rules/` — detailed/scoped agent-only rules.
- `.agents/references/` — non-normative supporting material for agents.
- `skills/` — reusable skills shipped by Agentic Repo Kit itself.
- Issues — work scope, planning, progress, and handoff state.
- Pull Requests — implementation discussion, review, CI, and verification.
- source code and tests — implementation reality.

Do not recreate Issue/PR state inside repository markdown files.

## Developer-Led Playbooks

When assisting a human developer, choose the relevant **human-facing** playbook:

- **[Playbook 1 — Start from zero](docs/07-guides/project-start-playbook.md)** for new ideas, scope, architecture and the first end-to-end slice.
- **[Playbook 2 — Develop a feature](docs/07-guides/feature-development-playbook.md)** for changes to an existing system: current behavior, impact, focused design, tests and review.

The developer owns understanding, scope, decisions and verification. An agent may explain, challenge assumptions, draft diagrams or implement only within authorized scope. These are reading guides, **not** autonomous skills or write permissions. Do not restart project discovery for a normal feature.

## Read Order

For meaningful work:

1. Read this file.
2. Read `PROJECT-OVERVIEW.md` and `CONTEXT.md` when project-level context matters.
3. Read the relevant Issue or task.
4. Read only the relevant numbered `docs/` areas.
5. Read relevant `.agents/rules/` or `.agents/references/` when routed there.
6. Use an applicable toolkit skill when the task calls for one.
7. Inspect implementation and tests.

## Repository Model

```text
PROJECT-OVERVIEW → project foundation
AGENTS           → agent entrypoint + routing
CONTEXT          → current project state
docs             → durable project knowledge
.agents          → project-local agent rules + references
Issues / PRs     → work state
skills           → Agentic Repo Kit toolkit capabilities
```

## Boundary Rules

- `.agents/` must not become a second task tracker.
- `.agents/rules/` is for agent-only behavior. If humans or the software must obey the same rule, prefer `docs/04-standards/`.
- `.agents/references/` is supporting material, not authority.
- Do not add `.agents/commands/`, `.agents/hooks/`, or `.agents/skills/` by default.
- Personal/global skills stay outside the repository unless explicitly requested.
- Changes to the canonical repository model should update README, templates, and all affected toolkit skills together.

## Change Discipline

- inspect existing repository reality before editing;
- avoid unrelated refactors;
- do not invent missing product or architecture decisions;
- preserve unresolved questions as unresolved questions;
- promote durable findings from Issues/PRs into the correct `docs/` category when necessary.

## Selective Issue/PR Closeout

At normal task closeout, consider only reusable findings; no new lesson is a valid outcome.

- Verify each candidate against code/tests or an accepted decision, and link its Issue/PR evidence or commit. Distinguish proposed, implemented, accepted, merged and deployed; one does not imply the others.
- Update an existing owner, not a second copy: decisions in the relevant architecture record, software invariants in standards, operational pitfalls in the relevant guide/runbook, and agent-only routing in AGENTS or scoped rules. Prefer a regression check for executable behavior; do not create a skill, hook or knowledge store just to record a lesson.
- Make small, safe corrections within the already approved scope without another approval checkpoint. Include them in the normal diff and completion report.
- Propose out-of-scope policy, architecture or knowledge-authority changes for approval before applying them. Do not block unrelated approved completion on such a proposal. Closeout never grants publication, deployment, installation or permission changes.
- Keep transient progress in the Issue/PR. Preserve historical evidence and untracked files; link rather than copy logs or conversations. Memory and old notes are retrieval aids, not overrides of verified implementation or accepted decisions.

Report briefly: no reusable finding, updated owner + evidence, or an out-of-scope proposal awaiting approval.

## Validation

For structural changes, verify documented paths exist, obsolete paths are no longer referenced, root live files remain distinct from reusable templates, and all affected toolkit skills describe the same repository model.

## Definition of Done

A structural change is complete when the repository model, documentation map, templates, and affected toolkit workflows agree with one another without duplicate authority.
