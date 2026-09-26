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

Task plans, handoffs, review logs, and verification summaries are intentionally not templated as repository files. Use the repository Issue/PR system for work state.

Repository-local `.agents/` folders are scaffolded with small local `README.md` contracts rather than content templates because commands, hooks, rules, and references are project-specific.

The Agentic Repo Kit bootstrap skill lives at:

```text
skills/bootstrap-agentic-repo/SKILL.md
```

It is a toolkit skill, not a consumer-project `.agents/skills/` artifact.
