# Documentation Map

`docs/` contains durable project knowledge.

The numbered directories provide a predictable discovery order for humans and coding agents. The numbers organize reading; they do not make one document type more authoritative than another.

## Reading Order

### `01-overview/`

Stable high-level maps, terminology, and orientation material.

Do not copy the root `PROJECT-OVERVIEW.md` into this folder. The root file captures project foundation and bootstrap input; this folder contains durable overview material that becomes useful as the project grows.

### `02-architecture/`

How the current system works: component boundaries, data flow, ownership, integrations, and failure behavior.

### `03-product/`

Durable product/domain knowledge such as actors, use cases, domain concepts, user flows, and product behavior explanations.

### `04-standards/`

Normative implementation rules that code must obey.

### `05-specs/`

Durable required behavior for capabilities and contracts.

### `06-decisions/`

Significant architectural or product-engineering decisions and their rationale, usually as ADRs.

### `07-guides/`

Normal procedures for development, maintenance, deployment, or common contributor tasks.

### `08-runbooks/`

Procedures for abnormal operational states, recovery, and incidents.

### `99-notes/`

Non-authoritative notes that are useful to retain but do not yet belong to another durable category. Use this sparingly. Task progress belongs in Issues, not here.

## Authority Rule

Each durable fact should have one canonical owner. Other files may link to or summarize it, but should not independently maintain a conflicting copy.

## Work Tracking

Do not use `docs/` for implementation planning, progress updates, handoffs, code-review logs, or CI evidence. Use the repository Issue/PR system for those concerns.
