# Skills

This directory contains reusable automation for applying Agentic Repo Kit conventions to real repositories.

Skills are an execution layer, not a new source of product truth.

They may:

- inspect a repository;
- read canonical project input;
- create or update repository structure;
- render files from `templates/`;
- report unresolved information;
- validate that the repository follows the intended information model.

They must not silently invent product, architecture, security, or workflow decisions that are not supported by project input or repository reality.

## Available Skills

### `bootstrap-agentic-repo`

Bootstraps or aligns a repository from `PROJECT-OVERVIEW.md`.

See `bootstrap-agentic-repo/SKILL.md`.
