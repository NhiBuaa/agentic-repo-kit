# Reusable Templates

This directory contains source templates used to bootstrap other software repositories.

These files are **not** the live governance or context of Agentic Repo Kit itself. Root files such as `AGENTS.md`, `CONTEXT.md`, and `PROJECT-OVERVIEW.md` describe this repository; files under `templates/` are reusable scaffolding for consumer projects.

## Bootstrap Core

A new project starts from:

- `PROJECT-OVERVIEW.md` — human/agent project analysis input;
- `AGENTS.md` — generated repository-specific agent guidance;
- `CONTEXT.md` — generated current-state projection.

## Durable Documentation Templates

- `architecture.md`
- `standard.md`
- `adr.md`
- `spec.md`
- `guide.md`
- `runbook.md`

## Agent Work Templates

- `plan.md`
- `handoff.md`
- `review.md`
- `evidence.md`

The bootstrap skill may adapt these templates to the information actually supported by a project's `PROJECT-OVERVIEW.md` and repository state. It must not invent unresolved decisions merely to fill sections.
