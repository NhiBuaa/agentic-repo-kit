<#
.SYNOPSIS
    Regression checks for use case standard adoption and missing-file detection.
#>
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$kitRoot = Split-Path -Parent $PSScriptRoot
$checker = Join-Path $PSScriptRoot 'check-kit.ps1'
$powerShell = (Get-Process -Id $PID).Path
$testRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('use-case-modeling-' + [guid]::NewGuid().ToString('N'))
$standardPath = 'docs/04-standards/use-case-modeling.md'

function Assert-Validation ([string]$target, [bool]$missing) {
    $output = & $powerShell -NoProfile -File $checker -TargetPath $target -Strict -Json
    $exitCode = $LASTEXITCODE
    $result = $output | ConvertFrom-Json
    $expectedExit = if ($missing) { 1 } else { 0 }
    if ($exitCode -ne $expectedExit -or $result.Passed -ne (-not $missing)) {
        throw "Unexpected validation result for '$target': exit=$exitCode, Passed=$($result.Passed), expected missing=$missing. $output"
    }
    if ($missing -and ($result.PassStats.MissingFiles -ne 1 -or -not ($result.Errors -match [regex]::Escape($standardPath)))) {
        throw "Missing standard was not identified: $output"
    }
}

foreach ($surface in @('api', 'ui')) {
    $target = Join-Path $testRoot $surface
    $options = @{ TargetPath = $target; ProjectName = 'Use case regression' }
    if ($surface -eq 'ui') { $options.WithUI = $true }
    & (Join-Path $PSScriptRoot 'init-repo.ps1') @options *> $null
    $standard = Join-Path $target $standardPath
    if ((Get-FileHash -LiteralPath $standard).Hash -ne (Get-FileHash (Join-Path $kitRoot 'templates/use-case-modeling.md')).Hash) {
        throw "Scaffolded standard differs from the template: $surface"
    }
    if (Test-Path (Join-Path $target 'docs/03-product/use-cases.md')) {
        throw 'Scaffolding must not install the illustrative product model.'
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

    # Model a legacy repository without an AGENTS adoption route or standard.
    $agents = Join-Path $target 'AGENTS.md'
    $originalAgents = [System.IO.File]::ReadAllText($agents)
    $legacyAgents = ($originalAgents -split '\r?\n' | Where-Object { -not $_.Contains($standardPath) }) -join "`n"
    [System.IO.File]::WriteAllText($agents, $legacyAgents)
    Move-Item -LiteralPath $standard -Destination $saved
    Assert-Validation $target $false
    if (Test-Path -LiteralPath $standard) { throw 'Validator must not migrate legacy repositories.' }
    # Opting in makes the absent file mandatory, even on the legacy fixture.
    [System.IO.File]::WriteAllText($agents, $originalAgents)
    Assert-Validation $target $true
    Move-Item -LiteralPath $saved -Destination $standard
    Assert-Validation $target $false
    Write-Output "$surface PASS: scaffold, missing JSON/text failure, restore, legacy compatibility and explicit adoption"
}
Write-Output "Fixtures retained at: $testRoot"
