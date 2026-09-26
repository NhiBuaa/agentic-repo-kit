# Evidence

This directory contains task-specific verification or acceptance evidence worth retaining beyond ordinary local output.

Create Evidence when proof of a claim should remain inspectable after the task completes.

Examples:

- acceptance criteria mapped to tests;
- reproducible performance results;
- retained manual verification steps;
- security verification tied to a revision.

Prefer source tests and CI results when they already provide sufficient durable proof.

Evidence must state only what was actually verified. Do not rewrite or broaden results to make a failing or partial check appear successful.

Suggested organization:

```text
issue-123/
└── acceptance.md
```

Starter template: `templates/evidence.md`
