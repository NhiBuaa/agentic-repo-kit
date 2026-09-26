# Agentic Repo Kit — Project Overview

## Problem

Software repositories increasingly use coding agents, but project knowledge, agent instructions, repository-local automation, temporary task state, and tool-specific configuration often become mixed together. This creates duplicated truth, stale context, and tool lock-in.

Agentic Repo Kit explores a smaller repository convention that keeps these concerns separate without recreating systems already provided by the repository host.

## Product

Agentic Repo Kit is a vendor-neutral repository structure and bootstrap workflow for software projects developed by humans and coding agents.

A user should be able to:

1. analyze a project;
2. capture the foundation in `PROJECT-OVERVIEW.md`;
3. run a bootstrap skill supplied by Agentic Repo Kit;
4. receive a predictable repository structure with clear local instructions;
5. optionally add repository-local agent commands, hooks, rules, and references;
6. continue normal development using Issues and Pull Requests for work state.

## Scope

### In Scope

- canonical root files for project foundation, agent guidance, and current context;
- ordered durable documentation categories;
- repository-local agent infrastructure under `.agents/`;
- Agentic Repo Kit system skills under root `skills/`;
- bootstrap templates and workflow;
- clear boundaries between project truth, agent infrastructure, system skills, and work tracking;
- optional vendor-specific adapter guidance.

### Out of Scope

- replacing GitHub Issues, Pull Requests, or equivalent work trackers;
- storing agent chat history or hidden reasoning;
- maintaining repository-owned task plans, handoffs, review logs, or verification archives by default;
- forcing repository-local copies of a user's personal/global skills;
- making tool-specific directories canonical owners of project truth;
- building a general project-management system.

## Architecture Direction

The consumer repository model is:

```text
PROJECT-OVERVIEW.md
= project foundation and design input

AGENTS.md
= repository-wide agent entry guidance

CONTEXT.md
= current project-state projection

docs/
= durable project knowledge in a predictable reading order

.agents/commands/
= repository-local explicit workflow entrypoints

.agents/hooks/
= event-triggered agent automation and guardrails

.agents/rules/
= scoped agent-working rules

.agents/references/
= non-authoritative supporting material

Issues
= task scope, planning, progress, and handoff state

Pull Requests
= implementation, review, CI, and verification
```

The Agentic Repo Kit repository itself additionally contains:

```text
skills/
= reusable system skills shipped by Agentic Repo Kit
```

The `bootstrap-agentic-repo` skill lives there and is not scaffolded into `.agents/skills/` in consumer repositories by default.

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

### Work state belongs in the work tracker

Issues and Pull Requests already model work. Repository documentation and `.agents/` should not mirror that state by default.

### `.agents/` is infrastructure, not history

`.agents/` exists for reusable repository-local commands, hooks, scoped agent rules, and supporting references. It does not exist to record everything an agent planned or did.

### Skills have a separate ownership boundary

The toolkit's own reusable skills live under root `skills/`. Personal or organization skills may remain global in the user's chosen agent environment and are not forced into consumer repositories.

### Bootstrap should not invent decisions

Missing information remains an explicit open question.

## Important Constraints

- remain usable across multiple coding-agent products;
- keep the mental model small;
- allow empty canonical categories to remain visible through local README files;
- avoid duplicate work tracking;
- preserve compatibility with ordinary human development workflows;
- keep vendor-specific integrations optional;
- distinguish agent-only rules from durable implementation standards.

## Major Invariants

- `AGENTS.md` does not become a full architecture manual.
- `CONTEXT.md` does not become project history.
- `docs/` does not contain task progress.
- `.agents/` does not contain task plans, handoffs, review logs, or verification history by default.
- `.agents/rules/` does not replace `docs/04-standards/` for rules that apply to human implementations.
- user/global skills are not copied into `.agents/skills/` by default.
- Issues/PRs remain the work plane.
- tool adapters do not own durable project truth.

## Development Workflow

Repository work is tracked with Issues and Pull Requests.

A normal change should flow roughly as:

```text
Issue
  ↓
relevant docs + .agents infrastructure + applicable system/global skill
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

The project has a reusable template set and a root `bootstrap-agentic-repo` system skill. The current draft redesign keeps `.agents/` as repository-local agent infrastructure, adds commands/hooks/rules/references, leaves user skills global by default, and uses Issues/PRs rather than `.agents/` task-state directories.

## Open Questions

- Should `docs/99-notes/` remain in the long-term canonical structure or stay optional?
- What file formats should repository-local commands and hooks standardize on while remaining vendor-neutral?
- Which tool-specific adapters should Agentic Repo Kit eventually ship as examples?
- Should bootstrap remain skill-only or later gain a CLI?
