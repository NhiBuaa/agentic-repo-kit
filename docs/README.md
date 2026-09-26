# Documentation Map

This directory contains durable repository knowledge.

All canonical documentation areas are created up front and kept visible with local `README.md` contracts. Project-specific documents inside them are added only when real content exists.

## Architecture

`architecture/`

Describes how the current system works: runtime structure, component boundaries, data flow, ownership, and subsystem relationships.

## Standards

`standards/`

Contains durable normative rules that implementations must obey.

## ADRs

`adr/`

Preserves rationale and trade-offs for significant architectural decisions.

## Specifications

`specs/`

Defines durable required behavior whose contract should survive individual tasks.

## Guides

`guides/`

Explains normal development or operational procedures.

## Runbooks

`runbooks/`

Explains recovery and incident procedures for abnormal operational states.

## Authority Rule

Each durable fact should have one canonical owner.

Other documents may reference or summarize canonical information, but must not independently maintain conflicting authoritative copies.

Folder existence does not imply project-specific content must be invented. The local README keeps the structure discoverable until a real artifact is needed.
