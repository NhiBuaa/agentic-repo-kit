---
name: init-agentic-repo
description: Use when starting a new software project from scratch and initializing an empty or newly created repository according to the Agentic Repo Kit model.
---

# Initialize Agentic Repository

## Overview

Scaffold a fresh, production-ready repository conforming to the **Agentic Repo Kit** specification, tailored to the project's surface scope (UI vs Backend/API).

**Core principle:** an initial repository foundation captures the user's intent and boundaries without inventing missing architecture, technology, or database decisions. Decisions belong to the developer through the structured steps of Playbook 1.

---

## When to Use

Use this skill when:
- Starting a brand-new software project from con số 0;
- An empty directory or a freshly created repository (containing at most `.git`, `.gitignore`, or a placeholder `README.md`) needs full canonical scaffolding;
- A developer wants to begin [Playbook 1 — Bắt đầu dự án từ con số 0](../../docs/07-guides/project-start-playbook.md).

### When NOT to Use
- **DO NOT** use this skill if the repository already contains existing code, established documentation, or complex history.
  - If `PROJECT-OVERVIEW.md` is missing or stale on an existing repo, use `establish-project-overview`.
  - To reorganize an existing repository into the kit model, use `normalize-agentic-repo`.

---

## Workflow

### 1. Precondition Check

Inspect the target directory before scaffolding:
- Confirm the directory is empty or contains only initial git files (`.git`, `.gitignore`, minimal `README.md`).
- If existing application code or custom documentation is detected, **STOP immediately** and advise the user to run `normalize-agentic-repo` to avoid accidental data loss.

### 2. Gather Essential Project Parameters

Ask the user at most **3 focused questions** (do not overwhelm with a long questionnaire):

1. **Project Name:** (Defaults to folder name if omitted).
2. **Core Intent / Problem Statement:** What problem does this project solve, and for whom? (1–2 sentences).
3. **Surface Scope:** Does this project have a **User Interface** (Web, Mobile, Desktop), or is it **Backend / API / CLI / Service-only**?
   - *If UI:* Optional check on preferred visual tone (Dark/Light canvas, primary accent color).

### 3. Execute Scaffolding

Execute the deterministic scaffolding script or generate equivalent files:

```powershell
# From the kit repository:
./scripts/init-repo.ps1 -TargetPath "<target-dir>" -ProjectName "<name>" -Description "<intent>" [-WithUI]
```

The scaffolding creates:
- **Canonical Documentation & Agent Directories (13 folders)** with orienting `README.md` files:
  - `docs/` and `docs/01-overview/` through `docs/08-runbooks/` and `docs/99-notes/` (10 directories)
  - `.agents/`, `.agents/rules/` and `.agents/references/` (3 directories)
- **Developer Playbooks** in `docs/07-guides/`:
  - `project-start-playbook.md`
  - `feature-development-playbook.md`
- **Root Context Files:**
  - `PROJECT-OVERVIEW.md` (foundation, scope, and explicit un-invented placeholders)
  - `AGENTS.md` (authority map, read order)
  - `CONTEXT.md` (initial status: initializing, Phase 1 MVP)
  - `README.md` (mental model and playbook links)

#### Surface Scope Tailoring:
- **With UI (`-WithUI`):**
  - Instantiates root `DESIGN.md` (Google Stitch / VoltAgent standard);
  - Instantiates `docs/04-standards/ui-quality.md`;
  - Routes agent UI tasks to `DESIGN.md` in `AGENTS.md`.
- **Backend / API Only:**
  - Omits `DESIGN.md`;
  - Keeps `docs/04-standards/` clean (no `ui-quality.md`);
  - Strips UI-specific routing from `AGENTS.md` and `README.md`.

### 4. Foundation Discipline ("No Fake Decisions")

When populating initial files:
- **MUST** record the verified problem statement and user intent.
- **MUST NOT** invent tech stacks (e.g., PostgreSQL, FastAPI, React) or architecture diagrams that the developer has not explicitly chosen.
- Leave Architecture, Database, and Security marked as `[To be established in Playbook 1 Steps 5–8]`.

### 5. Verify & Hand-Off

After scaffolding:
1. Verify all 13 canonical directories and their `README.md` files exist.
2. Verify all internal markdown links resolve without error.
3. Run `./scripts/check-kit.ps1 -TargetPath "<target-dir>"` to automatically verify repository integrity and conformance.
4. Hand-off clearly to the developer:
   > *"Repository scaffolded successfully. You are now at **Playbook 1 — Bước 2: Xác định ý tưởng và giá trị cốt lõi**. Hãy mở `PROJECT-OVERVIEW.md` để rà soát mục tiêu MVP trước khi vẽ Use Case Diagram."*

---

## Acceptance Checklist

Before reporting initialization complete, verify:

- [ ] Target directory was confirmed to be empty or fresh before scaffolding.
- [ ] Project parameters (Name, Problem, Surface Scope) were explicitly confirmed.
- [ ] No unconfirmed architecture, database, or tech stack decisions were invented.
- [ ] If UI: root `DESIGN.md` and `docs/04-standards/ui-quality.md` exist and match project intent.
- [ ] If Non-UI: `DESIGN.md` and `ui-quality.md` are omitted; `AGENTS.md` is lean.
- [ ] All 13 canonical directories and orienting `README.md` files exist.
- [ ] All internal markdown links resolve correctly.
- [ ] Repository passes automated integrity verification (`./scripts/check-kit.ps1 -TargetPath "<target-dir>"`).
- [ ] Developer received a clear hand-off to Playbook 1 Step 2.
