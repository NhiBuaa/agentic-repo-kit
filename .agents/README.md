# Agent Work Artifacts

`.agents/` contains task-local artifacts produced during agent-assisted engineering work.

It is not the canonical product knowledge base.

## Structure

```text
.agents/
├── README.md
├── plans/
│   └── README.md
├── handoffs/
│   └── README.md
├── reviews/
│   └── README.md
├── evidence/
│   └── README.md
└── tmp/
    └── README.md
```

Each subdirectory contains a local contract explaining when to use it, what authority it has, and how long artifacts should live.

## Authority

Task-local artifacts help execute work but do not override:

- `PROJECT-OVERVIEW.md`;
- `AGENTS.md`;
- current Architecture;
- Standards;
- accepted Specifications;
- accepted ADRs.

## Promotion Rule

```text
scratch / investigation
        ↓
finding
        ↓
accepted durable truth
        ↓
promote to the correct docs/ artifact
```

Do not promote raw scratch, conversation dumps, or hidden reasoning transcripts.

## Cleanup Rule

When a task finishes:

- remove disposable scratch;
- delete or archive obsolete handoffs;
- delete plans that no longer provide value;
- retain reviews or evidence only when they remain useful.

Reusable task-artifact starters live under `templates/`.
