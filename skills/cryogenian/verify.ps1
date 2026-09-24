[CmdletBinding()]
param([string]$CodexHome = $env:CODEX_HOME)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    $userRoot = if ($env:USERPROFILE) { $env:USERPROFILE } else { $env:HOME }
    if ([string]::IsNullOrWhiteSpace($userRoot)) {
        throw 'Cannot determine the user home directory. Pass -CodexHome explicitly.'
    }
    $CodexHome = Join-Path $userRoot '.codex'
}

$CodexHome = [IO.Path]::GetFullPath($CodexHome)
$TargetSkills = Join-Path $CodexHome 'skills'
$skills = @(
    Get-Content -LiteralPath (Join-Path $PSScriptRoot 'skills.txt') -Encoding UTF8 |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') }
)
$failures = @()

foreach ($skill in $skills) {
    $skillPath = Join-Path $TargetSkills $skill
    $skillFile = Join-Path $skillPath 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        $failures += "Missing: $skillFile"
        continue
    }
    $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $skillFile
    $namePattern = '(?m)^name:\s*' + [regex]::Escape($skill) + '\s*$'
    if ($text -notmatch $namePattern) {
        $failures += "Name mismatch: $skillFile"
    }
    foreach ($match in [regex]::Matches($text, '`(\.\./cryogenian-shared/[^`]+\.md)`')) {
        $relative = $match.Groups[1].Value.Replace('/', [IO.Path]::DirectorySeparatorChar)
        $sharedPath = [IO.Path]::GetFullPath((Join-Path $skillPath $relative))
        if (-not (Test-Path -LiteralPath $sharedPath -PathType Leaf)) {
            $failures += "Broken shared reference in ${skill}: $relative"
        }
    }
}

$legacyNames = @('nature-writing', 'nature-polishing', 'nature-figure', 'nature-statistics', 'nature-academic-search', 'nature-paper-card')
foreach ($file in Get-ChildItem -LiteralPath $TargetSkills -Recurse -File -Include *.md,*.yaml,*.json) {
    if ($skills -notcontains $file.FullName.Substring($TargetSkills.Length + 1).Split([IO.Path]::DirectorySeparatorChar)[0]) {
        continue
    }
    $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
    foreach ($legacy in $legacyNames) {
        if ($text.Contains($legacy)) {
            $failures += "Legacy Nature runtime reference '$legacy': $($file.FullName)"
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "PASS: verified $($skills.Count)/$($skills.Count) Cryogenian research suite Skills in $TargetSkills"
