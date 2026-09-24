[CmdletBinding()]
param(
    [string]$CodexHome = $env:CODEX_HOME,
    [switch]$DryRun,
    [switch]$NoBackup
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

$PackageRoot = $PSScriptRoot
$SourceSkills = Join-Path $PackageRoot 'skills'
$SkillList = Join-Path $PackageRoot 'skills.txt'

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    $userRoot = if ($env:USERPROFILE) { $env:USERPROFILE } else { $env:HOME }
    if ([string]::IsNullOrWhiteSpace($userRoot)) {
        throw 'Cannot determine the user home directory. Pass -CodexHome explicitly.'
    }
    $CodexHome = Join-Path $userRoot '.codex'
}

$CodexHome = [IO.Path]::GetFullPath($CodexHome)
$volumeRoot = [IO.Path]::GetPathRoot($CodexHome)
if ($CodexHome.TrimEnd('\', '/') -eq $volumeRoot.TrimEnd('\', '/')) {
    throw "Refusing to use a filesystem root as CodexHome: $CodexHome"
}

if (-not (Test-Path -LiteralPath $SkillList -PathType Leaf)) {
    throw "Missing package skill list: $SkillList"
}

$skills = @(
    Get-Content -LiteralPath $SkillList -Encoding UTF8 |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') }
)
if ($skills.Count -eq 0) {
    throw 'The package contains no skills.'
}

foreach ($skill in $skills) {
    if ($skill -notmatch '^[a-z0-9][a-z0-9-]*$') {
        throw "Unsafe skill name in skills.txt: $skill"
    }
    $source = Join-Path $SourceSkills $skill
    $skillFile = Join-Path $source 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        throw "Missing SKILL.md for $skill"
    }
    $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $skillFile
    $namePattern = '(?m)^name:\s*' + [regex]::Escape($skill) + '\s*$'
    if ($text -notmatch $namePattern) {
        throw "SKILL.md name does not match directory: $skill"
    }
}

$TargetSkills = Join-Path $CodexHome 'skills'
$conflicts = @($skills | Where-Object { Test-Path -LiteralPath (Join-Path $TargetSkills $_) })

Write-Host "Package: cryogenian-research-suite 1.0.0"
Write-Host "Target:  $TargetSkills"
Write-Host "Skills:  $($skills.Count)"
if ($conflicts.Count -gt 0) {
    Write-Host "Update:  $($conflicts.Count) existing skill directories will be replaced."
}

if ($DryRun) {
    Write-Host 'DRY RUN: no files were created or changed.'
    return
}

New-Item -ItemType Directory -Force -Path $CodexHome, $TargetSkills | Out-Null
$staging = Join-Path $CodexHome ('.cryogenian-install-' + [guid]::NewGuid().ToString('N'))
$backupRoot = $null
$touched = @()

try {
    New-Item -ItemType Directory -Path $staging | Out-Null
    foreach ($skill in $skills) {
        Copy-Item -Recurse -Force -LiteralPath (Join-Path $SourceSkills $skill) -Destination (Join-Path $staging $skill)
    }

    if ($conflicts.Count -gt 0 -and -not $NoBackup) {
        $stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
        $backupRoot = Join-Path $CodexHome "backups\cryogenian-research-suite\$stamp"
        New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null
        foreach ($skill in $conflicts) {
            Copy-Item -Recurse -Force -LiteralPath (Join-Path $TargetSkills $skill) -Destination (Join-Path $backupRoot $skill)
        }
    }

    foreach ($skill in $skills) {
        $target = Join-Path $TargetSkills $skill
        $touched += $skill
        if (Test-Path -LiteralPath $target) {
            Remove-Item -Recurse -Force -LiteralPath $target
        }
        Move-Item -LiteralPath (Join-Path $staging $skill) -Destination $target
    }

    & (Join-Path $PackageRoot 'verify.ps1') -CodexHome $CodexHome

    $record = [ordered]@{
        suite = 'cryogenian-research-suite'
        version = '1.0.0'
        installed_at = (Get-Date).ToString('o')
        skills = $skills
        backup = $backupRoot
    }
    $record | ConvertTo-Json -Depth 3 | Set-Content -Encoding UTF8 -LiteralPath (Join-Path $CodexHome 'cryogenian-research-suite-install.json')
}
catch {
    foreach ($skill in $touched) {
        $target = Join-Path $TargetSkills $skill
        if (Test-Path -LiteralPath $target) {
            Remove-Item -Recurse -Force -LiteralPath $target
        }
        if ($backupRoot) {
            $backup = Join-Path $backupRoot $skill
            if (Test-Path -LiteralPath $backup) {
                Copy-Item -Recurse -Force -LiteralPath $backup -Destination $target
            }
        }
    }
    throw
}
finally {
    if (Test-Path -LiteralPath $staging) {
        Remove-Item -Recurse -Force -LiteralPath $staging
    }
}

Write-Host 'Installation complete. Open a new Codex task or restart Codex to refresh the Skill catalog.'
if ($backupRoot) {
    Write-Host "Backup: $backupRoot"
}
