# Agentic Repo Kit Skills

`skills/` contains reusable skills shipped by Agentic Repo Kit itself.

These are toolkit capabilities, not project-local agent configuration.

Current skills:

```text
establish-project-overview/
└── SKILL.md

normalize-agentic-repo/
└── SKILL.md
```

## Selection Rule

Use `establish-project-overview` when the root `PROJECT-OVERVIEW.md` is missing, stale, incomplete, contradictory, or not clearly authoritative.

Use `normalize-agentic-repo` when a meaningful existing repository already has a trustworthy root `PROJECT-OVERVIEW.md` and needs to be normalized into the Agentic Repo Kit model.

A dedicated fresh-repository initialization skill is intentionally not shipped yet. The current priority is validating the existing-repository path first.

Consumer projects do not need to copy this directory into their repository. These skills are invoked from the toolkit to establish project foundation and normalize repository structure.
