---
name: margin-note
description: 在 kaobook 模板的 margin 区域使用 sidenote 添加笔记、提问、回答等内容
triggers:
  - sidenote
  - margin
  - 边注
  - 笔记
  - 提问
  - 回答
  - note
  - question
  - 备注
  - 注释
argument-hint: "<类型> <内容> [位置偏移]"
scope: project
---

# Margin Note Skill

## Purpose

为 kaobook 模板项目提供在 margin（页边距）区域添加各类笔记内容的能力，主要使用 `\sidenote` 命令，包括：
- 自由笔记
- 提问与回答
- 公式编号引用
- 重要提示

## 核心命令

### 1. 带编号边注 `\sidenote[<offset>]{<text>}`

```latex
这是一段正文\ldots\sidenote{这是边注内容}
```

**参数：**
- `offset`：可选，垂直偏移量（默认 0pt）
- 支持 `\baselineskip` 倍数，如 `[1\baselineskip]`

### 2. 自由边注 `\marginnote[<offset>]{<text>}`（备选）

```latex
这是一个观点\sidenote{带编号的边注说明}
```

### 3. 边注环境

```latex
\begin{marginfigure}[<offset>]
  \centering
  \includegraphics[width=\marginparwidth]{figure.pdf}
  \caption{边注图片}
\end{marginfigure}

\begin{margintable}[<offset>]
  ...
\end{margintable}
```

## 类型识别与自动插入

根据用户输入自动判断插入类型：

| 输入关键词 | 插入内容 |
|-----------|---------|
| `笔记`、`note`、`备注` | `\sidenote{...}` |
| `提问`、`question`、`问` | `\sidenote{❓ ...}` |
| `回答`、`answer`、`答` | `\sidenote{✅ ...}` |
| `重要`、`注意`、`warning` | `\sidenote{⚠️ ...}` |
| `公式`、`theorem` | `\sidenote{式 (\ref{eq:xxx})}` |

**默认使用 `\sidenote{}`，除非用户明确要求使用 `\marginnote{}`**

## 工作流程

1. **识别位置**：在当前编辑的 `.tex` 文件中找到光标位置
2. **判断类型**：根据触发词判断边注类型
3. **构建内容**：生成 `\sidenote{...}` 命令
4. **插入位置**：在当前段落的合适位置插入，通常是句尾或关键词后
5. **格式统一**：确保 `\sidenote` 紧跟在相关正文后面

## 示例

### 添加普通笔记
```
用户：在这段话旁边添加笔记"这是关键步骤"
→ 插入：...关键步骤\sidenote{这是关键步骤}
```

### 添加提问
```
用户：margin 提问：这个公式怎么推导的？
→ 插入：...\sidenote{❓ 这个公式怎么推导的？}
```

### 添加回答
```
用户：在上一个问题旁边回答"使用分部积分"
→ 插入：...\sidenote{✅ 使用分部积分}
```

### 带偏移量的边注
```
用户：添加笔记"参见第3章"，向上偏移一行
→ 插入：...\sidenote[-1\baselineskip]{参见第3章}
```

## 边注样式配置（来自 kao.def）

kaobook 模板的边注默认样式：
- 字体：`\@margin@par`（footnotesize，无缩进，两端对齐）
- 垂直偏移：默认下移 3pt（`\marginnotevadjust{3pt}`）
- 对齐：左边距对齐

## 注意事项

1. **mainmatter 布局**：边注仅在 `\mainmatter`（margin 布局）下生效
2. **浮动体**：图片/表格使用 `marginfigure`/`margintable` 环境
3. **偏移调整**：如果边注与正文重叠，使用 `offset` 参数调整
4. **编译验证**：插入后建议编译检查边注位置

## 快速参考

| 场景 | 命令 |
|------|------|
| **默认笔记** | `\sidenote{内容}` |
| 自由边注 | `\marginnote{内容}` |
| 边注图片 | `\begin{marginfigure}...\end{marginfigure}` |
| 边注表格 | `\begin{margintable}...\end{margintable}` |
| 向上偏移 | `\sidenote[-1\baselineskip]{内容}` |
| 向下偏移 | `\sidenote[1\baselineskip]{内容}` |
