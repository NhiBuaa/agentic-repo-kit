# Skill: Establish Project Overview

## Purpose

Establish or reconcile a trustworthy root `PROJECT-OVERVIEW.md` before repository initialization or normalization.

This skill is responsible for understanding the project foundation, identifying what is known versus unresolved, asking only the clarification questions that are actually needed, and producing an overview that downstream repository workflows can rely on.

It does not normalize repository structure, migrate documentation, or invent missing product or architecture decisions.

## When To Use

Use this skill when:

- `PROJECT-OVERVIEW.md` does not exist;
- an existing overview is stale, incomplete, contradictory, or not clearly authoritative;
- a project is new and the main source of truth is the user's idea or requirements;
- an existing repository contains enough evidence to reconstruct the project foundation but still needs reconciliation with the user.

If a trustworthy root `PROJECT-OVERVIEW.md` already exists and the task is to normalize an existing repository, use `normalize-agentic-repo` instead.

## Information Sources

Use available sources in this order of relevance:

1. explicit user statements and decisions;
2. an existing `PROJECT-OVERVIEW.md` when present;
3. repository code, configuration, tests, and build/deployment files;
4. existing README and durable documentation;
5. Issues and Pull Requests when they contain current decisions or state relevant to the project foundation.

Repository evidence is a source of information, not permission to silently resolve ambiguous product decisions.

## Evidence States

Classify important information before writing the overview:

- `VERIFIED` — directly supported by repository evidence or explicitly confirmed by the user;
- `INFERRED` — plausible from evidence but not established strongly enough to become project truth;
- `UNRESOLVED` — important information is missing or intentionally undecided;
- `CONFLICT` — relevant sources disagree.

Only `VERIFIED` information and explicit user decisions should be written as established project truth.

Use `INFERRED` information to guide clarification, not as a substitute for confirmation.

Preserve `UNRESOLVED` items as open questions when they do not need to be decided yet.

Surface `CONFLICT` items explicitly instead of silently choosing a winner.

## Workflow

### 1. Collect Available Context

Read the user's project description and any provided requirements, decisions, constraints, or prior context.

If a repository exists, inspect only enough repository reality to understand the project foundation before asking questions.

### 2. Extract Known Facts

Build an internal picture of what is already established across:

- problem and product intent;
- users or stakeholders when relevant;
- scope and out-of-scope boundaries;
- major constraints and invariants;
- architecture direction already decided;
- development or operational constraints that shape the project;
- current implementation state;
- known significant decisions;
- explicit unresolved questions.

Do not ask the user to repeat information that is already clear and reliable.

### 3. Detect Gaps, Ambiguity, and Conflicts

Identify only the missing or unclear information that materially affects the project foundation.

Distinguish between:

- information that must be clarified now because downstream work would otherwise be unsafe or misleading;
- information that may remain unresolved and should simply be recorded as an open question.

### 4. Ask Adaptive Clarification Questions

Ask focused questions derived from the actual gaps found in the current project.

Do not use a mandatory fixed questionnaire.

Good clarification questions are:

- necessary for the current project;
- small in number;
- specific to a real ambiguity, missing boundary, or conflict;
- phrased so the user can decide without needing to reverse-engineer repository internals.

If the user has not chosen a technology, architecture, deployment target, authentication model, or other major decision, do not choose one merely to complete the overview.

### 5. Draft The Project Foundation

Draft `PROJECT-OVERVIEW.md` using only established information and explicitly unresolved items.

A useful overview may include:

- Problem
- Product / Product Intent
- Users / Stakeholders when relevant
- Scope
- Out of Scope
- Architecture Direction
- Major Constraints / Invariants
- Development or Operational Direction when relevant
- Current State
- Open Questions

Do not force every heading to contain a final decision. Omit irrelevant sections or state that an area remains unresolved.

### 6. Review Before Material Mutation

When creating or materially reconciling an overview, present the proposed foundation and any unresolved conflicts or assumptions for user review before replacing meaningful existing project truth.

If the user has already explicitly approved the exact proposed content in the current task, that approval satisfies this gate.

### 7. Write Or Reconcile `PROJECT-OVERVIEW.md`

Create the root file when it does not exist.

When an overview already exists:

- preserve useful current information;
- update stale statements only when repository reality or user confirmation supports the change;
- remove or reduce competing statements only when ownership is clear;
- keep unresolved conflicts visible until they are actually resolved.

Do not normalize the rest of the repository as part of this skill.

## Output Boundary

`PROJECT-OVERVIEW.md` is the canonical project foundation.

It should describe what the project is, its scope, important constraints, major direction, current state, and unresolved questions.

It should not become:

- a task backlog;
- an implementation plan for one Issue;
- a changelog or historical diary;
- a dump of every repository fact;
- a replacement for detailed architecture, standards, specifications, guides, or runbooks.

## Acceptance Checklist

Before reporting completion, verify all applicable criteria:

- [ ] Available user context and repository evidence were used before asking clarification questions.
- [ ] The user was not asked to repeat information that was already clear and reliable.
- [ ] Clarification questions were derived from real project gaps, ambiguities, or conflicts rather than a fixed questionnaire.
- [ ] No missing product, architecture, infrastructure, or workflow decision was invented.
- [ ] Inference was not presented as established fact.
- [ ] Important unresolved information was preserved as unresolved when it did not need immediate resolution.
- [ ] Conflicting evidence was surfaced explicitly instead of silently reconciled.
- [ ] User confirmation was requested when a material conflict required a decision.
- [ ] `PROJECT-OVERVIEW.md` contains project foundation rather than task backlog or project history.
- [ ] Current state is distinguishable from future aspiration.
- [ ] Existing useful overview information was preserved or intentionally reconciled.
- [ ] An existing overview was not overwritten blindly.
- [ ] The user had an appropriate review/approval opportunity before materially replacing existing project truth.
- [ ] Re-running this skill on unchanged inputs would converge instead of causing meaningless rewrites.

If an applicable criterion fails, do not report the overview as fully established. Report what remains unresolved and why.

## Completion Report

Report:

- overview created or reconciled;
- verified foundation established;
- open questions retained;
- conflicts discovered;
- clarification still required, if any;
- acceptance criteria that could not be satisfied.
