# 资料范围、来源政策与增量流程

## 范围

本资料包收录求真书院官方“考题资源”中公开列出的 概率统计博士生资格考试试卷。覆盖从 2023 秋至 2026 春的 6 个学期，并配套收录 2026-06-30 发布的考试大纲。

## 来源政策

每份试卷都有四层可追溯记录：官方发布页、下载的原始 PDF、MinerU VLM 的 `reading.md` 阅读版，以及保留原始 Markdown、JSON 和图像资产的 `parts/`。`notes/` 直接引用 MinerU 的数学 Markdown；原卷 PDF 仍是题目、版式和符号的权威来源。

## 增量流程

1. 将新发布的官方 PDF 放进 `sources/exams/`，以 `qzc-qe-...-YYYY-term.pdf` 命名。
2. 用 `mineru-open-api extract --model vlm --format md,json` 创建 `transcripts/mineru/<试卷名>/parts/`，并将清理后的 Markdown 写为 `reading.md`。
3. 在仓库根目录 `scripts/build_qe_mineru_notes.rb` 的 `TERMS` 中登记学期与官方发布页。
4. 在项目根目录运行 `ruby scripts/export_obsidian_notes.rb`，再人工逐页核验公式密集题目。

这套目录结构刻意仿照 `ai-qe-review/`：来源与阅读笔记分离，未来可再加 `chapters/`、`main.tex`、`refs.bib` 与完整解答，而不破坏原卷档案。
