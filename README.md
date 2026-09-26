# Agentic Repo Kit

A lightweight, vendor-neutral repository structure for software projects developed by humans and coding agents.

Agentic Repo Kit is built around a project foundation plus focused repository workflows.

For an existing repository, the current flow is:

```text
available user context + repository reality
        ↓
establish-project-overview
        ↓
PROJECT-OVERVIEW.md
        ↓
normalize-agentic-repo
        ↓
normalized agentic repository
```

Fresh-repository initialization is intentionally not shipped as a separate skill yet. The current priority is proving the existing-repository workflow before adding that path.

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

The toolkit repository currently contains:

```text
skills/
├── establish-project-overview/
│   └── SKILL.md
└── normalize-agentic-repo/
    └── SKILL.md
```

`establish-project-overview` establishes or reconciles the project foundation.

`normalize-agentic-repo` safely normalizes an existing repository after that foundation is trustworthy.

These are Agentic Repo Kit toolkit skills, not part of the default consumer repository structure.

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

`PROJECT-OVERVIEW.md` remains the project foundation. `docs/01-overview/` exists only for distinct expanded orientation such as maps, glossaries, or conceptual navigation; it should not mirror the root overview.

`docs/99-notes/` is the canonical home for useful non-authoritative retained notes. The folder is part of the skeleton, while project-specific note files are optional and should not be created merely to fill it.

## Existing Repository Quick Start

1. Use `skills/establish-project-overview/SKILL.md` if the root project overview is missing, stale, incomplete, or contradictory.
2. Review and approve the resulting `PROJECT-OVERVIEW.md` foundation.
3. Use `skills/normalize-agentic-repo/SKILL.md` to inspect the existing repository and propose a normalization plan.
4. Review that plan before material migration.
5. Apply the approved normalization and validate it against the skill acceptance checklist.
6. Track work in Issues and Pull Requests; promote durable findings into `docs/` when needed.

## Templates

Reusable source templates live under `templates/`. They are scaffolding inputs, not live authority for Agentic Repo Kit itself.

## Project Status

This repository is still under design review. The current focus is dogfooding `establish-project-overview` and `normalize-agentic-repo` on a complex existing repository before adding a dedicated fresh-repository initialization skill, CLI, or broader OSS automation.
