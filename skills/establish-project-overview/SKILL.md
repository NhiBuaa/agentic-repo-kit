---
name: establish-project-overview
description: Use when PROJECT-OVERVIEW.md is missing, stale, incomplete, contradictory, or not trustworthy enough to guide project work.
---

# Establish Project Overview

## Overview

Establish or reconcile the root `PROJECT-OVERVIEW.md` as trustworthy project foundation.

**Core principle:** project truth must come from explicit user decisions or verified evidence. Inference may guide clarification, but it must not silently become canonical truth.

## When to Use

Use this skill when:

- `PROJECT-OVERVIEW.md` does not exist;
- an existing overview is stale, incomplete, contradictory, or not clearly authoritative;
- a new project needs its foundation captured before repository initialization;
- an existing repository has enough evidence to reconstruct the foundation but still needs reconciliation.

Do not use this skill to normalize repository structure or migrate documentation. If the root overview is already trustworthy and the task is to normalize an existing repository, use `normalize-agentic-repo`.

## Evidence States

Classify important information before writing:

| State | Meaning | May become established truth? |
|---|---|---|
| `VERIFIED` | Explicitly confirmed by the user or directly supported by reliable repository evidence | Yes |
| `INFERRED` | Plausible but not established strongly enough | No; use only to guide clarification |
| `UNRESOLVED` | Missing or intentionally undecided | No; preserve as an open question when appropriate |
| `CONFLICT` | Relevant sources disagree | No; surface the conflict |

## Workflow

### 1. Collect Available Context

Use, in order of relevance:

1. explicit user statements and decisions;
2. an existing root `PROJECT-OVERVIEW.md`;
3. source, configuration, tests, build/deployment files;
4. README and durable documentation;
5. Issues and Pull Requests when they contain current foundation-level decisions or state.

Inspect only enough repository reality to understand the project foundation.

### 2. Assess The Foundation

Determine what is already established across the areas that matter for this project, such as:

- problem and product intent;
- users or stakeholders;
- scope and out-of-scope boundaries;
- major constraints and invariants;
- architecture direction already decided;
- development or operational constraints;
- current implementation state;
- significant established decisions;
- open questions.

Do not force every area to have a final decision.

### 3. Clarify Only What Blocks A Trustworthy Overview

Ask focused questions only for real gaps, ambiguity, or conflicts that materially affect the project foundation.

Do not use a fixed questionnaire and do not ask the user to repeat information already established.

Information that does not need an immediate decision may remain `UNRESOLVED` and be recorded as an open question.

### 4. Present The Foundation Proposal

Before materially creating or reconciling project truth, present this shape:

```markdown
## Foundation Assessment

### Verified
- ...

### Inferred
- ...

### Unresolved
- ...

### Conflicts
- ...

### Clarification Required
- ...

## Proposed PROJECT-OVERVIEW.md
...
```

The proposed `PROJECT-OVERVIEW.md` must contain only verified/user-confirmed truth plus explicitly unresolved questions. Do not carry `INFERRED` statements into it as facts.

If clarification is still required for a material conflict, stop here and ask the user.

### 5. Write Or Reconcile After Review

After the proposal is approved, create or reconcile the root `PROJECT-OVERVIEW.md`.

When reconciling an existing file:

- preserve useful current information;
- update stale statements only when supported by evidence or user confirmation;
- keep unresolved conflicts visible until resolved;
- avoid unrelated rewrites.

If the user already approved the exact proposed content in the current task, that approval satisfies this gate.

## PROJECT-OVERVIEW Contract

The file is the canonical project foundation. It may include:

- Problem / Product Intent
- Users / Stakeholders when relevant
- Scope / Out of Scope
- Architecture Direction
- Major Constraints / Invariants
- Development or Operational Direction when relevant
- Current State
- Open Questions

It is not a task backlog, implementation plan, changelog, historical diary, or replacement for detailed architecture, standards, specifications, guides, or runbooks.

## Acceptance Checklist

Before reporting the overview established, verify:

- [ ] Available context and repository evidence were used before asking questions.
- [ ] Clarification questions came from real gaps, ambiguity, or conflict rather than a fixed questionnaire.
- [ ] No inferred or missing product, architecture, infrastructure, or workflow decision was presented as established truth.
- [ ] Important unresolved items remain explicit when they do not need immediate resolution.
- [ ] Conflicting evidence is surfaced instead of silently reconciled.
- [ ] Existing useful overview information was preserved or intentionally reconciled.
- [ ] The user had an appropriate review opportunity before materially replacing project truth.
- [ ] Re-running on unchanged inputs would converge instead of causing meaningless rewrites.

If an applicable criterion fails, report what remains unresolved instead of claiming the overview is fully established.
