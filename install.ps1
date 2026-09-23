<#
.SYNOPSIS
    MySkills 一键安装与软链脚本 (Windows)
.DESCRIPTION
    支持将 MySkills 仓库下的技能通过符号链接或直接拷贝方式安装到 Antigravity、Claude Code、Codex。
.PARAMETER Target
    目标助手: 'antigravity', 'claude', 'codex', 'all' (默认 'all')
.PARAMETER Mode
    安装模式: 'Symlink' (推荐, 实时同步修改) 或 'Copy' (独立副本)
.PARAMETER DryRun
    预览操作，不执行实际改动
#>
[CmdletBinding()]
param(
    [ValidateSet('antigravity', 'claude', 'codex', 'all')]
    [string]$Target = 'all',

    [ValidateSet('Symlink', 'Copy')]
    [string]$Mode = 'Symlink',

    [switch]$DryRun
)

$RepoRoot = $PSScriptRoot
$SkillsDir = Join-Path $RepoRoot "skills"
$SuitesDir = Join-Path $RepoRoot "suites"

# 定义目标目录映射
$TargetDirs = @{}
$HomeDir = [Environment]::GetFolderPath('UserProfile')

if ($Target -in @('antigravity', 'all')) {
    $TargetDirs['Antigravity'] = Join-Path $HomeDir ".gemini\config\skills"
}
if ($Target -in @('claude', 'all')) {
    $TargetDirs['Claude'] = Join-Path $HomeDir ".claude\skills"
}
if ($Target -in @('codex', 'all')) {
    $TargetDirs['Codex'] = Join-Path $HomeDir ".codex\skills"
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MySkills 安装向导 (BlueRocket)" -ForegroundColor Cyan
Write-Host "  模式: $Mode | 目标: $Target" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# 获取需要安装的技能列表
$SkillsToInstall = @()

# 1. 独立技能
if (Test-Path $SkillsDir) {
    Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
        $SkillsToInstall += [PSCustomObject]@{
            Name = $_.Name
            Source = $_.FullName
            Category = "Independent Skill"
        }
    }
}

# 2. 套件中的子技能
$CryoSkillsDir = Join-Path $SuitesDir "cryogenian\skills"
if (Test-Path $CryoSkillsDir) {
    Get-ChildItem -Path $CryoSkillsDir -Directory | ForEach-Object {
        $SkillsToInstall += [PSCustomObject]@{
            Name = $_.Name
            Source = $_.FullName
            Category = "Cryogenian Suite"
        }
    }
}

Write-Host "待安装技能总数: $($SkillsToInstall.Count)" -ForegroundColor Green

foreach ($platform in $TargetDirs.Keys) {
    $destRoot = $TargetDirs[$platform]
    Write-Host "`n>>> 处理平台: $platform -> $destRoot" -ForegroundColor Yellow

    if (-not (Test-Path $destRoot)) {
        if ($DryRun) {
            Write-Host "  [DryRun] 创建目标目录: $destRoot"
        } else {
            New-Item -ItemType Directory -Path $destRoot -Force | Out-Null
        }
    }

    foreach ($s in $SkillsToInstall) {
        $destPath = Join-Path $destRoot $s.Name
        Write-Host "  - 安装: $($s.Name) [$($s.Category)]"

        if (Test-Path $destPath) {
            if ($DryRun) {
                Write-Host "    [DryRun] 目标已存在，将覆盖: $destPath"
            } else {
                Remove-Item -Path $destPath -Recurse -Force -ErrorAction SilentlyContinue
            }
        }

        if ($DryRun) {
            Write-Host "    [DryRun] 将执行: $Mode 从 $($s.Source) 到 $destPath"
            continue
        }

        if ($Mode -eq 'Symlink') {
            try {
                New-Item -ItemType Junction -Path $destPath -Target $s.Source -ErrorAction Stop | Out-Null
                Write-Host "    [OK] Junction 软链成功" -ForegroundColor Green
            } catch {
                # Fallback to copy if Junction/Symlink requires extra privileges
                Copy-Item -Path $s.Source -Destination $destPath -Recurse -Force
                Write-Host "    [Fallback] 软链受限，已使用文件复制" -ForegroundColor DarkYellow
            }
        } else {
            Copy-Item -Path $s.Source -Destination $destPath -Recurse -Force
            Write-Host "    [OK] 文件拷贝成功" -ForegroundColor Green
        }
    }
}

Write-Host "`n全部操作完成！" -ForegroundColor Cyan
