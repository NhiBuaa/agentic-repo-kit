---
name: bootstrap-agentic-repo
description: Bootstrap or align a software repository using Agentic Repo Kit conventions, with PROJECT-OVERVIEW.md as the primary project input.
---

# Bootstrap Agentic Repo

## Purpose

Initialize or align a software repository so humans and coding agents have a clear, low-ambiguity information structure.

The bootstrap flow is:

```text
Analyze project
    ↓
PROJECT-OVERVIEW.md
    ↓
bootstrap-agentic-repo
    ↓
AGENTS.md + CONTEXT.md + canonical folders
    ↓
ready for normal development
```

The skill must optimize for simplicity, explicit authority, low duplication, and low context volume.

## Required Input

The target repository must contain:

```text
PROJECT-OVERVIEW.md
```

Use it as the primary source for project intent, scope, architecture direction, concepts, constraints, invariants, current state, workflow expectations, and open questions.

If `PROJECT-OVERVIEW.md` is missing or too incomplete to support a useful bootstrap, stop before inventing details. Report what information is missing.

## Secondary Inputs

Inspect the target repository itself before generating files.

Relevant evidence may include:

- existing source tree;
- package/build configuration;
- test configuration;
- existing README and documentation;
- current `AGENTS.md` or equivalent instructions;
- CI configuration;
- Issue/PR conventions when visible;
- deployment or infrastructure configuration.

Repository reality may refine current-state understanding, but do not silently override explicit project intent. Report meaningful conflicts.

## Core Authority Model

The generated repository should use this mental model:

```text
PROJECT-OVERVIEW.md
    project foundation / bootstrap input

AGENTS.md
    how coding agents should work here

CONTEXT.md
    what matters about the repository now

docs/
    durable project knowledge

.agents/
    task-local agent work

Issue / PR tracker
    execution status

source + tests
    implementation reality
```

Prefer one canonical owner for each important fact. Other artifacts may point to that owner instead of copying the same authority.

## Canonical Skeleton

Create or preserve the following structure:

```text
project/
├── README.md
├── PROJECT-OVERVIEW.md
├── AGENTS.md
├── CONTEXT.md
│
├── docs/
│   ├── README.md
│   ├── architecture/
│   │   └── README.md
│   ├── standards/
│   │   └── README.md
│   ├── adr/
│   │   └── README.md
│   ├── specs/
│   │   └── README.md
│   ├── guides/
│   │   └── README.md
│   └── runbooks/
│       └── README.md
│
└── .agents/
    ├── README.md
    ├── plans/
    │   └── README.md
    ├── handoffs/
    │   └── README.md
    ├── reviews/
    │   └── README.md
    ├── evidence/
    │   └── README.md
    └── tmp/
        └── README.md
```

The README files intentionally keep canonical folders visible even when no project-specific artifact exists yet.

Ensure `.agents/tmp/` remains scratch space. Configure `.gitignore` so the folder README remains tracked while other scratch files are ignored.

## Bootstrap Workflow

### 1. Read the project foundation

Read `PROJECT-OVERVIEW.md` completely.

Extract only information actually supported by the file:

- problem and product;
- scope;
- architecture direction;
- core concepts;
- constraints;
- major invariants;
- development workflow;
- current state;
- open questions.

Do not convert open questions into decisions.

### 2. Inspect repository reality

Inspect enough of the repository to determine:

- whether this is greenfield or an existing implementation;
- current technology and folder structure;
- available test/lint/build commands;
- existing documentation or agent instructions;
- current implemented state that should influence `CONTEXT.md`.

Use progressive disclosure. Do not read the entire repository without a task-specific reason.

### 3. Detect existing Agentic Repo Kit artifacts

Check whether canonical files or folders already exist.

If they do, operate idempotently:

- preserve useful project-specific content;
- do not create duplicate folders or competing authority;
- do not blindly overwrite live governance or documentation;
- update only when the new project input clearly supports the change;
- report conflicts or ambiguous merges.

### 4. Create the canonical skeleton

Create missing canonical directories and their local `README.md` contracts.

Folder READMEs should explain, concisely:

- what belongs there;
- when to create an artifact there;
- what does not belong there;
- naming conventions when useful;
- which reusable template applies.

Do not fill empty folders with fake project content merely to make the repository look complete.

### 5. Generate or align `AGENTS.md`

Use `templates/AGENTS.md` as the structural reference when available.

Generate repository-specific content from supported project information.

`AGENTS.md` should include:

- repository mission;
- authority map;
- read order;
- high-signal repository-wide invariants;
- working agreements;
- real validation commands when discoverable;
- documentation synchronization rules;
- definition of done.

Do not place complete architecture, feature history, issue status, or long task plans in `AGENTS.md`.

Do not leave fictional commands. If validation commands cannot be determined, clearly mark them unresolved rather than guessing.

### 6. Generate or align `CONTEXT.md`

Use `templates/CONTEXT.md` as the structural reference when available.

Populate only current information supported by `PROJECT-OVERVIEW.md` and repository inspection:

- current product boundary;
- current implemented state;
- active direction;
- active transitions;
- important current limitations;
- canonical references.

`CONTEXT.md` is a bounded current-state projection. Do not copy the complete Project Overview, architecture documentation, or issue history into it.

### 7. Create initial durable docs only when supported

The canonical folders should always exist, but project-specific documents inside them should be created only when the input contains enough substance.

Examples:

Create `docs/architecture/overview.md` when current architecture or a sufficiently concrete architecture direction is known.

Create a Standard when a durable normative rule is explicit.

Create a Specification when durable required behavior is explicit and important enough to survive one task.

Create an ADR only when an actual significant decision, alternatives, and consequences are known.

Do not manufacture ADRs, Standards, or Specifications from guesses.

### 8. Preserve task-local boundaries

Do not create Plans, Handoffs, Reviews, or Evidence during bootstrap unless there is actual task-local content to store.

Their directories and local READMEs may exist empty of task artifacts.

Never store durable architecture or product rules under `.agents/`.

### 9. Validate the result

Before finishing, verify:

- `PROJECT-OVERVIEW.md` still exists and remains the project foundation;
- root `AGENTS.md` describes the target repository, not Agentic Repo Kit itself;
- root `CONTEXT.md` describes the target repository's current state;
- every canonical folder exists with its local README;
- no generated file refers to obsolete `.template/` paths;
- `.agents/tmp/README.md` is trackable while other scratch files are ignored;
- reusable templates are not copied into the consumer repository unless intentionally requested;
- no open question was silently converted into a decision;
- no obvious duplicate authority was introduced.

## Reusable Template Mapping

When the Agentic Repo Kit template library is available, use:

```text
templates/PROJECT-OVERVIEW.md
templates/AGENTS.md
templates/CONTEXT.md
templates/architecture.md
templates/standard.md
templates/adr.md
templates/spec.md
templates/guide.md
templates/runbook.md
templates/plan.md
templates/handoff.md
templates/review.md
templates/evidence.md
```

Use these as structural guides, not as permission to fabricate missing content.

## Mutation Safety

For an existing repository:

- never delete project documentation just because it does not match this structure;
- first classify its information and identify its current authority;
- migrate or link information intentionally;
- preserve history where it has durable value;
- surface conflicting sources of truth instead of arbitrarily choosing one;
- avoid unrelated source-code changes during repository bootstrap.

If a safe automatic merge is not possible, create the non-conflicting structure and report the unresolved migration decision.

## Completion Report

At the end, report four groups:

### Created

Files and folders newly created.

### Updated

Existing files intentionally aligned with the model.

### Inferred from repository reality

Facts used that were supported by existing implementation or configuration rather than written explicitly in `PROJECT-OVERVIEW.md`.

### Unresolved

Missing decisions, conflicts, or placeholders that require human/project input.

Keep the report concise and do not claim the repository is fully standardized when unresolved authority conflicts remain.
