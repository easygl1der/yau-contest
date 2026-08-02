# AI QE 复习资料 Obsidian 索引

本目录由 `../main.tex` 与 `../chapters/*.tex` 自动导出；正文以 LaTeX 源码为准，`../build/main.pdf` 是对应的 104 页阅读版。

## 笔记

- [[00-preface|说明与使用方式]]  
  Source: `chapters/00-preface.tex`
- [[01-syllabus|考试大纲与考点地图]]  
  Source: `chapters/01-syllabus.tex`, `chapters/01-textbooks.tex`
- [[01-textbooks|指定教材章节导览]]  
  Source: `chapters/01-textbooks.tex`
- [[02-primer|从零开始的理论预备]]  
  Source: `chapters/02-primer.tex`
- [[03-2025-spring|2025 春季 QE-AI 真题解答]]  
  Source: `chapters/03-2025-spring.tex`
- [[04-2025-fall|2025 秋季 QE-AI 真题解答]]  
  Source: `chapters/04-2025-fall.tex`
- [[05-2026-spring|2026 春季 QE-AI 真题解答]]  
  Source: `chapters/05-2026-spring.tex`
- [[90-checklists|考前 Checklist 与增量路线]]  
  Source: `chapters/90-checklists.tex`

## 公式、链接与图片

- 行内与展示公式均保留 LaTeX，适配 Obsidian MathJax。
- LaTeX 的章节和概念交叉引用已转换为 Obsidian 内链；概念链接统一回到 `02-primer.md` 中的定义或讲解小节。
- 当前纳入 `main.tex` 的章节没有 `\includegraphics` 调用，故本次没有新增图片资产。导出器会将后续加入的 `\includegraphics{path}` 转为相对于本目录的 Markdown 图片链接。
- 文献引文统一写为 Pandoc/Obsidian Citation Plugin 可识别的 `[@citation-key]` 形式；对应书目见 [[references]]。

## 重新导出

在 `ai-qe-review` 目录执行：

```bash
ruby scripts/export_obsidian_notes.rb
```
