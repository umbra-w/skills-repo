# MySkills - 统一 AI Agent 技能知识库

<p align="center">
  <strong>个人专属 AI Agent 技能全景仓库（Skills Monorepo）</strong>
  <br />
  涵盖系统级底层诊断、深度学习实验管理、学术论文全流程、集群调度、政务公文、演示设计与工程交付
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Core_Skills-25-blue.svg" alt="Core Skills" />
  <img src="https://img.shields.io/badge/Research_Suite-12_Skills-teal.svg" alt="Research Suite" />
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
4. **开源生态协同**：内置 25+ 自研核心技能与专项科研套件，并配套维护了 [78+ 社区开源高频技能索引表](COMMUNITY_SKILLS.md)。

---

## 🎯 核心自研技能矩阵与触发指南 (`skills/`)

| 技能名称 | 目录路径 | 核心能力定位 | 典型触发场景 / 常用提示词 |
| :--- | :--- | :--- | :--- |
| **`academic-mentor`** | `skills/academic-mentor/` | 学术导师、顶刊文献精读、开题/实验方案设计、审稿意见预演 | `精读这篇论文`、`学术开题指导`、`模拟审稿人提出修改意见` |
| **`android-linux-log-analysis-doc`** | `skills/android-linux-log-analysis-doc/` | Android/Linux 全栈故障诊断（Kernel/HAL/Bootloader），以证据链为主线输出 Markdown 调查文档 | `分析这段崩溃日志`、`定位休眠唤醒失败问题`、`根据 dmesg 输出排查报告` |
| **`android-split-build-debug`** | `skills/android-split-build-debug/` | Android 模块化编译与 target_files 拆分合并排查，分析 target_files 依赖、lunch 配置与 ninja 构建报错 | `排查 target_files 拆分报错`、`分析 split build 缺失依赖`、`定位 Android 模块合并问题` |
| **`anti-defensive-writing`** | `skills/anti-defensive-writing/` | 学术写作发布会原则，杜绝防御性写作，聚焦优势叙事，不给审稿人递刀子 | `反防御性写作`、`论文修改不自信`、`组织实验叙事`、`回复审稿意见` |
| **`cluster-scheduler`** | `skills/cluster-scheduler/` | SLURM/GPU 集群作业编排与并发管理，Job Array 设计、CPU/内存物理瓶颈约束与运行校验 | `调度集群任务`、`编写 sbatch 脚本`、`设计多卡并行实验矩阵` |
| **`codex-ppt`** | `skills/codex-ppt/` | 基于 python-pptx 的图像化 PPTX 自动生成，精准网格定位与精美图文排版 | `制作一组精美幻灯片`、`自动生成技术方案 PPT`、`按结构化内容排版 PPTX` |
| **`concise-root-cause`** | `skills/concise-root-cause/` | 精准短小、证据优先的报错根因分析，杜绝冗长推测废话，直击首个直接报错点与修复命令 | `快速排查报错`、`精准定位 crash 根因`、`简明输出修复命令` |
| **`cv-research`** | `skills/cv-research/` | 计算机视觉与 AI 科研端到端指导，命题-证据审计台账、消融基线设计与假说可证伪性检验 | `设计 CVPR/ICCV 实验`、`检验科学假说`、`审计主张证据链` |
| **`daily-paper-generator`** | `skills/daily-paper-generator/` | 每日前沿文献自动化追踪与筛选，支持 arXiv / bioRxiv 双源抓取与高质量中英双语精读简报 | `生成每日学术简报`、`追踪该领域最新 arXiv 论文`、`筛选 Top 3 必读` |
| **`dlexperiment`** | `skills/dlexperiment/` | 深度学习实验管理 OS，涵盖实验设计原则、消融对比、多随机种子聚合与评估模板 | `制定消融实验方案`、`对比模型训练指标`、`生成规范深度学习实验记录` |
| **`drawio-diagram`** | `skills/drawio-diagram/` | 自然语言绘制可编辑 Draw.io XML 架构图/时序图，生成标准合法 XML 图元与布局 | `画一个系统架构图`、`生成 draw.io 流程图 XML`、`绘制业务时序交互图` |
| **`driver-analysis-doc`** | `skills/driver-analysis-doc/` | Linux/Android/MTK 驱动日志分析与 Bringup 诊断（Sensor/Touch/Camera/Audio/PMIC） | `分析驱动探针报错`、`排查 Sensor/I2C 通信失败`、`编写 Bringup 诊断报告` |
| **`expression-skill`** | `skills/expression-skill/` | 结论先行、减法原则与高密度信息交付的高效工程沟通标准，规避假大空套话 | `结论先行汇报`、`提炼执行重点`、`按工程交付标准总结` |
| **`fable-analyze`** | `skills/fable-analyze/` | 外部大模型裁决与战略发散双模式工作流，Evidence Brief 收集与成本红线管理 | `需要外部裁决方案`、`发散创新架构定位`、`Fable 深度分析` |
| **`gpt-image-2`** | `skills/gpt-image-2/` | GPT Image / DALL-E 3 高阶提示词工程与出图工作流，光影/质感/艺术风格精细控制 | `生成 DALL-E 提示词`、`优化生图描述`、`按特定艺术风格构图出图` |
| **`humanizer-zh`** | `skills/humanizer-zh/` | 中文文本去 AI 味与自然表达润色，打破死板排比、句式倒装与翻译腔，回归真实人话 | `去 AI 味`、`重写这段话让人读着自然`、`消除翻译腔与死板公文化` |
| **`kernel-module-triage`** | `skills/kernel-module-triage/` | Linux 内核模块 ko 编译配置、Kconfig/Makefile 依赖与打包加载故障排查 | `排查 ko 模块编译失败`、`修复 Unknown symbol 符号缺失`、`配置 Kconfig 依赖` |
| **`latex-conference-template-organizer`** | `skills/latex-conference-template-organizer/` | 顶级学术会议 LaTeX 模板自动化解压与重构，生成 Overleaf 规范结构与匿名提交配置 | `整理会议 LaTeX 模板`、`生成 Overleaf 工程`、`配置 KDD/CVPR 匿名提交` |
| **`marp-slides`** | `skills/marp-slides/` | MARP Markdown 演示文稿制作，原生 Markdown 语法编写高质量幻灯片与定制 CSS 样式 | `制作 Marp 幻灯片`、`用 Markdown 写演示文档`、`调整 Marp 主题样式` |
| **`official-document-skill`** | `skills/official-document-skill/` | 党政公文、申论、人民日报风格政务文书写作与去 AI 味（通知/请示/报告/批复/调研报告） | `拟写一份正式通知`、`起草调研报告`、`按人民日报风格润色政务材料` |
| **`openmaic`** | `skills/openmaic/` | OpenMAIC 多智能体互动课堂开发与部署，课件交互逻辑、角色配置与前端展示协同 | `开发 OpenMAIC 课堂互动模块`、`配置多角色互动逻辑`、`部署教学智能体` |
| **`presentation-skill`** | `skills/presentation-skill/` | Codex 结构化 PPTX 设计与版面校验，规范排版网格、高阶配色与信息层次结构 | `规范 PPTX 版面网格`、`校验幻灯片视觉层次`、`优化演示文稿专业度` |
| **`software-copyright-materials`** | `skills/software-copyright-materials/` | 软件著作权申请材料全自动提取与生成（前后各30页源代码规范提取、用户操作手册、设计说明书） | `提取软著申请源代码`、`自动生成软著用户手册`、`整理软著申报整套材料` |
| **`tech-doc-writer`** | `skills/tech-doc-writer/` | 顶尖技术文档架构指南，规范逻辑结构、严谨技术表达、反模式排查与图表选型 | `编写系统架构设计文档`、`重构技术方案`、`检查文档逻辑漏洞与反模式` |
| **`tech-learner`** | `skills/tech-learner/` | 第一性原理深度技术学习，追溯技术源头，构建系统化认知脉络 | `深度搞懂 I2C/SPI 底层机制`、`从第一性原理拆解该架构`、`生成体系化学习路线` |

---

## 🔬 专项科研套件：成冰纪 (`skills/cryogenian/`)

成冰纪（Cryogenian）是一套专为地球科学、古生物学、古环境及相关硬核科学研究打造的模块化智能体研究套件。套件目录位于 `skills/cryogenian/`，内含 12 个专项科研子技能：

| 子技能名称 | 目录路径 | 核心能力定位 |
| :--- | :--- | :--- |
| **`cryogenian-hypothesis-lab`** | `skills/cryogenian/skills/cryogenian-hypothesis-lab/` | 科学假说可证伪性检验、多重假说竞争设计与判决性证据推导 |
| **`cryogenian-evidence-scout`** | `skills/cryogenian/skills/cryogenian-evidence-scout/` | 地层学、地球化学（同位素/微量元素）等关键多源判决性证据深度挖掘 |
| **`cryogenian-reviewer`** | `skills/cryogenian/skills/cryogenian-reviewer/` | 模拟顶刊（Nature/Science/EPSL/GCA）苛刻审稿专家进行批判性盲审 |
| **`cryogenian-study-design`** | `skills/cryogenian/skills/cryogenian-study-design/` | 野外露头采样方案、测试分析方法（LA-ICP-MS/SIMS）与技术路线设计 |
| **`cryogenian-paper-reader`** | `skills/cryogenian/skills/cryogenian-paper-reader/` | 地学深水区重磅文献批判性精读，剖析其主张、证据链与潜在漏洞 |
| **`cryogenian-paleoenvironment`** | `skills/cryogenian/skills/cryogenian-paleoenvironment/` | 冰期、氧化还原状态、海水化学演变等古海洋古气候环境定量重建 |
| **`cryogenian-data-analysis`** | `skills/cryogenian/skills/cryogenian-data-analysis/` | 同位素体系校正、年代学统计（U-Pb/Re-Os）、主微量化学数据降维分析 |
| **`cryogenian-figure`** | `skills/cryogenian/skills/cryogenian-figure/` | 顶刊级地层综合柱状图、剖面对比图、相图与构造演化模式图构思与脚本 |
| **`cryogenian-polishing`** | `skills/cryogenian/skills/cryogenian-polishing/` | 学术地学英语深度润色，地学专业术语规范与句式紧凑度打磨 |
| **`cryogenian-writing`** | `skills/cryogenian/skills/cryogenian-writing/` | 地质学严谨学术论文撰写，引言、地质背景、分析方法与讨论逻辑编排 |
| **`cryogenian-research-router`** | `skills/cryogenian/skills/cryogenian-research-router/` | 科研任务意图路由与调度中心，智能分发至对应的成冰纪专项技能 |
| **`cryogenian-shared`** | `skills/cryogenian/skills/cryogenian-shared/` | 成冰纪套件共享公用规则库、标准缩写、单位换算与格式标准 |

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

# 一键安装到所有支持的 AI 助手平台（共 37 个技能自动识别并部署）
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
├── install.ps1                     # Windows PowerShell 自动化安装与软链脚本 (Junction)
├── install.sh                      # Linux / macOS Bash 安装与软链脚本 (Symlink)
└── skills/                         # 技能总目录（25 个独立核心技能 + 1 个专项科研套件）
    ├── academic-mentor/            # 学术导师与论文研读
    ├── android-linux-log-analysis-doc/ # 系统级日志排查与 Markdown 诊断文档生成
    ├── android-split-build-debug/  # Android target_files 拆分合并与模块化构建排查
    ├── anti-defensive-writing/     # 反防御性学术写作原则与优势叙事
    ├── cluster-scheduler/          # SLURM/GPU 集群编排与调度
    ├── codex-ppt/                  # 基于 python-pptx 的图像化 PPT 自动生成
    ├── concise-root-cause/         # 精准短小、证据优先的报错根因分析
    ├── cv-research/                # CV/AI 科研审计与实验设计
    ├── daily-paper-generator/      # arXiv/bioRxiv 文献追踪生成器
    ├── dlexperiment/               # 深度学习实验 OS
    ├── drawio-diagram/             # 自然语言生成可编辑 Draw.io XML 图表
    ├── driver-analysis-doc/        # Linux/Android/MTK 驱动日志与 Bringup 故障诊断
    ├── expression-skill/           # 结论先行高效工程沟通
    ├── fable-analyze/              # 战略发散与外部模型裁决
    ├── gpt-image-2/                # GPT Image / DALL-E 3 提示词工程与出图工作流
    ├── humanizer-zh/               # 中文文本去 AI 味与自然表达润色
    ├── kernel-module-triage/       # Linux 内核模块 ko 编译与依赖排查
    ├── latex-conference-template-organizer/ # 会议 LaTeX 模板整理器
    ├── marp-slides/                # MARP Markdown 演示文稿制作
    ├── official-document-skill/    # 党政公文、申论、人民日报风格政务文书写作与去 AI 味
    ├── openmaic/                   # OpenMAIC 多智能体互动课堂开发与部署
    ├── presentation-skill/         # Codex 结构化 PPTX 设计与版面校验
    ├── software-copyright-materials/ # 软著申请材料全自动提取与生成
    ├── tech-doc-writer/            # 技术文档编写指南
    ├── tech-learner/               # 第一性原理技术学习
    └── cryogenian/                 # 成冰纪科研专项套件
        ├── suite-manifest.json     # 套件清单描述
        ├── install.ps1 / install.sh# 套件专属安装脚本
        └── skills/                 # 套件内 12 个科研子技能目录
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
