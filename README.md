# Agentic Repo Kit

A lightweight, vendor-neutral repository structure for software projects developed by humans and coding agents.

Agentic Repo Kit is built around one simple flow:

```text
Analyze the project
        ↓
PROJECT-OVERVIEW.md
        ↓
bootstrap-agentic-repo
        ↓
ready-to-use agentic repository
```

The goal is not to create more documentation. The goal is to make project knowledge easy to find, agent behavior predictable, repository-local automation discoverable, and work tracking stay in the tools already designed for it.

## Mental Model

```text
PROJECT-OVERVIEW.md
= what are we building and why?

AGENTS.md
= how should coding agents work here?

CONTEXT.md
= where is the project now?

docs/
= durable project knowledge

.agents/
= repository-local agent infrastructure

Issues
= planned / active / completed work

Pull Requests
= implementation, review, and verification
```

A project should not maintain a second issue tracker inside `.agents/`.

## Canonical Consumer Structure

```text
project/
├── README.md
├── PROJECT-OVERVIEW.md
├── AGENTS.md
├── CONTEXT.md
│
├── docs/
│   ├── README.md
│   ├── 01-overview/
│   │   └── README.md
│   ├── 02-architecture/
│   │   └── README.md
│   ├── 03-product/
│   │   └── README.md
│   ├── 04-standards/
│   │   └── README.md
│   ├── 05-specs/
│   │   └── README.md
│   ├── 06-decisions/
│   │   └── README.md
│   ├── 07-guides/
│   │   └── README.md
│   ├── 08-runbooks/
│   │   └── README.md
│   └── 99-notes/
│       └── README.md
│
├── .agents/
│   ├── README.md
│   ├── commands/
│   │   └── README.md
│   ├── hooks/
│   │   └── README.md
│   ├── references/
│   │   └── README.md
│   └── rules/
│       └── README.md
│
└── ... source code
```

Every canonical folder contains a small `README.md`, even when it has no project-specific content yet. This keeps the structure visible in Git and explains what belongs there.

## Why `docs/` Is Numbered

The numbered layout gives humans and agents a predictable discovery order instead of relying on alphabetical folder names:

1. project orientation;
2. architecture;
3. product/domain knowledge;
4. implementation standards;
5. required behavior;
6. decision history;
7. normal procedures;
8. operational recovery procedures;
9. non-authoritative notes.

The numbers organize discovery; they do not create an authority hierarchy.

## What `.agents/` Is For

`.agents/` is **agent infrastructure**, not a work log.

```text
.agents/
├── commands/     explicit repository-local workflow entrypoints
├── hooks/        event-triggered automation and guardrails
├── references/   non-authoritative support material
└── rules/        scoped agent-working rules
```

### Commands

Commands make repeatable repository workflows easy to invoke intentionally. They may orchestrate scripts, checks, skills, or documentation workflows, but they do not own project truth.

### Hooks

Hooks automate behavior around agent or repository events: safety checks, validation, synchronization, or policy enforcement. Tool-specific hook configuration may live in an adapter, while shared intent remains repository-local where practical.

### Rules

Rules contain scoped instructions for **how agents work**. Durable implementation standards that also apply to human developers belong in `docs/04-standards/` instead.

### References

References contain examples, patterns, checklists, and supporting material. They are useful context, not canonical product or architecture authority.

## Why `.agents/` Does Not Contain Task State

Task state already has a natural home:

- Issues own problem statements, scope, acceptance criteria, implementation planning, progress, and handoff updates.
- Pull Requests own code discussion, review findings, CI results, and verification.

Agentic Repo Kit therefore does not scaffold:

```text
.agents/plans/
.agents/handoffs/
.agents/reviews/
.agents/evidence/
```

Durable findings discovered during work should be promoted into the appropriate `docs/` category.

## Skills Belong to the Toolkit

The `bootstrap-agentic-repo` skill is a capability of **Agentic Repo Kit itself**, so it lives in this repository at:

```text
skills/bootstrap-agentic-repo/SKILL.md
```

It is not scaffolded into `.agents/skills/` in consumer projects.

Users may keep personal or organization skills globally using their preferred agent environment. Agentic Repo Kit does not force a repository-local skills directory.

## Tool-Specific Adapters

Vendor-specific directories such as:

```text
.claude/
.github/
```

are optional adapters. They may bridge tool-specific commands, hooks, loaders, or settings to the canonical repository model, but they should not create competing copies of project truth.

## Quick Start

### 1. Describe the project

Start from:

```text
templates/PROJECT-OVERVIEW.md
```

Create `PROJECT-OVERVIEW.md` with the problem, scope, architecture direction, constraints, invariants, workflow, current state, and open questions.

### 2. Bootstrap the repository

Use the Agentic Repo Kit system skill:

```text
skills/bootstrap-agentic-repo/SKILL.md
```

Ask your coding agent to read `PROJECT-OVERVIEW.md` and bootstrap the target repository using Agentic Repo Kit.

The bootstrap workflow must inspect repository reality and must not invent missing architectural or product decisions.

### 3. Work normally

Use Issues and Pull Requests for work state. Keep durable knowledge under `docs/`. Use `.agents/` only for repository-local agent infrastructure that provides lasting value.

## Templates

Reusable source templates live under `templates/`.

They are scaffolding inputs, not live project authority. Root files in this repository describe Agentic Repo Kit itself.

## Project Status

This repository is still under design review. The structure is intentionally being reviewed before adding broader automation, validation tooling, or OSS packaging.
