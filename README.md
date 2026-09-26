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

The goal is not to create more documentation. The goal is to make project knowledge easy to find, agent behavior predictable, and work tracking stay in the tools already designed for it.

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

agent/
= reusable agent capabilities and supporting references

Issues
= planned / active / completed work

Pull Requests
= implementation, review, and verification
```

A project should not maintain a second issue tracker inside the repository.

## Canonical Structure

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
├── agent/
│   ├── README.md
│   ├── skills/
│   │   └── README.md
│   └── references/
│       └── README.md
│
└── ... source code
```

Every canonical folder contains a small `README.md`, even when the folder has no project-specific content yet. This keeps the structure visible in Git and explains what belongs there.

## Why `docs/` Is Numbered

The numbered layout gives humans and agents a predictable reading order instead of relying on alphabetical folder names:

1. understand the project;
2. understand the architecture;
3. understand the product/domain;
4. read implementation rules;
5. read required behavior;
6. inspect decision history;
7. use normal procedures;
8. use operational recovery procedures;
9. consult non-authoritative notes only when needed.

The numbers organize discovery; they do not create an authority hierarchy. Authority still comes from the artifact type.

## Why There Is No `.agents/` Work Log

Task state already has a natural home:

- Issues own problem statements, scope, acceptance criteria, implementation planning, progress, and handoff updates.
- Pull Requests own code discussion, review findings, CI results, and verification.

Agentic Repo Kit therefore does not create repository copies such as:

```text
.agents/plans/
.agents/handoffs/
.agents/reviews/
.agents/evidence/
```

Durable knowledge discovered during work should be promoted into the appropriate `docs/` artifact instead of being preserved as task-state markdown.

## `agent/` Is Capability Infrastructure

`agent/` is not a task workspace.

It contains reusable material that helps coding agents perform work:

```text
agent/
├── skills/       reusable workflows
└── references/   useful patterns, examples, and supporting material
```

Canonical product rules do not live there. Repository-wide agent behavior belongs in `AGENTS.md`; durable implementation rules belong in `docs/04-standards/`.

## Tool-Specific Adapters

Vendor-specific directories are optional adapters, for example:

```text
.claude/
.github/
```

They may contain tool-specific commands, hooks, or loader configuration, but should reference canonical repository knowledge rather than create competing copies of it.

## Quick Start

### 1. Describe the project

Start from:

```text
templates/PROJECT-OVERVIEW.md
```

Create a project-level `PROJECT-OVERVIEW.md` containing the problem, product scope, architecture direction, constraints, invariants, workflow, current state, and open questions.

### 2. Bootstrap the repository

Use:

```text
agent/skills/bootstrap-agentic-repo/SKILL.md
```

Ask your coding agent to read `PROJECT-OVERVIEW.md` and bootstrap the repository using Agentic Repo Kit.

The bootstrap workflow must inspect existing repository reality and must not invent missing architectural or product decisions.

### 3. Work normally

Use Issues and Pull Requests for work state. Keep durable knowledge under `docs/`. Add reusable agent workflows or references under `agent/` only when they provide lasting value.

## Templates

Reusable source templates live under `templates/`.

They are scaffolding inputs, not live project authority. Root files in this repository describe Agentic Repo Kit itself.

## Project Status

This repository is still under design review. The structure is intentionally being simplified before adding automation, validation tooling, or broader OSS packaging.
