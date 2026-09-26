# Standards

This directory contains durable normative rules that implementations must obey.

Create a Standard when the project has a rule that:

- applies across multiple changes or implementations;
- should be followed by both humans and coding agents;
- needs to remain true beyond one task;
- is more precise than a general architectural description.

Examples:

- data ownership rules;
- authorization boundaries;
- migration compatibility requirements;
- testing requirements for a subsystem.

Do not use Standards for:

- temporary task instructions;
- implementation plans;
- decision history;
- issue progress.

Suggested naming:

```text
security.md
data-ownership.md
realtime.md
```

Starter template: `templates/standard.md`
