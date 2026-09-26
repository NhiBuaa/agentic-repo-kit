# Agent Capabilities

`agent/` contains reusable material that helps coding agents perform work.

It is not a task tracker and not the canonical project knowledge base.

## Structure

```text
agent/
├── README.md
├── skills/
└── references/
```

## `skills/`

Reusable workflows for recurring engineering tasks.

A skill may explain how to bootstrap a repository, create an ADR, perform a specialized review, or carry out another repeatable workflow.

Skills should read canonical project knowledge rather than duplicate it.

## `references/`

Useful examples, patterns, checklists, or supporting material that helps agents perform work.

References are non-normative unless they explicitly point to a canonical rule elsewhere.

## What Does Not Belong Here

Do not store task plans, progress, handoffs, review history, or verification logs here. Use Issues and Pull Requests.

Do not store canonical architecture or product rules here. Use `docs/` and `AGENTS.md`.

## Tool-Specific Adapters

Directories such as `.claude/` or `.github/` may adapt tool-specific commands, hooks, or loader behavior to this canonical structure. They must not create a second source of project truth.
