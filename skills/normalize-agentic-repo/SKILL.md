---
name: normalize-agentic-repo
description: Use when an existing repository with meaningful code, documentation, configuration, or history needs to be aligned to the Agentic Repo Kit model.
---

# Normalize Agentic Repository

## Overview

Normalize an existing repository without discarding useful knowledge, inventing missing decisions, or creating competing sources of truth.

**Core principle:** an existing repository is a migration problem, not a template-fill problem. Understand and classify before changing structure.

## Preconditions

Use this skill only when:

- the repository already contains meaningful project material;
- a root `PROJECT-OVERVIEW.md` exists;
- that overview is trustworthy enough to serve as project foundation.

If the overview is missing, stale, contradictory, or not clearly authoritative, use `establish-project-overview` first.

Do not use this skill to initialize an empty repository.

## Classification

Use this vocabulary for important artifacts:

| Class | Meaning |
|---|---|
| `KEEP` | Correct location and ownership already |
| `MIGRATE` | Useful material should move without semantic consolidation |
| `CONSOLIDATE` | Useful overlapping material should be deliberately merged |
| `DEPRECATE` | No longer an appropriate live owner; preserve useful content before retiring |
| `CONFLICT` | Sources disagree and no safe winner is established |
| `UNRESOLVED` | Correct treatment is not yet clear enough to act |

`DEPRECATE` is not permission to delete blindly.

## Workflow

### 1. Inspect Repository Reality

Before material mutation, inspect enough to understand repository knowledge ownership:

- root instructions, `PROJECT-OVERVIEW.md`, and current-context files;
- existing architecture, product, standards, specifications, decisions, guides, runbooks, notes, and generated/reference docs;
- `.agents/` or equivalent agent-local material;
- Issues and Pull Requests when available as the work plane;
- source, tests, configuration, and build/deployment files when needed to verify claims.

### 2. Build A Knowledge Inventory

For each important knowledge/agent artifact, determine:

- current role;
- information type;
- apparent owner;
- whether another artifact owns the same truth;
- whether it is current, stale, conflicting, ambiguous, generated, or historical;
- proposed classification.

Focus on artifacts relevant to ownership and normalization; do not inventory every source file for completeness.

### 3. Detect Ownership Problems

Look for:

- duplicate canonical owners;
- root files carrying detailed durable knowledge that belongs elsewhere;
- task plans, progress, handoffs, review, CI, or verification state stored as durable docs;
- agent-only files containing rules that actually apply to humans/software too;
- current-state files that have become history;
- notes acting as authority;
- docs that conflict with source or tests.

Do not silently resolve a conflict without enough evidence.

### 4. Produce The Normalization Proposal

Before changing repository structure, present this shape:

```markdown
## Repository Snapshot
...

## Knowledge Inventory
| Artifact | Current role | Classification | Proposed owner/location | Risk |
|---|---|---|---|---|
| ... | ... | KEEP/MIGRATE/CONSOLIDATE/DEPRECATE/CONFLICT/UNRESOLVED | ... | ... |

## Authority Conflicts
- ...

## Proposed Changes
- ...

## Requires Explicit Approval
- ...

## Unresolved
- ...

## Acceptance Status
- ...
```

The proposal must make potential knowledge loss and destructive/consolidating operations visible.

**STOP after the proposal. Do not materially mutate the repository until the proposed normalization plan is approved.**

### 5. Apply The Approved Plan

After approval, apply only the approved normalization changes.

Prefer incremental migration when risk is non-trivial. Preserve useful content before deprecating a prior owner. Avoid unrelated refactors.

If the user already approved the exact proposed plan in the current task, that approval satisfies the gate.

### 6. Verify Convergence

After mutation:

- verify canonical paths and ownership;
- verify no useful knowledge was lost;
- verify conflicts remain explicit when unresolved;
- verify work state still belongs to Issues/PRs;
- run the normalization reasoning again and confirm an unchanged repository would produce no meaningful structural churn.

## Canonical Routing Quick Reference

| Information | Canonical owner |
|---|---|
| Project foundation | `PROJECT-OVERVIEW.md` |
| Repository-wide agent entrypoint/routing | `AGENTS.md` |
| Bounded current project state | `CONTEXT.md` |
| Distinct stable orientation | `docs/01-overview/` |
| Current architecture | `docs/02-architecture/` |
| Product/domain knowledge | `docs/03-product/` |
| Normative human/software implementation rules | `docs/04-standards/` |
| Required behavior/contracts | `docs/05-specs/` |
| Significant decision rationale | `docs/06-decisions/` |
| Normal procedures | `docs/07-guides/` |
| Abnormal recovery procedures | `docs/08-runbooks/` |
| Useful non-authoritative retained notes | `docs/99-notes/` |
| Agent-only detailed rules | `.agents/rules/` |
| Non-normative agent supporting material | `.agents/references/` |
| Task scope/plans/progress | Issues |
| Implementation/review/CI/verification | Pull Requests |

`docs/01-overview/` must not mirror `PROJECT-OVERVIEW.md`. `docs/99-notes/` must not become a catch-all migration target. Do not create `.agents/commands/`, `.agents/hooks/`, or `.agents/skills/` by default.

## Acceptance Checklist

Before reporting normalization complete, verify:

- [ ] A trustworthy root `PROJECT-OVERVIEW.md` existed before normalization.
- [ ] Repository reality was inspected before material mutation.
- [ ] Important artifacts were inventoried and classified before migration decisions.
- [ ] Existing useful knowledge was preserved, intentionally migrated, consolidated, or explicitly left unresolved.
- [ ] No unresolved decision was invented or silently resolved.
- [ ] No durable fact has competing canonical owners after normalization.
- [ ] Project-specific docs were not created merely to fill the skeleton.
- [ ] Durable knowledge was routed by meaning, not merely by old folder name.
- [ ] Authority conflicts and ambiguous migrations remain explicit until resolved.
- [ ] The normalization proposal was reviewed before destructive or meaningfully consolidating changes.
- [ ] Issues/PRs remain the work plane.
- [ ] Re-running on unchanged repository state would converge rather than create duplicate files or structural drift.

If an applicable criterion fails, report the failed criterion and unresolved next step instead of claiming normalization is fully complete.
