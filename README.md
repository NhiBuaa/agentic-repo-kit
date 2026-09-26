# Agentic Repo Kit

A lightweight repository operating system for projects developed by humans and coding agents.

The goal is not to maximize documentation. The goal is to give every important piece of repository information a clear owner, lifetime, loading behavior, and update policy.

## Core Model

| Information | Canonical owner |
|---|---|
| Agent working agreements | `AGENTS.md` |
| Current project-state projection | `CONTEXT.md` |
| Durable system knowledge | `docs/` |
| Work status | Issue / PR tracker |
| Task-local agent artifacts | `.agents/` |
| Implementation truth | Source code + tests |

Core principle:

> One truth, many pointers.

Other files may summarize or reference canonical information, but should not maintain competing authoritative copies.

## Start Small

The default project starts with:

```text
repo/
├── README.md
├── AGENTS.md
├── CONTEXT.md
├── .gitignore
├── docs/
│   ├── README.md
│   ├── architecture/
│   │   └── README.md
│   └── specs/
│       └── README.md
└── .agents/
    └── README.md
```

Add optional artifact classes only when a real need appears.

## Expansion Triggers

Add `docs/adr/` when the project starts making significant architectural decisions with meaningful alternatives and consequences.

Add `docs/standards/` when multiple implementations must obey durable normative rules.

Add `docs/guides/` when contributors repeatedly need a normal development or operational procedure.

Add `docs/runbooks/` when the project has meaningful abnormal operational states, incident response, or recovery procedures.

Add `.agents/plans/` when a task is complex enough to benefit from an explicit implementation plan.

Add `.agents/handoffs/` when work must continue across agents, sessions, or interrupted environments.

Add `.agents/reviews/` when review output should be retained independently from a PR conversation.

Add `.agents/evidence/` when verification proof is worth retaining beyond ordinary tests and CI.

Optional starter files for these artifact classes live under `.template/artifacts/`.

## Authority Rules

- `AGENTS.md` governs how agents work. It must not become a complete architecture manual.
- `CONTEXT.md` is a bounded projection of what matters now. Durable truths belong in `docs/`.
- `docs/architecture/` describes how the system works now.
- `docs/standards/` contains normative implementation rules.
- `docs/adr/` explains why significant architectural decisions were made.
- `docs/specs/` defines required behavior.
- `.agents/` contains task-local work artifacts, not product knowledge.
- Issues and PRs own execution status. Specifications should not duplicate task progress.

## Artifact Escalation

Do not create every artifact for every task.

```text
simple change
    |
    +-- durable behavior contract needed? --> spec
    +-- significant architectural choice? --> ADR
    +-- cross-cutting normative rule? ------> standard
    +-- complex execution path? ------------> plan
    +-- interrupted / transferred work? ----> handoff
    +-- retained verification proof? -------> evidence
```

The artifact exists because the need exists, not because the template contains a file for it.

## Suggested Read Order

For meaningful work:

1. `AGENTS.md`
2. `CONTEXT.md`
3. the relevant Issue / task
4. relevant Specification
5. only relevant Architecture / Standard / ADR documents
6. implementation
7. tests

Do not read the entire documentation tree for every task.

## Project Status

Current version: `0.1`

Agentic Repo Kit is currently an early design-stage template focused on repository information architecture, authority, lifecycle, and agent workflow conventions.

The project is intentionally vendor-neutral and can be adapted for Codex, Claude Code, GitHub Copilot, Gemini-based coding agents, and custom engineering agents.

## Future Direction

Potential future evolution may include:

- validation tooling for repository contracts;
- scaffolding commands;
- CI checks for stale or duplicated authority;
- tool-specific adapters;
- reusable starter profiles for different repository sizes;
- migration helpers for existing repositories.

This repository should remain lightweight by default: new structure is added only when a real workflow or governance need justifies it.
