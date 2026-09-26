# Repository Agent Infrastructure

`.agents/` contains repository-local infrastructure that helps coding agents operate consistently in this project.

It is **not** a task tracker and **not** a second project knowledge base.

## Structure

```text
.agents/
├── README.md
├── commands/
├── hooks/
├── references/
└── rules/
```

## Boundaries

- Work scope, progress, handoffs, review discussion, CI, and verification belong in Issues and Pull Requests.
- Durable product and engineering knowledge belongs in `docs/`.
- Repository-wide entry guidance belongs in `AGENTS.md`.
- System-level Agentic Repo Kit skills live in the toolkit's root `skills/` directory, not here.
- User/global skills are outside this repository structure and are intentionally not scaffolded here.

## Local Areas

- `commands/` — reusable explicit agent commands/workflow entrypoints for this repository.
- `hooks/` — event-triggered automation or guardrails around agent workflows.
- `rules/` — scoped agent-working rules that are not durable product standards.
- `references/` — non-authoritative examples, patterns, checklists, and supporting material.

Tool-specific adapters such as `.claude/` or `.github/` may consume or bridge these artifacts, but they should not create competing project truth.
