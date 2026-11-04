# Reusable Templates

`templates/` contains source templates used when establishing, normalizing, or extending another repository.

These files are scaffolding inputs, not live authority for Agentic Repo Kit itself.

## Root Templates

- `PROJECT-OVERVIEW.md` — canonical project foundation.
- `AGENTS.md` — agent entrypoint and repository routing.
- `CONTEXT.md` — bounded current project state.
- `DESIGN.md` — canonical visual identity and design system (for repositories with a user interface).

## Durable Documentation Templates

- `architecture.md`
- `standard.md`
- `ui-quality.md`
- `spec.md`
- `adr.md`
- `guide.md`
- `runbook.md`

The default consumer repository also receives `.agents/` folder manuals for `rules/` and `references/`.

## Agent Rule Templates

- `ui-skill-routing.md` — scoped agent rule for stage-based UI skill selection, style collision prevention, and verification guardrails (instantiated under `.agents/rules/` for repositories with a user interface).

Task plans, handoffs, review logs, and verification summaries are intentionally not templated as repository files. Use the repository Issue/PR system for work state.

Agentic Repo Kit currently ships `skills/init-agentic-repo/SKILL.md`, `skills/establish-project-overview/SKILL.md`, and `skills/normalize-agentic-repo/SKILL.md` in this toolkit repository. Toolkit skills are not copied into consumer repositories by default.
