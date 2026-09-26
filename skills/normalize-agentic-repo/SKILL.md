# Skill: Normalize Agentic Repository

## Purpose

Normalize an existing software repository into the Agentic Repo Kit model without discarding useful knowledge, inventing missing decisions, or creating competing sources of truth.

This skill is specifically for repositories that already contain meaningful code, documentation, configuration, history, or agent-specific structure.

It does not establish the project foundation from scratch and does not initialize an empty repository.

## Preconditions

Before normalization:

- the repository already contains meaningful project material;
- a root `PROJECT-OVERVIEW.md` exists;
- that overview is trustworthy enough to serve as the project foundation.

If `PROJECT-OVERVIEW.md` is missing, stale, contradictory, or not clearly authoritative, stop and use `establish-project-overview` first.

## Normalization Principle

Existing repositories are migrations, not template fills.

The workflow must first understand what already exists, classify it, detect ownership problems, and propose a normalization plan before materially changing repository structure.

Do not make the repository look canonical by deleting or rewriting evidence that has not yet been understood.

## Phase 1 — Inspect Repository Reality

Before proposing changes:

1. inspect the existing repository tree;
2. read root instructions and current-context files;
3. read `PROJECT-OVERVIEW.md`;
4. identify existing architecture, product, standards, specifications, decisions, guides, runbooks, notes, and generated/reference documentation;
5. inspect existing `.agents/` or equivalent project-local agent material;
6. identify repository Issues and Pull Requests as the work plane when available;
7. inspect source, tests, configuration, and build/deployment files when needed to verify documentation claims.

Do not mutate files during this phase.

## Phase 2 — Build A Knowledge Inventory

Inventory existing artifacts that materially participate in project knowledge or agent behavior.

For each important artifact, determine:

- what information it contains;
- whether that information is durable project knowledge, current state, work state, agent-only guidance, supporting reference material, generated material, or obsolete/historical material;
- whether another artifact already owns the same truth;
- whether the artifact appears current, stale, conflicting, or ambiguous.

Do not inventory every source file merely for completeness. Focus on artifacts that affect repository knowledge ownership and normalization.

## Phase 3 — Classify Artifacts

Use this small classification vocabulary:

- `KEEP` — already in an appropriate place with appropriate ownership;
- `MIGRATE` — useful material should move to a clearer canonical location without semantic consolidation;
- `CONSOLIDATE` — useful material overlaps another owner and should be merged deliberately;
- `DEPRECATE` — material is no longer an appropriate live owner and should be retired only after useful content is preserved;
- `CONFLICT` — sources disagree and a safe winner cannot be chosen automatically;
- `UNRESOLVED` — correct treatment is not yet clear enough to act.

Do not use `DEPRECATE` as a shortcut for deletion.

## Phase 4 — Detect Authority Conflicts And Duplication

Identify cases where:

- the same durable fact has multiple apparent canonical owners;
- root files repeat detailed durable documentation;
- task plans, progress, handoffs, reviews, CI results, or verification evidence are stored as durable project knowledge;
- agent-only files contain product, architecture, or software standards that should apply to humans too;
- current-state files have become project history;
- notes have become de facto authority;
- existing documentation conflicts with source or tests.

Report conflicts instead of silently resolving them when evidence is insufficient.

## Phase 5 — Produce A Normalization Plan

Before mutation, present a plan that includes:

- proposed canonical structure changes;
- important artifact classifications;
- files to keep, migrate, consolidate, deprecate, or leave unresolved;
- authority conflicts and duplicates discovered;
- information that would be lost if a proposed consolidation were done incorrectly;
- destructive or meaningfully consolidating operations that need explicit approval;
- open questions that block safe normalization.

Prefer incremental normalization when migration risk is non-trivial.

## Approval Gate

Do not proceed from planning to material repository mutation until the user has approved the proposed normalization plan.

Explicit approval is required before operations such as:

- deleting or retiring meaningful documentation;
- renaming or moving canonical owners;
- consolidating multiple documents into one;
- replacing an existing root authority file;
- resolving an authority conflict that requires a project decision.

If the user has already explicitly approved the exact plan in the current task, that approval satisfies this gate.

## Canonical Consumer Structure

After approved normalization, the repository should converge toward this discoverable model:

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

Folder README files may be added to make the canonical categories discoverable, but project-specific documents inside those folders should exist only when supported by real project information.

## Root File Normalization

### `AGENTS.md`

Keep repository-wide agent guidance concise and high signal.

It may contain:

- repository mission;
- authority map;
- read order;
- high-signal invariants;
- validation expectations;
- documentation synchronization rules;
- routing to `.agents/rules/` and `.agents/references/`;
- guidance for Issues/PRs as the work plane.

Do not turn it into a complete architecture manual, task plan, or project history.

### `CONTEXT.md`

Normalize it into a bounded current-state projection.

Keep current product boundary, implementation state, active direction, important transitions, meaningful limitations, and canonical references.

Move durable knowledge to its canonical documentation owner when appropriate, and do not preserve historical accumulation merely because it already exists.

## Durable Documentation Routing

Route durable project knowledge by meaning:

- distinct stable orientation beyond the root foundation → `docs/01-overview/`
- current architecture → `docs/02-architecture/`
- product/domain knowledge → `docs/03-product/`
- normative implementation rules → `docs/04-standards/`
- required behavior → `docs/05-specs/`
- significant decision rationale → `docs/06-decisions/`
- normal procedures → `docs/07-guides/`
- abnormal recovery procedures → `docs/08-runbooks/`
- useful non-authoritative retained notes → `docs/99-notes/`

### `PROJECT-OVERVIEW.md` vs `docs/01-overview/`

`PROJECT-OVERVIEW.md` remains the canonical project foundation. It owns project intent, scope, major constraints, architecture direction, current state, and explicit open questions at foundation level.

Use `docs/01-overview/` only for distinct stable orientation such as glossary, repository map, domain map, system landscape, or conceptual navigation.

Do not create overview documents that merely mirror or paraphrase the root overview.

### `docs/99-notes/`

`docs/99-notes/` is the canonical location for useful non-authoritative retained notes.

Do not use it as a dumping ground for material that is difficult to classify. Do not move task plans, progress, handoffs, reviews, or verification evidence there.

If a retained note contains durable authoritative knowledge, promote that knowledge to the appropriate stronger owner and reduce the competing note.

## Project-Local Agent Configuration

Use `.agents/` only for project-local agent-specific support:

- `.agents/rules/` — detailed or scoped agent-only rules;
- `.agents/references/` — non-normative supporting material.

Do not use `.agents/` for task plans, progress, handoffs, PR reviews, or verification evidence.

If an existing agent rule also applies to human developers or defines software behavior, migrate the durable rule to `docs/04-standards/` and keep only agent-specific routing when needed.

## Work Plane

Issues own task scope, acceptance criteria, implementation planning, progress, and handoff state.

Pull Requests own implementation discussion, review, CI, and verification.

Do not recreate those states as repository markdown during normalization.

## Existing Repository Safety

During approved mutation:

- do not overwrite useful documentation blindly;
- do not delete history just to fit the new layout;
- preserve useful content before deprecating a prior owner;
- preserve source code and build configuration unless the approved task explicitly includes changing them;
- avoid unrelated refactors;
- keep ambiguous ownership visible until resolved;
- prefer the smallest change that creates clear ownership.

## Idempotency

Running normalization again on an unchanged repository should converge rather than create new churn.

On repeated runs:

- reuse existing canonical directories;
- do not recreate already migrated documents;
- do not create duplicate architecture, specification, or decision documents;
- do not create `docs/01-overview/` documents that repeat `PROJECT-OVERVIEW.md`;
- do not create `docs/99-notes/` files merely because the directory exists;
- do not move files back and forth between equivalent categories;
- preserve explicit project choices that remain valid;
- report unresolved conflicts consistently.

## Acceptance Checklist

Before reporting normalization complete, verify all applicable criteria:

- [ ] A trustworthy root `PROJECT-OVERVIEW.md` existed before normalization began.
- [ ] Repository reality was inspected before material mutation.
- [ ] Important existing knowledge and agent artifacts were inventoried before migration decisions were made.
- [ ] Important migrations and consolidations have an explicit classification.
- [ ] Existing useful knowledge was preserved, intentionally migrated, or deliberately consolidated rather than discarded blindly.
- [ ] No unresolved product, architecture, infrastructure, or workflow decision was invented or silently resolved.
- [ ] No durable fact was given a competing canonical owner.
- [ ] No project-specific document was created merely to fill the canonical skeleton.
- [ ] Durable project knowledge was routed to the correct documentation category by meaning.
- [ ] `PROJECT-OVERVIEW.md` remains the project foundation and `docs/01-overview/` does not mirror it.
- [ ] `docs/99-notes/` remains non-authoritative and is not used as a catch-all migration target.
- [ ] `.agents/` contains only justified project-local agent rules and references by default.
- [ ] Task plans, progress, handoffs, reviews, CI state, and verification evidence remain in Issues and Pull Requests rather than durable docs.
- [ ] Authority conflicts and ambiguous ownership were reported instead of silently resolved.
- [ ] Unclear migrations remained unresolved until enough evidence or user direction existed.
- [ ] A normalization plan was presented before material migration.
- [ ] Required user approval was obtained before destructive or meaningfully consolidating changes.
- [ ] Normalization used incremental changes where migration risk was non-trivial.
- [ ] Re-running normalization on unchanged repository state would converge instead of creating duplicate files or structural drift.

If any applicable criterion fails, do not report normalization as fully complete. Report the failed criterion, affected artifact, and unresolved next step.

## Completion Report

Report:

- kept artifacts;
- migrated artifacts;
- consolidated artifacts;
- deprecated artifacts;
- unresolved items;
- authority conflicts;
- open questions;
- acceptance criteria that could not be satisfied.
