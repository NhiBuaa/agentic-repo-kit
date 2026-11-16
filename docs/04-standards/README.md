# 04 — Standards

This directory contains normative engineering and modeling rules shared by humans and agents.

A Standard answers:

> What rules must implementations or engineering artifacts obey?

Use precise MUST / MUST NOT / SHOULD language when useful.

Do not store temporary task decisions or examples here merely because an agent needs them. Non-normative examples belong under `.agents/references/`.

Starters:
- `templates/standard.md` — generic technical or subsystem standard.
- `templates/ui-quality.md` — UI/UX quality, scannability, visual identity, motion, and verification standard.

## Use Case Modeling

For use case analysis, diagrams or review, use `docs/04-standards/use-case-modeling.md` in the adopting project. The kit's single reusable source is `templates/use-case-modeling.md`; it owns the method, notation and render checks, while `docs/03-product/` owns the actual product model and business rules.

Fresh initialization installs the standard for both UI and non-UI projects. In an existing repository, adopt or reconcile it only within the approved scope; preserve accepted rules and resolve conflicts before replacement. The playbooks route here so the same guidance works in the kit and in generated projects.

The canonical `docs/04-standards/use-case-modeling.md` route in root `AGENTS.md` declares consumer adoption. The validator then requires that file; a legacy repository without that route is not required to migrate. When adopting through normalization, add the route together with the reconciled standard.

## Bugfix and Review

Before bug fixes, review remediation or review of changed behavior, read `docs/04-standards/bugfix-review.md` in the adopting project. In the kit itself, read the single reusable source `templates/bugfix-review.md`. It owns the shared method; accepted domain rules and API contracts remain in their existing project owners. Findings and evidence belong in Issues/PRs.

Fresh initialization installs this standard for UI and non-UI projects. Root `AGENTS.md` declares adoption with the canonical `docs/04-standards/bugfix-review.md` route; the validator then requires the file. Legacy repositories without that route are not forced to migrate. Integrity checks do not prove agent compliance or runtime correctness.

For an existing project, review the reusable source against its current review/test rules, consolidate into the existing owner or deliberately adopt the canonical path, and resolve conflicts with the owner before replacement. Preserve accepted project rules and open decisions. Add the AGENTS route and playbook reference together with the reconciled standard, then run project checks and the kit validator. Do not rerun initialization as an upgrade: `-Force` can overwrite other scaffold files. If retaining a different owner path, route to it explicitly; the canonical-path missing-file check does not cover custom routes.
