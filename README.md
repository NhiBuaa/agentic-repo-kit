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

## Mental Model

```text
PROJECT-OVERVIEW.md = what are we building and why?
AGENTS.md            = how should coding agents work here?
CONTEXT.md           = where is the project now?
docs/                = durable project knowledge
.agents/             = project-local agent rules + references
Issues               = work scope / planning / progress
Pull Requests         = implementation / review / verification
```

A project should not maintain a second issue tracker inside the repository.

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
│   ├── 01-overview/README.md
│   ├── 02-architecture/README.md
│   ├── 03-product/README.md
│   ├── 04-standards/README.md
│   ├── 05-specs/README.md
│   ├── 06-decisions/README.md
│   ├── 07-guides/README.md
│   ├── 08-runbooks/README.md
│   └── 99-notes/README.md
│
└── .agents/
    ├── README.md
    ├── rules/README.md
    └── references/README.md
```

Every canonical folder contains a small `README.md` even when it has no project-specific content yet. This keeps the intended structure visible in Git and explains what belongs there.

## `.agents/` Is Project-Local Agent Configuration

`.agents/` is not a task workspace.

```text
.agents/
├── rules/       detailed/scoped agent-only rules
└── references/  non-normative supporting material
```

Do not use `.agents/` for task plans, handoffs, reviews, or verification evidence. Use Issues and Pull Requests for work state.

The default structure intentionally does **not** include:

```text
.agents/commands/
.agents/hooks/
.agents/skills/
```

Why:

- explicit workflow plans + reusable skills already cover orchestration, so commands would usually duplicate that layer;
- hooks can accidentally run workflow gates twice, so they are not a default primitive;
- personal/global skills do not need to be copied into each repository.

Projects may add any of these later when a concrete need justifies them.

## Skills Shipped by Agentic Repo Kit

The toolkit repository itself contains:

```text
skills/
└── bootstrap-agentic-repo/
    └── SKILL.md
```

This is a skill of Agentic Repo Kit, not part of the default consumer repository structure.

## Why `docs/` Is Numbered

The numbers give humans and agents a predictable discovery order:

1. overview;
2. architecture;
3. product/domain;
4. standards;
5. specifications;
6. decisions;
7. guides;
8. runbooks;
9. non-authoritative notes.

The numbers organize discovery, not authority priority.

## Quick Start

1. Start from `templates/PROJECT-OVERVIEW.md` and describe the project.
2. Use `skills/bootstrap-agentic-repo/SKILL.md`.
3. Let the skill inspect existing repository reality and create/normalize the canonical structure.
4. Track work in Issues and Pull Requests; promote durable findings into `docs/` when needed.

## Templates

Reusable source templates live under `templates/`. They are scaffolding inputs, not live authority for Agentic Repo Kit itself.

## Project Status

This repository is still under design review. The structure is intentionally being simplified before broader OSS packaging or automation is added.
