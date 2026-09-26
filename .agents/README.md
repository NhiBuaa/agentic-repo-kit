# Project Agent Configuration

`.agents/` contains project-local configuration that helps coding agents work consistently in this repository.

It is not a task tracker and must not duplicate Issue or Pull Request state.

## Structure

```text
.agents/
├── README.md
├── rules/
│   └── README.md
└── references/
    └── README.md
```

## Rules

`.agents/rules/` contains detailed or scoped rules that apply specifically to agent behavior.

Use it for instructions such as Git safety, agent editing discipline, or scoped behavior that would make the root `AGENTS.md` too large.

If a rule must also be obeyed by human developers or by the software itself, it belongs in `docs/04-standards/` instead.

## References

`.agents/references/` contains non-normative supporting material for agents: examples, patterns, lookup notes, or curated references.

References do not override `AGENTS.md`, Standards, Specifications, ADRs, source code, or tests.

## What Does Not Belong Here

Do not use `.agents/` for:

- task plans;
- progress logs;
- handoffs;
- PR reviews;
- verification evidence;
- project-local copies of global personal skills.

Use Issues and Pull Requests for work state.
