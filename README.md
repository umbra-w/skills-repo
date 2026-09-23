# MySkills - 统一 AI Agent 技能知识库

<p align="center">
  <strong>个人专属 AI Agent 技能全景仓库（Skills Monorepo）</strong>
  <br />
  涵盖系统级日志诊断、深度学习实验管理、前沿科研套件、技术学习与专业文档架构
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Skills_Count-17-blue.svg" alt="Skills Count" />
  <img src="https://img.shields.io/badge/Platform-Antigravity%20%7C%20Claude%20Code%20%7C%20Codex-success.svg" alt="Platforms" />
  <img src="https://img.shields.io/badge/Maintainer-BlueRocket-orange.svg" alt="Maintainer" />
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License" />
</p>

---

## 📖 项目简介

**MySkills** 是 **BlueRocket** 的个人 AI Agent 技能聚合中心。本项目将分散在各独立工程中的 Agent 提示词工程、知识库和评测套件收拢为结构化的 **Monorepo** 体系，提供：

1. **跨平台一键下发**：原生支持一键软链接（Junction / Symlink）至 **Google Antigravity**、**Anthropic Claude Code** 及 **OpenAI Codex**。
2. **规范化架构**：每个 Skill 均配备标准的 `SKILL.md`（遵循 YAML Frontmatter）、参考知识库 `references/`、规范模板与评测样例 `evals/`。
3. **极速热更新**：在当前仓库编辑技能源码，本地绑定的各 AI 助手将实时生效，无需重复拷贝。

---

## 🎯 技能矩阵与触发指南

### 1. 核心独立技能 (`skills/`)

| 技能名称 | 目录路径 | 核心能力定位 | 典型触发场景 / 常用提示词 |
| :--- | :--- | :--- | :--- |
| **`academic-mentor`** | `skills/academic-mentor/` | 学术导师、顶刊文献精读、开题/实验方案设计、审稿意见预演 | `精读这篇论文`、`学术开题指导`、`模拟审稿人提出修改意见` |
| **`android-linux-log-analysis-doc`** | `skills/android-linux-log-analysis-doc/` | Android/Linux 全栈故障诊断（Kernel/HAL/Bootloader），以证据链为主线输出 Markdown 调查文档 | `分析这段崩溃日志`、`定位休眠唤醒失败问题`、`根据 dmesg 输出排查报告` |
| **`dlexperiment`** | `skills/dlexperiment/` | 深度学习实验管理 OS，涵盖实验设计原则、消融对比、多随机种子聚合与评估模板 | `制定消融实验方案`、`对比模型训练指标`、`生成规范深度学习实验记录` |
| **`tech-doc-writer`** | `skills/tech-doc-writer/` | 顶尖技术文档架构指南，规范逻辑结构、严谨技术表达、反模式排查与图表选型 | `编写系统架构设计文档`、`重构技术方案`、`检查文档逻辑漏洞与反模式` |
| **`tech-learner`** | `skills/tech-learner/` | 第一性原理深度技术学习，追溯技术源头，构建系统化认知脉络 | `深度搞懂 I2C/SPI 底层机制`、`从第一性原理拆解该架构`、`生成体系化学习路线` |

---

### 2. 成冰纪古环境科研套件 (`suites/cryogenian/`)

成冰纪（Cryogenian）“雪球地球”古海洋环境与地球化学研究多 Agent 协同套件，内含 **12** 个专项子技能：

| 模块分类 | 技能名称 | 对应目录 | 职责说明 |
| :--- | :--- | :--- | :--- |
| **调度中枢** | `cryogenian-research-router` | `suites/cryogenian/skills/cryogenian-research-router/` | 科研总控调度，自动分析科研目标并分发给对应专项 Agent |
| **文献与证据** | `cryogenian-paper-reader` | `suites/cryogenian/skills/cryogenian-paper-reader/` | 顶刊（Nature/Science/Geology）地学前沿精读与关键证据提取 |
| | `cryogenian-evidence-scout` | `suites/cryogenian/skills/cryogenian-evidence-scout/` | 交叉线索挖掘，综合碳/氧/铁同位素等多源数据进行互证 |
| **假说与设计** | `cryogenian-hypothesis-lab` | `suites/cryogenian/skills/cryogenian-hypothesis-lab/` | 假说生成实验室，推演古环境突变机制并设计可证伪实验 |
| | `cryogenian-study-design` | `suites/cryogenian/skills/cryogenian-study-design/` | 剖面地层学、野外采样规范与地球化学测试方案设计 |
| **数据与图件** | `cryogenian-data-analysis` | `suites/cryogenian/skills/cryogenian-data-analysis/` | 碳/硫/铁组分地球化学数据分析与古海洋氧化还原状态重建 |
| | `cryogenian-figure` | `suites/cryogenian/skills/cryogenian-figure/` | 顶刊级概念示意图与古地理/古海洋模式图构思指导 |
| **论文与润色** | `cryogenian-writing` | `suites/cryogenian/skills/cryogenian-writing/` | 地学顶刊结构规范撰写（Abstract/Intro/Discussion/Model） |
| | `cryogenian-polishing` | `suites/cryogenian/skills/cryogenian-polishing/` | 地学专业英语词汇润色、学术语气凝练与句式优化 |
| **同行评议** | `cryogenian-reviewer` | `suites/cryogenian/skills/cryogenian-reviewer/` | 模拟高标准同行评审，严苛筛查数据断环与论证漏洞 |
| **领域支撑** | `cryogenian-paleoenvironment` | `suites/cryogenian/skills/cryogenian-paleoenvironment/` | 成冰纪雪球地球与南华纪演化领域先验知识库 |
| | `cryogenian-shared` | `suites/cryogenian/skills/cryogenian-shared/` | 套件公共共享规则、常量与跨技能协同接口 |

---

## 🚀 快速安装与同步

仓库根目录下提供了跨平台的一键安装工具，支持通过**目录联接（Junction / Symlink）**或**文件复制**将技能下发到各个 AI 助手目录中。

### 1. Windows 环境 (PowerShell)

打开 PowerShell 并切换至当前仓库目录：

```powershell
# 预览操作（DryRun，不改动任何实际文件）
.\install.ps1 -DryRun

# 软链接所有技能到 Google Antigravity (~/.gemini/config/skills)
.\install.ps1 -Target antigravity -Mode Symlink

# 软链接到 Claude Code (~/.claude/skills)
.\install.ps1 -Target claude -Mode Symlink

# 软链接到 Codex (~/.codex/skills)
.\install.ps1 -Target codex -Mode Symlink

# 一键安装到所有支持的 AI 助手平台
.\install.ps1 -Target all -Mode Symlink
```

> **提示**：使用 `-Mode Symlink` 安装后，您在 `myskills` 仓库中对提示词或参考文件的任何编辑，都会直接在 AI 助手交互中实时生效，无需重复安装。

### 2. Linux / macOS 环境 (Bash)

```bash
chmod +x install.sh

# 一键软链接所有技能
./install.sh --target all --mode symlink

# 仅安装到指定平台（如 claude）
./install.sh --target claude --mode symlink
```

---

## 📂 仓库全景目录树

```text
myskills/
├── .gitignore                      # 忽略临时缓存、日志与系统文件
├── README.md                       # 仓库全景说明与技能总索引
├── install.ps1                     # Windows PowerShell 自动化安装与软链脚本
├── install.sh                      # Linux / macOS Bash 安装与软链脚本
├── skills/                         # 核心独立技能目录
│   ├── academic-mentor/            # 学术导师
│   │   ├── SKILL.md
│   │   ├── references/             # 论文模板与提示词库
│   │   └── evals/                  # 评测用例
│   ├── android-linux-log-analysis-doc/ # 日志分析
│   │   ├── SKILL.md
│   │   ├── skill_guide_zh.md       # 中文使用指南
│   │   ├── references/             # 内核/HAL/Bootloader 备忘
│   │   └── evals/
│   ├── dlexperiment/               # 深度学习实验 OS
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── templates/              # 实验设计协议与模板
│   ├── tech-doc-writer/            # 技术文档编写指南
│   │   ├── SKILL.md
│   │   └── references/             # 反模式、表达法则与结构决策
│   └── tech-learner/               # 第一性原理技术学习
│       ├── SKILL.md
│       └── test_output/            # 知识拆解产物示例
└── suites/                         # 专项套件目录
    └── cryogenian/                 # 成冰纪古环境科研套件
        ├── README.md               # 套件专属说明书
        ├── install.ps1             # 套件专属安装脚本
        ├── install.sh
        ├── skills.txt
        └── skills/                 # 12 个专项科研子技能
            ├── cryogenian-data-analysis/
            ├── cryogenian-evidence-scout/
            ├── cryogenian-figure/
            ├── cryogenian-hypothesis-lab/
            ├── cryogenian-paleoenvironment/
            ├── cryogenian-paper-reader/
            ├── cryogenian-polishing/
            ├── cryogenian-research-router/
            ├── cryogenian-reviewer/
            ├── cryogenian-shared/
            ├── cryogenian-study-design/
            └── cryogenian-writing/
```

---

## 🛠️ 新建技能扩展规范

如需向本仓库增加新技能，请遵循以下规范：

1. **独立技能**：在 `skills/` 下新建子目录，如 `skills/<skill-name>/`。
2. **必需文件**：
   - `SKILL.md`：根主控文件，包含完整的角色描述、触发时机、输入约束与工作流。
   - `references/`（可选）：长文本知识库、规约表或 API 手册。
   - `evals/`（建议）：包含标准测试 Query 与评测验收标准的 `evals.json`。
3. **添加完成后**：再次运行 `.\install.ps1 -Target all` 即可自动完成各平台的软链接挂载。

---

## 🔗 推送至远端 Git 仓库

如果您在 Gitee 或 GitHub 上新建了远程仓库（如 `myskills`），可执行以下命令完成初次关联与推送：

```bash
# 1. 添加远端仓库（以 Gitee 为例）
git remote add origin git@gitee.com:BlueRocket/myskills.git

# 2. 验证提交分支
git branch -M main

# 3. 推送至远端
git push -u origin main
```

---

## 👤 作者与维护者

- **Author / Maintainer**: [BlueRocket](https://gitee.com/BlueRocket)
- **Commit Identity**: `BlueRocket <BlueRocket@noreply.com>`
- **License**: MIT License
