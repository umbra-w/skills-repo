# `android-linux-log-analysis-doc` Skill 详细说明

## 1. 这份文档是做什么的

这份文档面向两类人：

- 想直接使用 `android-linux-log-analysis-doc` 这个 skill 的使用者
- 想维护、扩展、评估这个 skill 的开发者或提示词工程维护者

它会解释：

1. 这个 skill 的目录构成和每个文件的职责
2. 这个 skill 的设计目标与适用边界
3. 在实际对话里，怎样“调用”它、怎样“触发”它
4. 它接到任务后，内部会按什么步骤工作
5. 它最终会生成什么样的产物，以及应该如何解读
6. 适合它的典型使用用例、反例、输入模板和注意事项

---

## 2. Skill 目录构成

当前目录结构如下：

```text
android-linux-log-analysis-doc/
├─ SKILL.md
├─ references/
│  └─ modes.md
└─ evals/
   └─ evals.json
```

对应路径：

- 技能根目录：`C:\Users\admin\.claude\skills\android-linux-log-analysis-doc`
- 主技能文件：`C:\Users\admin\.claude\skills\android-linux-log-analysis-doc\SKILL.md`
- 参考文件：`C:\Users\admin\.claude\skills\android-linux-log-analysis-doc\references\modes.md`
- 评测文件：`C:\Users\admin\.claude\skills\android-linux-log-analysis-doc\evals\evals.json`

### 2.1 `SKILL.md` 的职责

`SKILL.md` 是这个 skill 的主体。它定义了：

- skill 名称：`android-linux-log-analysis-doc`
- skill 描述：何时应该触发、适合处理哪些问题
- 核心分析原则：`evidence-first diagnosis`
- 输入类型：日志、源码路径、差分、配置、压缩包、大目录等
- 输出目标：最终生成一份 Markdown 风格分析文档
- 分析工作流：先宽扫，再收敛；先做日志清点，再做时间线关联
- 写作风格：像工程调查笔记，而不是僵硬的填表式 RCA

可以把 `SKILL.md` 理解成这个 skill 的“作战手册”。

### 2.2 `references/modes.md` 的职责

这个文件很小，本质上是一个模式备忘：

- `app-log`
- `kernel-log`
- `bootloader-log`

它的作用不是提供完整规则，而是作为快速提醒：

- `app-log`：framework、HAL、service、userspace
- `kernel-log`：kernel、driver、module、PM、packaging
- `bootloader-log`：LK、U-Boot、preloader、handoff

也就是说，真正的完整规则在 `SKILL.md`，`modes.md` 只是轻量补充。

### 2.3 `evals/evals.json` 的职责

这个文件定义了 skill 的评测样例，当前包含 3 个 eval：

1. Android app/framework/HAL 服务反复崩溃重启
2. dmesg + 驱动源码路径分析 suspend/resume 后 USB reset 枚举
3. LK/U-Boot 串口日志分析 bootloader 到 kernel 之前的黑屏问题

这 3 个样例说明了 skill 的覆盖面：

- 应用/框架层
- 内核/驱动层
- Bootloader/早期启动层

也说明 skill 的预期输出不是一句话结论，而是“可读的工程分析文档”。

---

## 3. 这个 Skill 的核心定位

一句话总结：

**这是一个以日志为中心、以证据链为主线、最终输出 Markdown 分析文档的 Android/Linux 故障诊断 skill。**

它不是泛泛的“技术问答 skill”，而是偏工程调查类。

### 3.1 它最适合的问题

当任务主要是下面这些时，它最适合：

- 读日志
- 关联日志与源码路径
- 从运行时证据中判断根因
- 写 RCA、技术分析笔记、故障调查文档

典型日志类型包括：

- Android `logcat`
- `syslog`
- `journalctl`
- framework/HAL/service 日志
- `dmesg`
- `kmsg`
- `last_kmsg`
- panic/oops/call trace
- suspend/resume
- probe/reset/IRQ
- LK/U-Boot/preloader 串口日志

### 3.2 它不是最适合的问题

以下场景不应该优先用它：

- 纯代码 walkthrough，没有真实故障证据
- 单纯解释某个 driver/API 架构
- 纯 checklist 式 bringup 建议，没有具体日志

如果是混合场景：

- 有日志
- 也有源码/配置/差分

那应该仍然优先把这个 skill 当主 skill，因为它是“日志为主、代码为辅”的模式。

---

## 4. 这个 Skill 的设计哲学

这个 skill 的核心不是“猜”，而是“从证据收敛”。

它的设计哲学可以概括成 6 个词：

- 先宽扫
- 再收敛
- 分层看
- 建时间线
- 分清事实与推断
- 输出可执行结论

### 4.1 Evidence-first

它强调：

- 先找第一条用户可见症状
- 再找第一条不会自行恢复的异常
- 再判断哪一层给出了决定性证据

这避免了常见错误：

- 一上来就锁死在 framework 层
- 一上来就把所有问题都归咎于 kernel
- 只读一份日志，不做跨日志关联

### 4.2 Cross-layer

它鼓励跨层诊断，而不是强行把问题塞进单层结论。

例如：

- 用户在 UI 层看到“相机打不开”
- 决定性证据在 kernel IOMMU fault
- framework 只是把失败向上传播

这种情况下，skill 会把：

- `Symptom layer` 标成 `app-log`
- `Cause layer` 标成 `kernel-log`

这正是它和普通“日志总结器”的差异。

### 4.3 Engineering note，而不是八股模板

它要求最终文档像“高级工程师的调查笔记”：

- 可读
- 顺着证据走
- 不强制九宫格 RCA
- 不机械套模板

所以它的输出通常是自然分段的 Markdown 文档，而不是固定表单。

---

## 5. 它在系统里是怎么被调用的

这里要区分两个概念：

1. `调用`
2. `触发`

### 5.1 什么叫“调用”

调用，指的是你在提示词中明确要求 agent 使用这个 skill。

最直接的方式是：

```text
使用 android-linux-log-analysis-doc 这个 skill 分析这份日志
```

或者：

```text
用 C:\Users\admin\.claude\skills\android-linux-log-analysis-doc 这个 skill 看一下这个 dmesg
```

或者更完整一点：

```text
使用 android-linux-log-analysis-doc 分析 C:\logs\bugreport 目录，
结合 D:\kernel\drivers\usb\musb 源码，
最后输出一份 Markdown 分析文档。
```

这种写法属于强制显式调用。

### 5.2 什么叫“触发”

触发，指的是即使你不明确写“用这个 skill”，但你的任务语义高度匹配它，agent 也应该优先选择它。

比如你说：

```text
帮我看一下这份 logcat，某个 vendor HAL 服务一直挂掉重启。
我还给你了 manifest、init rc 和源码路径，写份分析文档。
```

或者：

```text
分析这个 dmesg，USB 在 suspend/resume 后反复 reset，结合驱动代码一起看。
```

或者：

```text
这是 LK/U-Boot 串口日志，设备黑屏卡在 kernel 之前，整理一份 RCA。
```

这些都属于自然语义触发。

---

## 6. 这个 Skill 的典型触发条件

### 6.1 强触发条件

满足以下任一类，几乎都应该触发：

- 用户明确点名 skill 名称
- 用户给了日志并要求分析/定位/写 RCA
- 用户给了日志 + 源码路径
- 用户给了大日志目录或压缩包
- 用户要求输出分析报告、技术笔记、Markdown 文档

### 6.2 常见触发话术

下面这些中文表达都容易触发：

- “帮我看下这份 log”
- “分析一下这个 dmesg”
- “看看串口 log”
- “结合这几个代码路径一起定位”
- “整理成分析文档”
- “写一份 RCA”
- “把这个 bugreport 目录看一下”

### 6.3 不太应该触发的场景

下面这些更像别的 skill 或普通回答：

- “解释一下 MUSB 驱动架构”
- “介绍一下 Android suspend/resume 流程”
- “给我一份 bringup checklist”
- “单纯看这几个源码文件在干什么”

如果没有故障证据，这个 skill 就不该作为主技能。

---

## 7. 正确的调用方式

### 7.1 最小可用输入

最少只要有：

- 一份日志
- 一个用户症状

就能工作。

例如：

```text
使用 android-linux-log-analysis-doc 分析 C:\logs\main.log，
现象是系统里某个 HAL 服务反复重启，帮我写成 Markdown。
```

### 7.2 推荐输入

如果想让输出质量更高，建议尽量给：

1. 日志路径
2. 现象描述
3. 失败时间范围
4. 是否有源码路径
5. 是否有配置/差分/manifest/init rc
6. 希望的输出形式

推荐模板：

```text
使用 android-linux-log-analysis-doc 分析：

- 日志路径：C:\logs\bugreport
- 现象：USB 唤醒后失效
- 时间窗口：大概 11:11 左右
- 源码路径：D:\kernel\drivers\usb\musb
- 输出要求：生成一份中文 Markdown 分析文档
```

### 7.3 大日志目录的推荐写法

```text
使用 android-linux-log-analysis-doc 分析这个目录：
C:\Users\admin\Desktop\debug\debuglogge

不要全量硬读，先盘点目录，再找异常窗口。
结合 D:\workspace\Android16\kernel 源码一起看。
最后在原目录下生成一份 Markdown 报告。
```

这类提示语非常契合这个 skill 的设计方式。

---

## 8. 触发后，它内部会怎么工作

可以把这个 skill 的工作流分成 8 个阶段。

### 阶段 1：先宽扫，不先入为主

它会先问自己 4 个问题：

1. 第一条用户可见症状是什么？
2. 第一条不可自恢复的异常是什么？
3. 决定性证据第一次出现在哪一层？
4. 哪些层只是把症状继续往上传？

这是整个 skill 的“定调阶段”。

### 阶段 2：确定当前 Working focus

它会在文档最上面给出焦点标签，例如：

```text
Working focus: kernel-log
```

或者：

```text
Working focus: cross-layer
Symptom layer: app-log
Cause layer: kernel-log
```

这不是装饰，而是文档阅读的导航条。

### 阶段 3：如果日志很大，先做 inventory

对于大目录、大文件、压缩包，它不会直接从头读到尾。

它会先清点：

- 有哪些文件
- 哪些文件最大
- 哪些文件名最相关
- 时间戳和故障时间是否对得上

这一步是它区别于“暴力读日志”的关键。

### 阶段 4：先切窗，再精读

在找到候选窗口前，它通常会先做关键词切片，例如：

- `panic`
- `suspend`
- `resume`
- `reset`
- `avc: denied`
- `binder`
- `tombstone`
- `probe`

然后只读：

- 候选窗口
- 前后少量上下文

而不是整份日志全量展开。

### 阶段 5：多日志共用一条时间线

如果目录里有：

- `main_log`
- `events_log`
- `sys_log`
- `radio_log`
- `kernel_log`

它会尽量把它们对齐到一条时间线，而不是每份日志各写一段。

这能避免最常见的误判：

- framework 看到的是结果
- kernel 里的早期异常才是真正的起点

### 阶段 6：如果给了源码，就做 log -> code 映射

如果用户还提供了：

- 源码路径
- 差分
- Kconfig/defconfig
- manifest/init rc

这个 skill 会尝试把关键日志线对应到：

- 具体函数
- 状态变量
- 路径分支
- 构建链路

这一步是从“看日志”升级到“做分析”的关键。

### 阶段 7：把事实、推断、结论分开

这个 skill 的输出不应该是：

- “应该是 XXX”
- “大概率是 YYY”
- “估计就是这个”

它更鼓励：

- 已证实的事实
- 基于事实的解释
- 尚未证实但高概率的推断

这能大幅减少“说得很满，但证据不够”的问题。

### 阶段 8：写成 Markdown 交付物

最后输出不是原始笔记碎片，而是一份适合阅读、转发、存档的 Markdown 分析文档。

---

## 9. 这个 Skill 的 4 种工作焦点

### 9.1 `Working focus: app-log`

适用情况：

- 决定性证据主要在 logcat、framework、HAL、service、init

重点看：

- crash loop
- service registration failure
- binder/property/socket/SELinux
- manifest/init rc/vintf 不匹配
- framework 到 HAL 的交接失败

### 9.2 `Working focus: kernel-log`

适用情况：

- 决定性证据在 dmesg、kmsg、panic、driver、IRQ、PM、probe、module

重点看：

- panic/oops/call trace
- suspend/resume
- reset/re-enumeration
- module built but not loaded
- packaging or metadata mismatch

### 9.3 `Working focus: bootloader-log`

适用情况：

- 决定性证据在 preloader、LK、U-Boot、ATF、BL31 等早期日志

重点看：

- earliest stage that still works
- first stage that stops
- DDR
- storage/image load
- pmic/clock/power
- dtb/dtbo/bootargs/handoff

### 9.4 `Working focus: cross-layer`

适用情况：

- 用户看见的问题和真正根因不在同一层

这是本 skill 最有价值的模式之一。

例如：

- UI 提示“相机不可用”，根因在 kernel sensor reset
- framework 提示“USB 掉线”，根因在 MUSB suspend/resume 状态机
- Java service 崩溃，根因在 native/HAL 初始化失败

---

## 10. 它会生成什么产物

### 10.1 主产物

主产物始终应该是一份 Markdown 风格分析文档。

它可以：

- 直接在对话里输出
- 也可以落盘成 `.md` 文件

这是 `SKILL.md` 明确规定的最终交付形式。

### 10.2 产物的典型结构

虽然这个 skill 不强制 rigid template，但稳定结构通常包含：

1. 标题
2. `Working focus`
3. 背景/现象
4. 时间线
5. 关键证据
6. 代码/配置路径映射
7. 根因判断
8. 修复方向
9. 验证建议

### 10.3 文档顶部的元信息

最常见的是：

```text
Working focus: cross-layer
Symptom layer: app-log
Cause layer: kernel-log
Supporting layers: bootloader-log
```

这些字段的作用：

- `Working focus`：当前主分析视角
- `Symptom layer`：用户最先感知到问题的层
- `Cause layer`：真正决定性证据所在层
- `Supporting layers`：补充上下文的层

### 10.4 文档语气和风格

这个 skill 生成的文档应当：

- 可读
- 工程味强
- 证据链清晰
- 不是纯结论堆砌
- 不是模板化套话

更像：

- 一份高级工程师写的故障调查笔记

而不是：

- 一份流水账式“日志摘要”

---

## 11. 如何解读它生成的产物

### 11.1 先看 `Working focus`

这决定了文档主视角。

例如：

- `app-log`：多半要先看 framework/service 证据
- `kernel-log`：多半根因已经落到 driver/PM/IRQ
- `cross-layer`：一定要警惕“表象层”和“根因层”不同

### 11.2 再看第一条异常和关键转折点

这个 skill 的文档通常不会从“所有日志都说一遍”开始，而会突出：

- 第一条用户可见症状
- 第一条不可恢复异常
- 一两个决定性转折点

这些地方往往是最该仔细读的部分。

### 11.3 区分事实与推断

好的产物通常能分成三层：

- 事实：日志里明确出现了什么
- 解释：这些日志组合起来意味着什么
- 推断：还缺什么证据、当前最可能是什么

### 11.4 看“还没证明什么”

这个 skill 的一个重要优点，是它应当明确写出：

- 当前已证明什么
- 当前还没证明什么
- 下一步需要什么额外日志/符号/源码

这能帮助后续排查避免重复劳动。

---

## 12. 它最典型的使用用例

### 12.1 Android framework / HAL 崩溃重启

输入：

- `logcat`
- `init rc`
- `manifest`
- HAL 源码路径

输出：

- 哪个服务先挂
- 为什么被拉起/重启
- manifest/init/service 注册链路哪里断了

### 12.2 Native crash / tombstone / ANR

输入：

- tombstone
- abort message
- `traces.txt`
- DropBox 条目

输出：

- primary failure 是 native 还是 Java
- 哪条 backtrace 最关键
- 哪些只是连带后果

### 12.3 Suspend / resume / USB / PM 问题

输入：

- `dmesg`
- `kmsg`
- `last_kmsg`
- USB/PM 相关驱动源码

输出：

- 第一次不可恢复异常发生在哪里
- root-hub / OTG / PM 状态机是否错位
- 哪个状态变量最可能跑偏

### 12.4 Kernel module 打包/加载失败

输入：

- 构建日志
- `.config`
- `modules.load`
- target_files 产物

输出：

- 是没打开 symbol
- 还是 built 了但没打包
- 还是打包了但没加载
- 还是 metadata 路径不匹配

### 12.5 Bootloader 黑屏 / handoff 问题

输入：

- preloader/LK/U-Boot/ATF 串口日志
- bootloader 源码路径

输出：

- 卡在哪个 stage
- 是 DDR、镜像加载、dtb、bootargs、verified boot 还是 handoff

### 12.6 Cross-layer 联合定位

输入：

- 一整包 bugreport / APLog
- kernel log
- framework log
- 源码路径

输出：

- 明确 symptom layer 和 cause layer
- 构建跨层时间线
- 避免“上层看到什么就怪上层”

---

## 13. 这个 Skill 的产物示例骨架

下面是一个典型输出骨架：

```md
# 某问题分析

Working focus: cross-layer
Symptom layer: app-log
Cause layer: kernel-log

## 背景与现象

用户看到什么，问题发生在什么时刻。

## 时间线

先发生什么，后发生什么，哪一个点开始不可恢复。

## 关键证据

- 日志 A 第 X 行：说明了什么
- 日志 B 第 Y 行：为什么它是决定性证据

## 源码路径映射

- 某函数为什么 relevant
- 日志如何对应状态变化

## 根因判断

已证实：

推断：

尚未证实：

## 修复方向

建议优先检查哪些函数/配置/路径。

## 验证建议

下一次该补哪些日志或调试点。
```

这个骨架不是模板强制，而是一个很常见的自然形态。

---

## 14. 这个 Skill 的优势

### 14.1 不会一开始就钻进单层

它要求先宽扫、先判断 symptom layer 和 cause layer。

### 14.2 对大日志友好

它明确要求：

- 先 inventory
- 再切时间窗
- 再做关键词切片
- 最后精读

这非常适合：

- bugreport
- APLog
- 大型目录
- 长时间 `dmesg`

### 14.3 支持“日志 + 源码”联合分析

不是只会复述日志，而是鼓励：

- log -> function
- log -> state
- log -> config
- log -> packaging chain

### 14.4 输出可存档

它最终产物是 Markdown 工程文档，天然适合：

- 提交给同事
- 贴到 issue/缺陷系统
- 后续复盘
- 继续迭代补充

---

## 15. 这个 Skill 的局限

### 15.1 没有证据时，它不会神奇地产生根因

如果：

- 没有日志
- 没有源码
- 没有符号
- 没有时间窗口

它最多只能给：

- 当前最合理的假设
- 接下来最该补的材料

### 15.2 它依赖“日志仍然是主证据”

如果任务已经变成：

- 单纯重构代码
- 纯架构设计
- 纯理论讲解

那这个 skill 就不是最好的主工具。

### 15.3 运行镜像和源码树可能不完全一致

这是做 Android/Linux 实战时最常见的问题之一。

比如：

- 日志里有私有 debug print
- 当前给的源码树里没有
- 运行内核和当前源码不是同一版

这种情况下，这个 skill 仍然能分析主路径，但必须标记证据边界。

---

## 16. 评测文件说明：`evals.json`

`evals/evals.json` 现在有 3 个样例，每个都对应 skill 的一个能力面：

### Eval 0：Android app/framework/HAL 问题

验证点：

- 能否以 app-layer 为入口
- 能否结合 `init rc`、`manifest`、源码路径
- 能否输出工程笔记风格分析

### Eval 1：Kernel/driver 日志 + 源码

验证点：

- 能否把 dmesg 与驱动路径对齐
- 能否解释 suspend/resume 后 USB reset 链条
- 能否写出不是“只给结论”的文档

### Eval 2：Bootloader 黑屏 / handoff

验证点：

- 能否识别卡住的 stage
- 能否判断是 DDR、dtb、bootargs 还是 handoff
- 能否把串口日志和 bootloader 源码关联

这 3 个 eval 一起说明：

- 这个 skill 的能力边界是经过明确设计的
- 它不是“泛化日志总结器”
- 而是带层次、有文档产物要求的分析 skill

---

## 17. 推荐的输入模板

### 17.1 只给日志

```text
使用 android-linux-log-analysis-doc 分析这个日志：
C:\logs\main.log

现象：开机后某个 HAL 服务反复崩溃重启。
输出要求：中文 Markdown 分析文档。
```

### 17.2 日志 + 源码路径

```text
使用 android-linux-log-analysis-doc 分析这个目录：
C:\logs\bugreport

现象：USB 在 suspend/resume 后反复 reset。
源码路径：D:\kernel\drivers\usb\musb
输出要求：结合日志和代码写一份详细中文分析。
```

### 17.3 Bootloader 场景

```text
使用 android-linux-log-analysis-doc 分析这份串口日志：
C:\logs\uart.txt

现象：设备黑屏，卡在加载 kernel 前。
源码路径：D:\bootloader
输出要求：判断卡住 stage，并生成 Markdown 调查文档。
```

### 17.4 大目录场景

```text
使用 android-linux-log-analysis-doc 分析：

- 日志目录：C:\Users\admin\Desktop\debug\debuglogge
- 现象：USB 唤醒后失效
- 源码路径：D:\workspace\Android16\kernel
- 要求：先盘点目录，再找关键时间窗，最后生成一份 Markdown 文件
```

---

## 18. 使用这个 Skill 时的最佳实践

### 18.1 尽量给路径，不要只贴截图

直接给：

- 文件路径
- 目录路径
- 压缩包路径

比贴零散截图好得多。

### 18.2 尽量给“现象 + 时间窗口”

哪怕只是：

- “大概 11:11 左右”
- “休眠恢复后”
- “插 USB 后 10 秒内”

都能显著提升分析效率。

### 18.3 如果有源码，尽量一起给

特别是这些场景：

- 驱动 reset/suspend/resume
- module packaging
- bootloader handoff
- HAL/service 注册链路

### 18.4 明确你要的交付物

建议直接说：

- “输出中文 Markdown”
- “生成一份文档”
- “写成 RCA”
- “落盘成 `.md` 文件”

这样更符合这个 skill 的最终目标。

---

## 19. 常见误用方式

### 19.1 误用一：没有日志，只给一句现象

例如：

```text
USB 有问题，分析一下
```

这时候 skill 只能给调查建议，无法真正做 evidence-first 分析。

### 19.2 误用二：只想听架构科普

例如：

```text
讲一下 Android USB OTG 框架
```

这不是它的主战场。

### 19.3 误用三：希望它替代所有后续实验

skill 可以告诉你：

- 已经证明了什么
- 下一步最值得补什么

但不能替代缺失的日志、符号或私有补丁。

---

## 20. 一句话工作流总结

如果只记住一句话，可以记这句：

**给它日志、现象、时间窗口和相关源码路径，它会先做跨层宽扫，再切时间窗，再抽关键证据，最后生成一份像工程调查笔记一样的 Markdown 分析文档。**

---

## 21. 快速清单

在真正调用这个 skill 前，最好自查一遍：

- 我是否给了日志路径或日志目录？
- 我是否说明了用户可见现象？
- 我是否给了大概时间窗口？
- 我是否有源码路径、配置或差分可以补充？
- 我是否明确要求输出 Markdown 文档？

如果这 5 项里有 3 到 5 项，通常就已经很适合使用这个 skill。



## 22.举例

![image-20260617094358238](https://gitee.com/BlueRocket/pictures/raw/master/20260617094405500.png)

![image-20260617094424121](https://gitee.com/BlueRocket/pictures/raw/master/20260617094424189.png)

![image-20260617094456571](https://gitee.com/BlueRocket/pictures/raw/master/20260617094456624.png)

![image-20260617094511657](https://gitee.com/BlueRocket/pictures/raw/master/20260617094511718.png)

---

## 22. 结语

`android-linux-log-analysis-doc` 不是一个“泛泛回答日志问题”的技能，而是一个**面向 Android/Linux 故障调查文档产出**的专用 skill。

它最强的地方不只是“读日志”，而是：

- 能处理大目录
- 能跨层建立时间线
- 能把日志和代码路径连起来
- 能把分析变成可读、可交付、可继续迭代的 Markdown 文档

如果你的目标不是一句话猜测，而是想拿到一份后续团队可以继续用的技术分析文档，那么这个 skill 是非常合适的。
