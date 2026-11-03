# Agentic Repo Kit

A lightweight, vendor-neutral repository structure for software projects developed by humans and coding agents.

Agentic Repo Kit is built around a project foundation plus focused repository workflows.

### 1. Fresh Repository Workflow (Start from Zero)

```text
empty directory / new repository
        ↓
init-agentic-repo
        ↓
scaffolded repository + Playbook 1
```

### 2. Existing Repository Normalization Flow

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

## Developer Playbooks (Draft for Review)

Start with the guide that matches your work:

1. **[Playbook 1 — Start a project from zero](docs/07-guides/project-start-playbook.md)**: initialize repo → core value → use case diagram → navigation/user flows & UI direction / `DESIGN.md` (if UI) → system architecture → auth/security model → technology → database design → MVP-first phased plan.
2. **[Playbook 2 — Develop a feature](docs/07-guides/feature-development-playbook.md)**: understand architecture/code → feature requirements → impact → technical workflow + UI detail/states (if any) → implement/test → render review & PR.

These are **human-facing, step-by-step guides**. The developer understands and approves the decisions; agents assist within the scope given.

## Mental Model

```text
PROJECT-OVERVIEW.md = what are we building and why?
AGENTS.md            = how should coding agents work here?
CONTEXT.md           = where is the project now?
DESIGN.md (if UI)    = how should the interface look and feel?
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
├── DESIGN.md (for repositories with a user interface)
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
├── init-agentic-repo/
│   └── SKILL.md
├── establish-project-overview/
│   └── SKILL.md
└── normalize-agentic-repo/
    └── SKILL.md
```

`init-agentic-repo` scaffolds a brand-new repository conforming to the kit model.

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

## Quick Start Workflows

### Starting a New Project from Scratch
1. Run `skills/init-agentic-repo/SKILL.md` or `./scripts/init-repo.ps1 -ProjectName "<name>" [-WithUI]`.
2. Follow `docs/07-guides/project-start-playbook.md` starting from Step 2 to define core value and architecture.

### Normalizing an Existing Repository
1. Use `skills/establish-project-overview/SKILL.md` if the root project overview is missing, stale, incomplete, or contradictory.
2. Review and approve the resulting `PROJECT-OVERVIEW.md` foundation.
3. Use `skills/normalize-agentic-repo/SKILL.md` to inspect the existing repository and propose a normalization plan.
4. Review that plan before material migration.
5. Apply the approved normalization and validate it against the skill acceptance checklist.
6. Track work in Issues and Pull Requests; promote durable findings into `docs/` when needed.

### Validating Repository Integrity & Conformance
Run the zero-dependency repository integrity validator:
```powershell
# Validate the kit repository or current project:
./scripts/check-kit.ps1

# Validate an external project directory:
./scripts/check-kit.ps1 -TargetPath "C:/path/to/my-project" [-Strict] [-Json]
```
Checks 100% of internal links & GFM anchor slugs, 13 canonical docs/agent directories, frontmatters (CONTEXT.md, DESIGN.md, SKILL.md), and Single Source of Truth conformance.

## Templates

Reusable source templates live under `templates/`, including foundations for root files (`PROJECT-OVERVIEW.md`, `AGENTS.md`, `CONTEXT.md`, `DESIGN.md`), architecture, engineering standards, UI/UX quality (`ui-quality.md`), specifications, decisions, guides, and runbooks. They are scaffolding inputs, not live authority for Agentic Repo Kit itself.

## Project Status

This repository is actively maintained. Current capabilities include complete scaffolding for fresh repositories (`init-agentic-repo`), automated integrity validation (`check-kit.ps1`), normalization workflows for existing codebases (`normalize-agentic-repo`), and comprehensive UI/UX standards (`DESIGN.md`, `ui-quality.md`).
