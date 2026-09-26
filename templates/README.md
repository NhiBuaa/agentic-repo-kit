# Reusable Templates

`templates/` contains source templates used when establishing, normalizing, or extending another repository.

These files are scaffolding inputs, not live authority for Agentic Repo Kit itself.

## Root Templates

- `PROJECT-OVERVIEW.md`
- `AGENTS.md`
- `CONTEXT.md`

## Durable Documentation Templates

- `architecture.md`
- `standard.md`
- `spec.md`
- `adr.md`
- `guide.md`
- `runbook.md`

The default consumer repository also receives `.agents/` folder manuals for `rules/` and `references/`.

Task plans, handoffs, review logs, and verification summaries are intentionally not templated as repository files. Use the repository Issue/PR system for work state.

Agentic Repo Kit currently ships `skills/establish-project-overview/SKILL.md` and `skills/normalize-agentic-repo/SKILL.md` in this toolkit repository. Toolkit skills are not copied into consumer repositories by default.
