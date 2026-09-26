# Architecture

This directory owns the current architectural model of the system.

Architecture documents answer:

> How does the system work now?

Use one document per meaningful area or subsystem when useful.

Suggested examples:

```text
overview.md
persistence.md
realtime.md
ingestion.md
retrieval.md
deployment.md
```

Do not use architecture documents as:

- chronological project history;
- task plans;
- issue trackers;
- decision diaries.

Historical rationale belongs in ADRs when that artifact class is used.

Starter: `.template/artifacts/architecture.md`
