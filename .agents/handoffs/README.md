# Handoffs

This directory contains bounded continuation state for work that moves between agents, sessions, or interrupted environments.

Create a Handoff when another worker must continue without reconstructing the entire task from chat history.

A Handoff should capture:

- objective;
- completed work;
- current repository state;
- files changed;
- decisions already established;
- validation performed;
- unresolved items;
- risks;
- next action;
- canonical references.

Authority: continuation aid only.

A Handoff never replaces canonical repository documentation or verification of the current working tree.

Suggested naming:

```text
issue-123.md
```

Starter template: `templates/handoff.md`
