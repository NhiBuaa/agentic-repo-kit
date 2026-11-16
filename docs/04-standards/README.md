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
