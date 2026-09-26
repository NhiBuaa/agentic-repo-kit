# Documentation Map

`docs/` is the durable knowledge plane for the project.

The numbered categories provide a predictable discovery order for humans and coding agents. The numbers organize navigation; they do not define authority precedence.

## `01-overview/`

Stable project orientation and high-level system context.

## `02-architecture/`

How the current system works: components, boundaries, ownership, runtime structure, data flow, and failure behavior.

## `03-product/`

Durable product and domain knowledge: users, domain concepts, user flows, terminology, and product rules that are broader than one specification.

## `04-standards/`

Normative implementation rules that human developers and coding agents must follow.

Agent-only working rules belong under `.agents/rules/`, not here.

## `05-specs/`

Durable required behavior for capabilities whose contracts should survive individual tasks.

## `06-decisions/`

Rationale and trade-offs for significant decisions. This is the ADR/decision-history area.

## `07-guides/`

Normal development or operational procedures.

## `08-runbooks/`

Recovery and incident procedures for abnormal operational states.

## `99-notes/`

Non-authoritative retained notes that are useful but do not belong to a stronger canonical category.

Do not use this as a dumping ground for task progress or stale scratch work.

## Work State

Task scope, planning, progress, handoffs, review discussion, CI, and verification belong in the repository Issue/PR system rather than `docs/`.

## Authority Rule

Each durable fact should have one canonical owner. Other artifacts may reference or summarize it, but should not maintain competing authoritative copies.
