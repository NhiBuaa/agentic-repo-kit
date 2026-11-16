<#
.SYNOPSIS
    Regression checks for bugfix/review standard distribution and explicit adoption.
#>
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$kitRoot = Split-Path -Parent $PSScriptRoot
$checker = Join-Path $PSScriptRoot 'check-kit.ps1'
$powerShell = (Get-Process -Id $PID).Path
$testRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('bugfix-review-' + [guid]::NewGuid().ToString('N'))
$standardPath = 'docs/04-standards/bugfix-review.md'

function Assert-Validation ([string]$target, [bool]$missing) {
    foreach ($mode in @('full', 'skeleton')) {
        $arguments = @('-NoProfile', '-File', $checker, '-TargetPath', $target, '-Strict', '-Json')
        if ($mode -eq 'skeleton') { $arguments += '-SkeletonOnly' }
        $output = & $powerShell @arguments
        $exitCode = $LASTEXITCODE
        $result = $output | ConvertFrom-Json
        $expectedExit = if ($missing) { 1 } else { 0 }
        if ($exitCode -ne $expectedExit -or $result.Passed -ne (-not $missing)) {
            throw "Unexpected $mode validation for '$target': exit=$exitCode, expected=$expectedExit. $output"
        }
        if ($missing -and ($result.PassStats.MissingFiles -ne 1 -or -not ($result.Errors -match [regex]::Escape($standardPath)))) {
            throw "Missing standard was not identified by $mode validation: $output"
        }
    }
}

foreach ($surface in @('api', 'ui')) {
    $target = Join-Path $testRoot $surface
    $options = @{ TargetPath = $target; ProjectName = 'Bugfix review regression' }
    if ($surface -eq 'ui') { $options.WithUI = $true }
    & (Join-Path $PSScriptRoot 'init-repo.ps1') @options *> $null
    $standard = Join-Path $target $standardPath
    if (-not (Test-Path -LiteralPath $standard)) {
        throw "Initialization did not distribute the bugfix/review standard: $surface ($target)"
    }
    if ((Get-FileHash -LiteralPath $standard).Hash -ne (Get-FileHash (Join-Path $kitRoot 'templates/bugfix-review.md')).Hash) {
        throw "Scaffolded standard differs from the reusable source: $surface"
    }
    Assert-Validation $target $false

    $saved = Join-Path $testRoot "$surface-standard.md"
    Move-Item -LiteralPath $standard -Destination $saved
    Assert-Validation $target $true
    $textOutput = & $powerShell -NoProfile -File $checker -TargetPath $target -Strict
    if ($LASTEXITCODE -ne 1 -or -not ($textOutput -match [regex]::Escape($standardPath))) {
        throw "Text validation did not reject the missing standard: $surface"
    }
    Move-Item -LiteralPath $saved -Destination $standard
    Assert-Validation $target $false

    # Legacy repositories opt in by adding the route together with the standard.
    $agents = Join-Path $target 'AGENTS.md'
    $originalAgents = [System.IO.File]::ReadAllText($agents)
    $legacyAgents = ($originalAgents -split '\r?\n' | Where-Object { -not $_.Contains($standardPath) }) -join "`n"
    [System.IO.File]::WriteAllText($agents, $legacyAgents)
    Move-Item -LiteralPath $standard -Destination $saved
    Assert-Validation $target $false
    if (Test-Path -LiteralPath $standard) { throw 'Validator must not migrate legacy repositories.' }
    [System.IO.File]::WriteAllText($agents, $originalAgents)
    Assert-Validation $target $true
    Move-Item -LiteralPath $saved -Destination $standard
    Assert-Validation $target $false

    # Force still preserves an accepted project standard; it is not an upgrade workflow.
    [System.IO.File]::WriteAllText($standard, "# Accepted project review rules`n`nKeep this exception unchanged.`n")
    $customHash = (Get-FileHash -LiteralPath $standard).Hash
    & (Join-Path $PSScriptRoot 'init-repo.ps1') @options -Force *> $null
    if ((Get-FileHash -LiteralPath $standard).Hash -ne $customHash) {
        throw "Force initialization overwrote accepted project review rules: $surface"
    }
    Assert-Validation $target $false
    Write-Output "$surface PASS: distribution, missing full/skeleton JSON and text failure, restore, legacy compatibility, explicit adoption and Force preservation"
}
Write-Output "Fixtures retained at: $testRoot"
