# Agent Work Artifacts

`.agents/` contains artifacts produced during agent-assisted engineering work.

It is not the canonical product knowledge base.

## Optional Structure

Create subdirectories only when they are needed:

```text
.agents/
├── README.md
├── plans/
├── handoffs/
├── reviews/
├── evidence/
└── tmp/
```

`tmp/` is scratch space and should remain Git-ignored.

## Plans

Implementation approaches for individual tasks.

Authority: task-local only.

Plans may become stale, may be rewritten, and may be deleted. A plan must never override an accepted Specification, Standard, ADR, or current Architecture.

Suggested name:

```text
issue-123-short-title.md
```

## Handoffs

Bounded continuation state for another agent or session.

Handoffs accelerate continuation but never replace canonical repository documentation or verification of repository reality.

## Reviews

Code, architecture, security, or design review findings.

A review finding is not automatically an accepted decision.

If a finding becomes durable truth, intentionally promote it into the appropriate durable artifact.

## Evidence

Task-specific verification and acceptance evidence worth retaining.

Prefer existing tests and CI results when they already provide sufficient durable evidence.

## Promotion Rule

```text
investigation
    ↓
finding
    ↓
accepted decision
    ↓
canonical durable documentation
```

Do not promote raw scratch, conversation dumps, or reasoning transcripts.

## Cleanup Rule

When a task finishes:

- remove temporary artifacts;
- delete or archive obsolete handoffs;
- delete plans that no longer provide value;
- retain evidence only when it has durable verification value.

Starter artifacts live under `.template/artifacts/`.
