# Agentic Repo Kit — Project Overview

## Problem

Software repositories increasingly use coding agents, but project knowledge, agent instructions, temporary task state, and tool-specific configuration often become mixed together. This creates duplicated truth, stale context, and tool lock-in.

Agentic Repo Kit explores a smaller repository convention that keeps project knowledge discoverable without recreating systems already provided by the repository host.

## Product

Agentic Repo Kit is a vendor-neutral repository structure and bootstrap workflow for software projects developed by humans and coding agents.

A user should be able to:

1. analyze a project;
2. capture the foundation in `PROJECT-OVERVIEW.md`;
3. run a bootstrap skill;
4. receive a predictable repository structure with clear local instructions;
5. continue normal development using Issues and Pull Requests for work state.

## Scope

### In Scope

- canonical root files for project foundation, agent guidance, and current context;
- ordered durable documentation categories;
- reusable agent skills and references;
- bootstrap templates and workflow;
- clear boundaries between project truth, agent capabilities, and work tracking;
- optional vendor-specific adapter guidance.

### Out of Scope

- replacing GitHub Issues, Pull Requests, or equivalent work trackers;
- storing agent chat history or hidden reasoning;
- forcing every project to create project-specific content for every documentation category;
- making tool-specific directories canonical owners of project truth;
- building a general project-management system.

## Architecture Direction

The repository model is:

```text
PROJECT-OVERVIEW.md
= project foundation and design input

AGENTS.md
= repository-wide agent behavior

CONTEXT.md
= current project-state projection

docs/
= durable project knowledge in a predictable reading order

agent/skills/
= reusable agent workflows

agent/references/
= useful non-normative supporting material

Issues
= task scope, planning, progress, and handoff state

Pull Requests
= implementation, review, CI, and verification
```

Tool-specific folders such as `.claude/` or `.github/` are adapters only.

## Documentation Direction

`docs/` uses numbered categories for discoverability:

```text
01-overview
02-architecture
03-product
04-standards
05-specs
06-decisions
07-guides
08-runbooks
99-notes
```

Every category keeps a `README.md` so the folder exists before project-specific content is available and contributors can immediately see its intended use.

## Core Concepts

### One truth, many pointers

A durable fact has one canonical owner. Other artifacts reference it rather than maintain competing copies.

### Work state is external to durable docs

Issues and Pull Requests already model work. Repository documentation should not mirror their state by default.

### Agent capabilities are not project truth

Reusable skills and references help agents act, but architecture and normative project rules remain in the project knowledge plane.

### Bootstrap should not invent decisions

Missing information remains an explicit open question.

## Important Constraints

- remain usable across multiple coding-agent products;
- keep the mental model small;
- allow empty canonical categories to remain visible through local README files;
- avoid duplicate work tracking;
- preserve compatibility with ordinary human development workflows;
- keep vendor-specific integrations optional.

## Major Invariants

- `AGENTS.md` does not become a full architecture manual.
- `CONTEXT.md` does not become project history.
- `docs/` does not contain task progress.
- `agent/` does not contain task plans, handoffs, review logs, or verification history by default.
- Issues/PRs remain the work plane.
- tool adapters do not own durable project truth.

## Development Workflow

Repository work is tracked with Issues and Pull Requests.

A normal change should flow roughly as:

```text
Issue
  ↓
relevant project knowledge / skill
  ↓
implementation
  ↓
Pull Request
  ↓
review + CI + verification
  ↓
promote durable findings into docs when needed
```

## Current State

The project has a reusable template set and a bootstrap skill. The current redesign removes the repository-owned `.agents/` work plane in favor of Issues/PRs, introduces `agent/` for reusable capabilities, and orders the documentation tree for predictable discovery.

## Open Questions

- Should `docs/99-notes/` remain in the long-term canonical structure or stay optional?
- Which tool-specific adapters should Agentic Repo Kit eventually ship as examples?
- Should bootstrap remain skill-only or later gain a CLI?
- How should skills be packaged for different coding-agent ecosystems without duplicating their canonical content?
