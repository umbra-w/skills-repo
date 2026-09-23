# MySkills - 统一 AI Agent 技能知识库

欢迎使用 **MySkills**，这是由 **BlueRocket** 构建和维护的个人 AI Agent 技能仓库（Skills Monorepo）。

本仓库采用统一规范，将分散的独立技能与科研套件统一收拢与版本化，支持快速一键安装、软链接至 **Google Antigravity**、**Claude Code** 以及 **OpenAI Codex** 等主流 AI 编程助手环境。

---

## 目录索引

- [技能目录总览](#技能目录总览)
  - [1. 核心独立技能 (skills/)](#1-核心独立技能-skills)
  - [2. 成冰纪古环境科研套件 (suites/cryogenian/)](#2-成冰纪古环境科研套件-suitescryogenian)
- [快速安装与同步](#快速安装与同步)
  - [Windows 环境 (PowerShell)](#windows-环境-powershell)
  - [Linux / macOS 环境 (Bash)](#linux--macos-环境-bash)
- [目录结构说明](#目录结构说明)
- [版本控制与提交规范](#版本控制与提交规范)

---

## 技能目录总览

### 1. 核心独立技能 (`skills/`)

| 技能名称 | 目录路径 | 定位与核心功能 | 产物/特性 |
| :--- | :--- | :--- | :--- |
| **`academic-mentor`** | `skills/academic-mentor/` | 学术导师、文献精读、开题与实验设计指导、顶刊审稿预演 | 包含 `references/`、`evals/` 与提示词模板 |
| **`android-linux-log-analysis-doc`** | `skills/android-linux-log-analysis-doc/` | Android 与 Linux 故障诊断与日志分析，以证据链为主线 | 输出规范 Markdown 工程调查文档，支持 Kernel/HAL/Bootloader |
| **`dlexperiment`** | `skills/dlexperiment/` | 深度学习实验管理 OS，涵盖实验设计原则与消融对比 | 包含种子聚合、实验矩阵、评估模板与自动化协议 |
| **`tech-doc-writer`** | `skills/tech-doc-writer/` | 技术文档架构指南，注重逻辑结构、表达严谨与反模式规避 | 包含图表选型、架构决策、质量门禁等参考库 |
| **`tech-learner`** | `skills/tech-learner/` | 技术知识第一性原理拆解、深度消化与系统化技术学习 | 包含学习指南范例、知识溯源与渐进式理解体系 |

---

### 2. 成冰纪古环境科研套件 (`suites/cryogenian/`)

成冰纪（Cryogenian）“雪球地球”古海洋与地球化学研究多 Agent 协同套件，内含 **12** 个专项技能：

| 模块类别 | 技能名称 | 目录路径 | 核心能力说明 |
| :--- | :--- | :--- | :--- |
| **总控路由** | `cryogenian-research-router` | `suites/cryogenian/skills/cryogenian-research-router/` | 科研任务调度中枢，自动分发任务至各专项 Agent |
| **文献与证据** | `cryogenian-paper-reader` | `suites/cryogenian/skills/cryogenian-paper-reader/` | 地学前沿文献精读、关键数据与假说提炼 |
| | `cryogenian-evidence-scout` | `suites/cryogenian/skills/cryogenian-evidence-scout/` | 交叉地学证据线索挖掘与多源数据相互验证 |
| **假设与设计** | `cryogenian-hypothesis-lab` | `suites/cryogenian/skills/cryogenian-hypothesis-lab/` | 科学假说生成、逻辑推演与可证伪性检验 |
| | `cryogenian-study-design` | `suites/cryogenian/skills/cryogenian-study-design/` | 采样方案设计、剖面地层学及地球化学测试设计 |
| **数据与图件** | `cryogenian-data-analysis` | `suites/cryogenian/skills/cryogenian-data-analysis/` | 碳/氧/硫/铁同位素等古环境数据统计与建模 |
| | `cryogenian-figure` | `suites/cryogenian/skills/cryogenian-figure/` | 顶刊规范科学插图概念设计（古地理、演化模式图） |
| **论文撰写** | `cryogenian-writing` | `suites/cryogenian/skills/cryogenian-writing/` | Nature / Science / Geology 级别期刊结构撰写 |
| | `cryogenian-polishing` | `suites/cryogenian/skills/cryogenian-polishing/` | 学术英语修辞润色、地学专业术语精修 |
| **同行评议** | `cryogenian-reviewer` | `suites/cryogenian/skills/cryogenian-reviewer/` | 模拟严格审稿人，挑剔数据漏洞与逻辑断环 |
| **领域支撑** | `cryogenian-paleoenvironment` | `suites/cryogenian/skills/cryogenian-paleoenvironment/` | 成冰纪雪球地球重大环境突变专项领域知识库 |
| | `cryogenian-shared` | `suites/cryogenian/skills/cryogenian-shared/` | 套件通用公用规则、规范与跨技能共享逻辑 |

---

## 快速安装与同步

### Windows 环境 (PowerShell)

在当前仓库根目录下以管理员权限或开发者模式运行 `install.ps1`：

```powershell
# 1. 查看帮助
.\install.ps1 -Help

# 2. 软链接所有技能到 Google Antigravity (推荐，仓库中修改实时生效)
.\install.ps1 -Target antigravity -Mode Symlink

# 3. 安装到 Claude Code
.\install.ps1 -Target claude -Mode Symlink

# 4. 安装到 Codex
.\install.ps1 -Target codex -Mode Symlink

# 5. 一键安装到全部支持的 AI 助手
.\install.ps1 -Target all -Mode Symlink
```

### Linux / macOS 环境 (Bash)

```bash
chmod +x install.sh
./install.sh --target all --mode symlink
```

---

## 目录结构说明

```text
myskills/
├── .gitignore                      # 忽略临时文件与日志
├── README.md                       # 仓库汇总索引与使用文档
├── install.ps1                     # Windows PowerShell 安装与软链工具
├── install.sh                      # Linux/macOS Shell 安装与软链工具
├── skills/                         # 独立技能集合
│   ├── academic-mentor/            # 学术导师
│   ├── android-linux-log-analysis-doc/ # 日志分析
│   ├── dlexperiment/               # 深度学习实验 OS
│   ├── tech-doc-writer/            # 技术文档规范
│   └── tech-learner/               # 技术学习精进
└── suites/                         # 专项技能套件集合
    └── cryogenian/                 # 成冰纪古环境综合科研套件
        ├── README.md
        ├── install.ps1
        ├── install.sh
        ├── skills.txt
        └── skills/                 # 12 个成冰纪专项子技能
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

## 版本控制与提交规范

本仓库已全局统一配置 Git 提交者身份：
- **User**: `BlueRocket`
- **Email**: `BlueRocket@noreply.com`

所有新增或修改技能均遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范：
- `feat(skills)`: 新增或升级独立技能
- `feat(suites)`: 新增或调整套件技能
- `docs`: 文档或索引更新
- `fix`: 提示词/工作流 Bug 修复
