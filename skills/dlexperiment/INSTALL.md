# Installation

## Install the skill

Copy this repository directory to your Claude skills directory:

```text
C:\Users\<you>\.claude\skills\dlexperiment-skill\
```

Or on Unix-like systems:

```text
~/.claude/skills/dlexperiment-skill/
```

The required skill entrypoint is:

```text
SKILL.md
```

## Install optional slash commands in a project

Copy command templates from:

```text
templates/commands/
```

into your project's:

```text
.claude/commands/
```

Expected result:

```text
<project>/
└── .claude/
    └── commands/
        ├── exp-start.md
        ├── exp-log.md
        ├── exp-analyze.md
        ├── exp-next.md
        ├── exp-wrap.md
        └── exp-auto.md
```

## Smoke test

If you installed only the skill, ask Claude in natural language:

```text
Start a daily deep learning experiment. 目标：测试 dlexperiment-skill 是否能创建实验记录；baseline 当前配置；变量 test flag；指标 image AUROC
```

If you also installed the optional slash command templates, you can use:

```text
/exp-start daily 目标：测试 dlexperiment-skill 是否能创建实验记录；baseline 当前配置；变量 test flag；指标 image AUROC
```

Claude should create or propose a standardized `experiments/exp_YYYYMMDD_NNN_slug/` record and update `experiments/index.md`.
