<#
.SYNOPSIS
    Scaffolds a new software repository following the Agentic Repo Kit model.

.DESCRIPTION
    Initializes canonical root files, durable documentation folders (docs/01-99),
    project-local agent configuration (.agents/), and developer playbooks.
    Tailors the scaffolding depending on whether the project has a User Interface or is Backend/API-only.

.PARAMETER TargetPath
    The target directory to initialize. Defaults to current location.

.PARAMETER ProjectName
    Name of the project. Defaults to the target folder name.

.PARAMETER Description
    A concise 1-2 sentence description of the problem this project solves.

.PARAMETER WithUI
    Switch. If specified, instantiates root DESIGN.md and docs/04-standards/ui-quality.md.
    If omitted, configures a lean repository for backend/API/CLI projects.

.PARAMETER Force
    Switch. If specified, allows initialization in a non-empty directory.
#>

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$TargetPath,

    [Parameter(Position = 1)]
    [string]$ProjectName,

    [Parameter(Position = 2)]
    [string]$Description,

    [switch]$WithUI,
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not $TargetPath) {
    Write-Error "Please specify -TargetPath (e.g., ./scripts/init-repo.ps1 -TargetPath '../my-new-app' [-WithUI])."
    exit 1
}

# Resolve absolute paths
$resolvedTarget = (Resolve-Path -Path $TargetPath -ErrorAction SilentlyContinue)
if (-not $resolvedTarget) {
    New-Item -ItemType Directory -Path $TargetPath -Force | Out-Null
    $resolvedTarget = (Resolve-Path -Path $TargetPath).Path
} else {
    $resolvedTarget = $resolvedTarget.Path
}

# Determine project name if omitted
if (-not $ProjectName) {
    $ProjectName = Split-Path -Path $resolvedTarget -Leaf
}

if (-not $Description) {
    $Description = "A software project developed by human developers and coding agents."
}

# Locate Agentic Repo Kit source root (where templates and docs live)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$kitRoot = Split-Path -Parent $scriptDir

# Guard against initializing the kit repository itself
if ($resolvedTarget -eq $kitRoot) {
    Write-Error "Cannot initialize the Agentic Repo Kit repository itself. Please provide a separate target path."
    exit 1
}

# Verify kit source has templates
if (-not (Test-Path (Join-Path $kitRoot "templates"))) {
    Write-Error "Cannot locate Agentic Repo Kit templates in '$kitRoot'. Please run this script from within the kit or specify a valid kit root."
    exit 1
}

# Precondition check: is target fresh/empty?
$existingFiles = Get-ChildItem -Path $resolvedTarget -Force | Where-Object { $_.Name -notin @(".git", ".gitignore", "README.md") }
if ($existingFiles -and (-not $Force)) {
    Write-Warning "Target directory '$resolvedTarget' contains existing project files:"
    $existingFiles | Select-Object -First 5 -ExpandProperty Name | ForEach-Object { Write-Warning "  - $_" }
    Write-Warning "If this is an existing project with established code, do NOT use init-repo."
    Write-Warning "Instead, use 'establish-project-overview' and 'normalize-agentic-repo' to preserve existing truth."
    Write-Warning "To proceed anyway, re-run with -Force."
    exit 1
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " Initializing Agentic Repository: $ProjectName" -ForegroundColor Cyan
Write-Host " Target Path: $resolvedTarget" -ForegroundColor Cyan
Write-Host " UI Surface:  $([string]([bool]$WithUI))" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Create 15 canonical directories
$dirsToCreate = @(
    "docs/01-overview",
    "docs/02-architecture",
    "docs/03-product",
    "docs/04-standards",
    "docs/05-specs",
    "docs/06-decisions",
    "docs/07-guides",
    "docs/08-runbooks",
    "docs/99-notes",
    ".agents/rules",
    ".agents/references"
)

foreach ($dir in $dirsToCreate) {
    $fullPath = Join-Path $resolvedTarget $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
}

# 2. Copy skeleton READMEs from kit
$skeletonFiles = @(
    "docs/README.md",
    "docs/01-overview/README.md",
    "docs/02-architecture/README.md",
    "docs/03-product/README.md",
    "docs/04-standards/README.md",
    "docs/05-specs/README.md",
    "docs/06-decisions/README.md",
    "docs/07-guides/README.md",
    "docs/08-runbooks/README.md",
    "docs/99-notes/README.md",
    ".agents/README.md",
    ".agents/rules/README.md",
    ".agents/references/README.md"
)

foreach ($relPath in $skeletonFiles) {
    $sourceFile = Join-Path $kitRoot $relPath
    $destFile = Join-Path $resolvedTarget $relPath
    if (Test-Path $sourceFile) {
        Copy-Item -Path $sourceFile -Destination $destFile -Force
    }
}

# 3. Copy Developer Playbooks into docs/07-guides/
$playbooks = @(
    "docs/07-guides/project-start-playbook.md",
    "docs/07-guides/feature-development-playbook.md"
)

foreach ($playbook in $playbooks) {
    $sourceFile = Join-Path $kitRoot $playbook
    $destFile = Join-Path $resolvedTarget $playbook
    if (Test-Path $sourceFile) {
        Copy-Item -Path $sourceFile -Destination $destFile -Force
    }
}

# 4. Instantiate PROJECT-OVERVIEW.md
$inScopeSurface = if ($WithUI) { "- User-facing web/mobile interface;`r`n" } else { "- Backend service and APIs;`r`n" }
$overviewRaw = @'
# {{PROJECT_NAME}} — Project Overview

This root file is the canonical project foundation. Use `docs/01-overview/` only for distinct expanded orientation; do not maintain a paraphrased copy of this file there.

## Problem

{{DESCRIPTION}}

## Product

Who is it for and what are the primary use cases? (To be refined in Playbook 1 Step 2).

## Scope

### In Scope

{{IN_SCOPE_SURFACE}}- Core value proposition and MVP slice;
- Standard durable documentation under `docs/`;
- Project-local agent configuration under `.agents/`.

### Out of Scope

- Features outside the Phase 1 MVP boundary;
- Managing redundant project-management state inside repository markdown.

## Architecture Direction

Describe known direction for frontend, backend, data, infrastructure, integrations, or other relevant layers.
[To be established in Playbook 1 Steps 5–8; do not invent premature decisions]

## Database Design

[To be established in Playbook 1 Step 8; do not invent premature decisions]

## Core Concepts

List important domain entities, terms, or concepts.

## Important Constraints

- security: [To be established in Playbook 1 Step 6]
- performance: [To be established]
- compatibility: [To be established]
- cost: [To be established]
- deployment: [To be established]
- other:

## Major Invariants

- Preserve authorization boundaries and data isolation;
- Secrets and credentials must never be committed to repository.

## Development Workflow

Work scope and progress are tracked in Issues. Implementation, verification, and code reviews are managed in Pull Requests.
'@

$overviewContent = $overviewRaw.Replace("{{PROJECT_NAME}}", $ProjectName).Replace("{{DESCRIPTION}}", $Description).Replace("{{IN_SCOPE_SURFACE}}", $inScopeSurface)
Set-Content -Path (Join-Path $resolvedTarget "PROJECT-OVERVIEW.md") -Value $overviewContent -Encoding utf8

# 5. Instantiate AGENTS.md
$agentsTemplate = Get-Content -Path (Join-Path $kitRoot "templates/AGENTS.md") -Raw
$customAgents = $agentsTemplate.Replace("<!-- Concisely describe what this repository exists to build or maintain. -->", $Description)
if (-not $WithUI) {
    # Remove UI-specific references if project is backend/API-only
    $customAgents = $customAgents -replace '- `DESIGN\.md`[^\r\n]*\r?\n', ''
    $customAgents = $customAgents -replace '3\. Read root `DESIGN\.md`[^\r\n]*\r?\n', ''
    # Re-number Read Order
    $customAgents = $customAgents -replace '4\. Read the relevant Issue', '3. Read the relevant Issue'
    $customAgents = $customAgents -replace '5\. Read only the relevant numbered `docs/` areas[^\r\n]*', '4. Read only the relevant numbered `docs/` areas.'
    $customAgents = $customAgents -replace '6\. Read applicable', '5. Read applicable'
    $customAgents = $customAgents -replace '7\. Inspect implementation', '6. Inspect implementation'
}
Set-Content -Path (Join-Path $resolvedTarget "AGENTS.md") -Value $customAgents -Encoding utf8

# 6. Instantiate CONTEXT.md
$today = Get-Date -Format "yyyy-MM-dd"

$contextRaw = @'
---
status: initializing
last_verified: {{TODAY}}
---

# Current Project Context

## Current Phase

- **Stage:** Project Foundation & Initial MVP Planning.
- **Active Playbook:** [Playbook 1 — Bắt đầu dự án từ con số 0](docs/07-guides/project-start-playbook.md).
- **Work Tracking:** Track task scope, acceptance criteria, and progress in Issues and Pull Requests.

## Boundary & Surface

- **Project Name:** {{PROJECT_NAME}}
- **Has UI Surface:** {{HAS_UI}}
'@

$contextContent = $contextRaw.Replace("{{TODAY}}", $today).Replace("{{PROJECT_NAME}}", $ProjectName).Replace("{{HAS_UI}}", [string]([bool]$WithUI))
Set-Content -Path (Join-Path $resolvedTarget "CONTEXT.md") -Value $contextContent -Encoding utf8

# 7. Instantiate README.md
$uiMentalModel = if ($WithUI) { "DESIGN.md            = canonical visual identity & design system`r`n" } else { "" }
$readmeRaw = @'
# {{PROJECT_NAME}}

{{DESCRIPTION}}

This project is structured according to the **Agentic Repo Kit** conventions for human developers and coding agents.

## Getting Started

Start with the guide that matches your current goal:

1. **[Playbook 1 — Bắt đầu dự án từ con số 0](docs/07-guides/project-start-playbook.md)**: Khởi tạo ý tưởng → giá trị cốt lõi → use case → kiến trúc → bảo mật → công nghệ → database → MVP-first plan.
2. **[Playbook 2 — Phát triển một tính năng](docs/07-guides/feature-development-playbook.md)**: Triển khai tính năng mới theo quy trình phân tích ảnh hưởng, kiểm thử và review PR.

## Mental Model

```text
PROJECT-OVERVIEW.md = what are we building and why?
AGENTS.md            = how should coding agents work here?
CONTEXT.md           = where is the project now?
{{UI_MENTAL_MODEL}}docs/                = durable project knowledge
.agents/             = project-local agent rules + references
Issues               = work scope / planning / progress
Pull Requests         = implementation / review / verification
```
'@

$readmeContent = $readmeRaw.Replace("{{PROJECT_NAME}}", $ProjectName).Replace("{{DESCRIPTION}}", $Description).Replace("{{UI_MENTAL_MODEL}}", $uiMentalModel)
Set-Content -Path (Join-Path $resolvedTarget "README.md") -Value $readmeContent -Encoding utf8

# 8. Handle UI Scaffolding (if requested)
if ($WithUI) {
    # Copy DESIGN.md to root
    $designSource = Join-Path $kitRoot "templates/DESIGN.md"
    if (Test-Path $designSource) {
        $designContent = Get-Content -Path $designSource -Raw
        $designContent = $designContent.Replace("name: product-design-system", "name: $ProjectName-design-system")
        Set-Content -Path (Join-Path $resolvedTarget "DESIGN.md") -Value $designContent -Encoding utf8
    }

    # Copy ui-quality.md to docs/04-standards/
    $qualitySource = Join-Path $kitRoot "templates/ui-quality.md"
    if (Test-Path $qualitySource) {
        Copy-Item -Path $qualitySource -Destination (Join-Path $resolvedTarget "docs/04-standards/ui-quality.md") -Force
    }

    # Copy ui-skill-routing.md to .agents/rules/
    $routingSource = Join-Path $kitRoot "templates/ui-skill-routing.md"
    if (Test-Path $routingSource) {
        Copy-Item -Path $routingSource -Destination (Join-Path $resolvedTarget ".agents/rules/ui-skill-routing.md") -Force
    }
}

Write-Host "`n[OK] Repository successfully initialized at: $resolvedTarget" -ForegroundColor Green
Write-Host "[OK] Canonical folders and READMEs created." -ForegroundColor Green
Write-Host "[OK] Foundation files created: PROJECT-OVERVIEW.md, AGENTS.md, CONTEXT.md, README.md$(if ($WithUI) { ', DESIGN.md, .agents/rules/ui-skill-routing.md' })" -ForegroundColor Green
Write-Host "`nNext Step: Open 'docs/07-guides/project-start-playbook.md' and begin Step 2: Xác định ý tưởng và giá trị cốt lõi." -ForegroundColor Yellow
