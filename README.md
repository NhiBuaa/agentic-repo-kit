# Agentic Repo Kit

A simple, vendor-neutral repository operating system for software projects built by humans and coding agents.

The intended experience is deliberately small:

```text
Analyze the project
        ↓
PROJECT-OVERVIEW.md
        ↓
bootstrap-agentic-repo
        ↓
ready-to-use agentic repository
```

Instead of manually deciding where every architecture note, agent instruction, specification, plan, or handoff belongs, you describe the project once and let the bootstrap skill establish a consistent repository structure.

## Why

Coding agents become less reliable when repositories accumulate:

- multiple competing sources of truth;
- giant instruction files;
- stale session notes;
- architecture rules hidden inside agent-only folders;
- plans treated like requirements;
- important folders that disappear because they are empty;
- duplicated context for different tools.

Agentic Repo Kit gives these information classes explicit homes while keeping the mental model small.

## Quick Start

### 1. Analyze your project

Start from:

```text
templates/PROJECT-OVERVIEW.md
```

Create a root file in your project:

```text
PROJECT-OVERVIEW.md
```

Describe only what you actually know about the project:

- problem and product;
- scope;
- architecture direction;
- core concepts;
- important constraints;
- major invariants;
- development workflow;
- current state;
- open questions.

Do not resolve unknowns just to fill the template.

### 2. Run the bootstrap skill

Use:

```text
skills/bootstrap-agentic-repo/SKILL.md
```

For example, tell your coding agent:

```text
Use bootstrap-agentic-repo.
Read PROJECT-OVERVIEW.md and bootstrap this repository using Agentic Repo Kit.
```

The skill inspects both the project overview and the repository itself before generating or aligning the structure.

### 3. Continue normal development

The resulting project has a predictable operating structure:

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

## The Mental Model

You only need to remember five things:

| Artifact | Question it answers |
|---|---|
| `PROJECT-OVERVIEW.md` | What are we trying to build? |
| `AGENTS.md` | How should coding agents work here? |
| `CONTEXT.md` | What matters about the repository right now? |
| `docs/` | What durable project knowledge must survive tasks? |
| `.agents/` | What task-local agent work helps us execute? |

Issue and PR tracking still owns execution status. Source code and tests still own implementation reality.

## Why Create the Folders Up Front?

The folders are intentionally visible from the beginning.

Each canonical folder contains a small `README.md` that explains:

- what belongs there;
- when to create an artifact there;
- what does not belong there;
- which template to use.

This keeps the structure discoverable and prevents teams or agents from forgetting an information class simply because the folder was empty.

However, bootstrap does **not** invent project-specific ADRs, Standards, Specifications, Plans, Handoffs, Reviews, or Evidence merely to populate the folders.

Structure exists up front. Content appears when real information exists.

## Core Authority Rule

> One important truth should have one canonical owner.

Examples:

- agent behavior → `AGENTS.md`;
- current system architecture → `docs/architecture/`;
- normative implementation rules → `docs/standards/`;
- decision rationale → `docs/adr/`;
- required behavior → `docs/specs/`;
- current repository state → `CONTEXT.md`;
- task execution artifacts → `.agents/`.

Other files should point to canonical information instead of maintaining competing copies.

## What's in This Repository?

Agentic Repo Kit currently has three layers:

```text
Repository Standard
        +
Reusable Templates
        +
Skills
```

### Repository Standard

Root files and `docs/` define the information model and its boundaries.

### Templates

`templates/` contains reusable starters for:

```text
PROJECT-OVERVIEW.md
AGENTS.md
CONTEXT.md
architecture.md
standard.md
adr.md
spec.md
guide.md
runbook.md
plan.md
handoff.md
review.md
evidence.md
```

### Skills

`skills/` contains automation that applies the model.

The first skill is:

```text
bootstrap-agentic-repo
```

It is designed to be safe for both greenfield and existing repositories: it preserves useful existing information, avoids blind overwrites, and reports unresolved authority conflicts instead of guessing.

## Self-Hosting

This repository uses its own model.

Root:

```text
PROJECT-OVERVIEW.md
AGENTS.md
CONTEXT.md
```

are live files describing Agentic Repo Kit itself.

Reusable versions for other projects live under:

```text
templates/
```

This separation prevents a coding agent working on Agentic Repo Kit from mistaking consumer placeholders for this project's actual instructions or state.

## Current Status

Current design stage: **v0.2**.

Implemented:

- canonical project-overview input;
- visible canonical folder skeleton with local manuals;
- reusable template library;
- self-hosting root governance/context;
- `bootstrap-agentic-repo` skill;
- separation between durable project knowledge and task-local agent work.

Not implemented yet:

- standalone CLI;
- automated conformance validator;
- cross-agent installation packaging;
- migration tooling for large existing repositories;
- stable `v1.0` contract.

The next focus is validating the model against different real project shapes before adding more machinery.

## Design Principles

- Simple enough to remember.
- Explicit enough for agents to navigate.
- Vendor-neutral.
- Progressive disclosure instead of loading everything.
- One canonical owner per important truth.
- No fake documentation just to satisfy a structure.
- No silent invention of unresolved project decisions.
- Structure should help development, not become bureaucracy.
