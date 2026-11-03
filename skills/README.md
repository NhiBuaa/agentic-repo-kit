# Agentic Repo Kit Skills

`skills/` contains reusable skills shipped by Agentic Repo Kit itself.

These are toolkit capabilities, not project-local agent configuration.

Current skills:

```text
init-agentic-repo/
└── SKILL.md

establish-project-overview/
└── SKILL.md

normalize-agentic-repo/
└── SKILL.md
```

## Selection Rules

1. **`init-agentic-repo`**: Use when starting a brand-new software project from zero in an empty or freshly created repository.
2. **`establish-project-overview`**: Use when the root `PROJECT-OVERVIEW.md` is missing, stale, incomplete, contradictory, or not clearly authoritative in an existing repository.
3. **`normalize-agentic-repo`**: Use when a meaningful existing repository already has a trustworthy root `PROJECT-OVERVIEW.md` and needs to be normalized into the Agentic Repo Kit model.

Consumer projects do not need to copy this directory into their repository. These skills are invoked from the toolkit to establish project foundation and normalize repository structure.
