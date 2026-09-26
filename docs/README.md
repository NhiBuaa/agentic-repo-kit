# Documentation Map

This directory contains durable repository knowledge.

## Architecture

`architecture/`

Describes how the current system works: runtime structure, component boundaries, data flow, ownership, and subsystem relationships.

## Specifications

`specs/`

Defines accepted required behavior whose contract should survive individual tasks.

## Optional Documentation Classes

Create these only when the project needs them:

### Standards

`standards/`

Normative implementation rules shared across multiple implementations or subsystems.

### ADRs

`adr/`

Rationale and trade-offs for significant architectural decisions.

### Guides

`guides/`

Normal development or operational procedures.

### Runbooks

`runbooks/`

Recovery and incident procedures for abnormal operational states.

## Authority Rule

Each durable fact should have one canonical owner.

Other documents may reference or summarize canonical information, but must not independently maintain conflicting authoritative copies.
