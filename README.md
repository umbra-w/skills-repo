# MySkills - 统一 AI Agent 技能知识库

<p align="center">
  <strong>个人专属 AI Agent 技能全景仓库（Skills Monorepo）</strong>
  <br />
  涵盖系统级日志诊断、深度学习实验管理、学术论文全流程、集群调度、高效沟通与技术写作
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Core_Skills-12-blue.svg" alt="Core Skills" />
  <img src="https://img.shields.io/badge/Community_Skills-78-purple.svg" alt="Community Skills" />
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
4. **开源生态协同**：内置自研高质量核心技能，并配套维护了 [78+ 社区开源高频技能索引表](COMMUNITY_SKILLS.md)。

---

## 🎯 核心自研技能矩阵与触发指南 (`skills/`)

| 技能名称 | 目录路径 | 核心能力定位 | 典型触发场景 / 常用提示词 |
| :--- | :--- | :--- | :--- |
| **`academic-mentor`** | `skills/academic-mentor/` | 学术导师、顶刊文献精读、开题/实验方案设计、审稿意见预演 | `精读这篇论文`、`学术开题指导`、`模拟审稿人提出修改意见` |
| **`android-linux-log-analysis-doc`** | `skills/android-linux-log-analysis-doc/` | Android/Linux 全栈故障诊断（Kernel/HAL/Bootloader），以证据链为主线输出 Markdown 调查文档 | `分析这段崩溃日志`、`定位休眠唤醒失败问题`、`根据 dmesg 输出排查报告` |
| **`anti-defensive-writing`** | `skills/anti-defensive-writing/` | 学术写作发布会原则，杜绝防御性写作，聚焦优势叙事，不给审稿人递刀子 | `反防御性写作`、`论文修改不自信`、`组织实验叙事`、`回复审稿意见` |
| **`cluster-scheduler`** | `skills/cluster-scheduler/` | SLURM/GPU 集群作业编排与并发管理，Job Array 设计、CPU/内存物理瓶颈约束与运行校验 | `调度集群任务`、`编写 sbatch 脚本`、`设计多卡并行实验矩阵` |
| **`cv-research`** | `skills/cv-research/` | 计算机视觉与 AI 科研端到端指导，命题-证据审计台账、消融基线设计与假说可证伪性检验 | `设计 CVPR/ICCV 实验`、`检验科学假说`、`审计主张证据链` |
| **`daily-paper-generator`** | `skills/daily-paper-generator/` | 每日前沿文献自动化追踪与筛选，支持 arXiv / bioRxiv 双源抓取与高质量中英双语精读简报 | `生成每日学术简报`、`追踪该领域最新 arXiv 论文`、`筛选 Top 3 必读` |
| **`dlexperiment`** | `skills/dlexperiment/` | 深度学习实验管理 OS，涵盖实验设计原则、消融对比、多随机种子聚合与评估模板 | `制定消融实验方案`、`对比模型训练指标`、`生成规范深度学习实验记录` |
| **`expression-skill`** | `skills/expression-skill/` | 结论先行、减法原则与高密度信息交付的高效工程沟通标准，规避假大空套话 | `结论先行汇报`、`提炼执行重点`、`按工程交付标准总结` |
| **`fable-analyze`** | `skills/fable-analyze/` | 外部大模型裁决与战略发散双模式工作流，Evidence Brief 收集与成本红线管理 | `需要外部裁决方案`、`发散创新架构定位`、`Fable 深度分析` |
| **`latex-conference-template-organizer`** | `skills/latex-conference-template-organizer/` | 顶级学术会议 LaTeX 模板自动化解压与重构，生成 Overleaf 规范结构与匿名提交配置 | `整理会议 LaTeX 模板`、`生成 Overleaf 工程`、`配置 KDD/CVPR 匿名提交` |
| **`tech-doc-writer`** | `skills/tech-doc-writer/` | 顶尖技术文档架构指南，规范逻辑结构、严谨技术表达、反模式排查与图表选型 | `编写系统架构设计文档`、`重构技术方案`、`检查文档逻辑漏洞与反模式` |
| **`tech-learner`** | `skills/tech-learner/` | 第一性原理深度技术学习，追溯技术源头，构建系统化认知脉络 | `深度搞懂 I2C/SPI 底层机制`、`从第一性原理拆解该架构`、`生成体系化学习路线` |

---

## 🌐 常用外部与社区开源技能清单

除了自研核心技能外，为了方便日常跨环境复用与溯源，仓库整理了配套的开源技能导航：

👉 **[点击查阅完整的 78+ 常用外部开源技能清单 (COMMUNITY_SKILLS.md)](COMMUNITY_SKILLS.md)**

涵盖四大学用领域：
- **学术科研与论文写作**：`nature-skills`、`CCFA-Skills`、`sci-skill`、`research-gap-finder`、`paper-writer` 等
- **知识管理与文献双链**：`obsidian-skills`、`zotero-obsidian-bridge`、`defuddle` 等
- **编程工程与智能体开发**：`superpowers`、`ui-ux-pro-max`、`uv-package-manager`、`forkprobe` 等
- **日常效率与内容润色**：`grill-me`、`humanizer`、`writing-anti-ai`、`ppt-master` 等

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
├── README.md                       # 仓库全景说明与自研技能总索引
├── COMMUNITY_SKILLS.md             # 78+ 常用社区/外部开源技能导航表
├── install.ps1                     # Windows PowerShell 自动化安装与软链脚本
├── install.sh                      # Linux / macOS Bash 安装与软链脚本
├── skills/                         # 12 个核心自研/深度定制技能目录
│   ├── academic-mentor/            # 学术导师与论文研读
│   ├── android-linux-log-analysis-doc/ # 系统日志诊断
│   ├── anti-defensive-writing/     # 反防御性学术写作原则
│   ├── cluster-scheduler/          # SLURM/GPU 集群编排与调度
│   ├── cv-research/                # CV/AI 科研审计与实验设计
│   ├── daily-paper-generator/      # arXiv/bioRxiv 文献追踪生成器
│   ├── dlexperiment/               # 深度学习实验 OS
│   ├── expression-skill/           # 结论先行高效工程沟通
│   ├── fable-analyze/              # 战略发散与外部模型裁决
│   ├── latex-conference-template-organizer/ # 会议 LaTeX 模板整理器
│   ├── tech-doc-writer/            # 技术文档编写指南
│   └── tech-learner/               # 第一性原理技术学习
└── suites/                         # 专项套件目录
    └── cryogenian/                 # 专项研究套件
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

## 👤 作者与维护者

- **Author / Maintainer**: [BlueRocket](https://github.com/umbra-w)
- **Commit Identity**: `BlueRocket <BlueRocket@noreply.com>`
- **License**: MIT License
