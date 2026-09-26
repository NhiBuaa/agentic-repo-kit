# Reusable Templates

`templates/` contains source templates used when bootstrapping or extending another repository.

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

The Agentic Repo Kit bootstrap skill lives at `skills/bootstrap-agentic-repo/SKILL.md` in this toolkit repository and is not copied into consumer repositories by default.
