# Agentic Repo Kit — Project Overview

## Problem

Software repositories increasingly contain instructions, architecture notes, specifications, decisions, task plans, agent handoffs, reviews, and verification evidence. When these artifacts grow organically, humans and coding agents can face duplicated authority, stale context, unclear loading order, and excessive context volume.

Agentic Repo Kit aims to provide a small, repeatable repository operating model that makes these information classes explicit and easy to bootstrap.

## Product

Agentic Repo Kit is a vendor-neutral repository foundation for software projects developed by humans and coding agents.

The intended user flow is:

```text
Analyze the project
        ↓
Write PROJECT-OVERVIEW.md
        ↓
Run the bootstrap skill
        ↓
Generate the repository operating structure
        ↓
Continue normal development
```

The kit should work with tools such as Codex, Claude Code, GitHub Copilot, Gemini-based coding agents, and custom engineering agents without making any one vendor the source of truth.

## Scope

### In Scope

- A canonical `PROJECT-OVERVIEW.md` format for initial project analysis.
- A reusable repository structure for agent-assisted development.
- Clear information ownership between agent instructions, current context, durable documentation, and task-local work.
- Folder-local `README.md` files that preserve structure and explain how each area should be used.
- Reusable file templates.
- A bootstrap skill that reads `PROJECT-OVERVIEW.md` and initializes the operating structure.
- Lightweight rules for maintaining the structure over time.

### Out of Scope for the Current Stage

- Replacing project management systems such as GitHub Issues or PRs.
- Replacing source code, tests, CI, or product-specific documentation.
- Building a large autonomous agent framework.
- Enforcing one programming language, architecture style, or deployment platform.
- Automatically inventing missing product or architecture decisions.

## Architecture Direction

The repository is organized into three layers:

### Repository Standard

Defines the information model, authority boundaries, canonical folder structure, and lifecycle rules.

### Templates

Provides reusable starter files for project overview, agent instructions, current context, architecture, standards, ADRs, specifications, plans, handoffs, reviews, evidence, guides, and runbooks.

### Skills

Provides automation that applies the standard and templates to a real project.

The first canonical skill is:

```text
skills/bootstrap-agentic-repo/
```

## Core Concepts

### Project Overview

Initial analyzed understanding of what the project intends to build, its scope, constraints, architecture direction, important concepts, and unresolved questions.

### Agent Guidance

Repository-specific instructions that tell coding agents how to operate safely and where authoritative information lives.

### Current Context

A bounded projection of what matters about the repository now: current state, active direction, transitions, and important limitations.

### Durable Documentation

Long-lived system knowledge such as current architecture, normative standards, decision rationale, specifications, guides, and runbooks.

### Agent Work Artifacts

Task-local plans, handoffs, reviews, evidence, and scratch work that assist execution but do not become durable product authority by default.

## Important Constraints

- Keep the system understandable without requiring users to memorize a complex framework.
- Prefer explicit structure over hidden conventions.
- Keep coding-agent context small and progressively disclosed.
- Remain vendor-neutral.
- Avoid duplicating authoritative truths across multiple files.
- Do not invent project facts when bootstrapping from incomplete input.
- Empty canonical areas may exist with a `README.md` so their intended role remains visible.

## Major Invariants

- One important truth should have one canonical owner.
- Root repository files describe the repository they live in; reusable consumer templates live under `templates/`.
- `PROJECT-OVERVIEW.md` is the bootstrap input and project foundation, not a running task log.
- `AGENTS.md` governs agent behavior, not complete system architecture.
- `CONTEXT.md` describes what matters now, not the entire history of the project.
- `docs/` owns durable project knowledge.
- `.agents/` owns task-local agent work artifacts.
- Folder-local `README.md` files explain purpose, usage, naming, and boundaries.
- Bootstrap automation must not silently invent unresolved architecture or product decisions.

## Development Workflow

For this repository:

- `PROJECT-OVERVIEW.md` describes the project foundation.
- Root `AGENTS.md` and `CONTEXT.md` describe how to work on Agentic Repo Kit itself.
- `templates/` contains files intended to be copied or rendered into other projects.
- `skills/` contains reusable automation instructions.
- GitHub Issues and PRs should own implementation status as the project grows.

## Current State

Version `0.2` redesign is in progress.

The initial v0.1 repository established the authority model and starter artifact templates. The v0.2 direction simplifies usage around a single bootstrap input (`PROJECT-OVERVIEW.md`), pre-created canonical folders with local README guidance, reusable templates, and a bootstrap skill.

## Open Questions

- Whether a future CLI should complement or replace skill-based bootstrapping.
- Which coding-agent skill/package formats should receive first-class distribution support.
- Whether validation of repository contracts should be implemented as CI, CLI tooling, agent skills, or a combination.
- What the minimum stable surface should be for a future `v1.0` release.
