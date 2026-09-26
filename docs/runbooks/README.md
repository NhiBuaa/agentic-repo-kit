# Runbooks

This directory contains procedures for abnormal operational states, incidents, and recovery.

Create a Runbook when the project has a failure or recovery scenario that should be handled consistently.

Examples:

- failed deployment recovery;
- queue backlog response;
- database restore procedure;
- degraded external dependency handling.

A Runbook should clearly define:

- when it applies;
- safety constraints;
- diagnosis steps;
- recovery steps;
- verification;
- stop or escalation conditions.

Do not use Runbooks for normal development procedures; those belong in `docs/guides/`.

Starter template: `templates/runbook.md`
