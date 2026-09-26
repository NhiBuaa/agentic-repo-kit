# Agent Rules

Store scoped rules for how coding agents should work in this repository.

Use this area when a rule is agent-facing, local to a specific workflow or part of the tree, and too detailed for the root `AGENTS.md`.

Examples:

- path-scoped editing constraints;
- agent-specific safety boundaries;
- required checks before changing a subsystem;
- instructions for interacting with generated files or external tools.

Do not place durable product or engineering standards here. If a rule applies to human implementations as well as agents, it usually belongs in `docs/04-standards/`.

The root `AGENTS.md` should remain the entrypoint and route agents to relevant scoped rules when needed.
