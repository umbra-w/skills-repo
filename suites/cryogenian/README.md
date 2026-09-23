# Cryogenian Research Suite 1.0.0

面向成冰纪、古环境与沉积/同位素地球化学研究的独立 Codex Skill 套件。
包含 10 个任务 Skill、1 个共享领域层，以及 1 个旧入口兼容 Skill。
不依赖 Nature Skills。

总控入口是 `cryogenian-research-router`。用户也可以直接调用任一任务
Skill，例如 `$cryogenian-evidence-scout`、`$cryogenian-writing` 或
`$cryogenian-figure`。

## 包含内容

| 类型 | Skill |
|---|---|
| 总控 | `cryogenian-research-router` |
| 证据与阅读 | `cryogenian-evidence-scout`, `cryogenian-paper-reader` |
| 科学发现与研究设计 | `cryogenian-hypothesis-lab`, `cryogenian-study-design` |
| 数据与成果 | `cryogenian-data-analysis`, `cryogenian-writing`, `cryogenian-polishing`, `cryogenian-figure` |
| 独立评审 | `cryogenian-reviewer` |
| 共享与兼容 | `cryogenian-shared`, `cryogenian-paleoenvironment` |

## Windows 安装

解压 ZIP，进入解压后的目录，在 PowerShell 中运行：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

预演而不改文件：

```powershell
.\install.ps1 -DryRun
```

指定另一个 Codex 主目录：

```powershell
.\install.ps1 -CodexHome 'D:\codex-profile'
```

## Linux / macOS 安装

解压 tar.gz 或 ZIP，进入解压后的目录：

```bash
chmod +x install.sh verify.sh
./install.sh
```

预演或指定主目录：

```bash
./install.sh --dry-run
./install.sh --codex-home /srv/codex-profile
```

## 安装位置与升级

安装器按以下顺序确定目标：

1. 命令行 `-CodexHome` / `--codex-home`。
2. 环境变量 `CODEX_HOME`。
3. 默认的 `~/.codex`。

Skill 安装到 `<CODEX_HOME>/skills`。重复运行安装器就是升级。已有的同名
Skill 会先备份到：

```text
<CODEX_HOME>/backups/cryogenian-research-suite/<timestamp>/
```

只有明确使用 `-NoBackup` 或 `--no-backup` 时才跳过备份。安装中发生错误
时，脚本会恢复本次已经替换的目录。

安装完成后，新建一个 Codex 任务；如果 Skill 列表尚未刷新，重启 Codex。

## 验证

Windows：

```powershell
.\verify.ps1
```

Linux / macOS：

```bash
./verify.sh
```

校验下载的发行包：

```powershell
Get-FileHash .\cryogenian-research-suite-1.0.0.zip -Algorithm SHA256
```

```bash
sha256sum -c cryogenian-research-suite-1.0.0.sha256
```

## 重新打包新版本

`tools/build_bundle.py` 可从当前机器的 Skill 根目录重新汇总、验证并输出
目录、ZIP、tar.gz 和 SHA-256 文件：

```bash
python tools/build_bundle.py \
  --source-skills ~/.codex/skills \
  --output-dir ./dist \
  --version 1.1.0
```

Windows 示例：

```powershell
python .\tools\build_bundle.py `
  --source-skills "$env:USERPROFILE\.codex\skills" `
  --output-dir .\dist `
  --version 1.1.0
```

目标已存在时工具会停止，防止误覆盖；确认需要替换时添加 `--force`。

## 最低依赖

- 安装：Windows PowerShell 5.1+，或 Linux/macOS 的 Bash、POSIX 基础工具。
- 重新打包：Python 3.9+。
- 运行研究套件：Codex，并按具体任务提供的检索、计算或绘图工具能力。
