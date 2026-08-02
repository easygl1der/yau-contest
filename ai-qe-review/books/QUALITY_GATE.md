---
title: AI 博士考教材分章库质量门
tags:
  - ai-qe
  - textbook-library
  - transcription-audit
---

# 质量门与当前状态

本库已建立可读的章节层和不可改写的证据层，但尚未达到“逐页、逐式、逐图人工审校完成”。`review_status` 不等于数学内容、图义或原文措辞已经人工确认。

## 目标与验收

每章只有在章首/章末、所有异常字符、公式、表格、图像均与 PDF 对照，并且修订记录标明 PDF 页与 JSON `part`、`page_idx` 后，才可标为 `reviewed`。

- 结构门：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb` 必须通过，验证章节覆盖、严格递增源行、frontmatter、图片目标、控制字符和审计状态。
- 严格公式门：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb --strict` 必须通过；它不允许未配对的 LaTeX 环境。
- 读者门：每张图须有语义 alt/图注，不能以当前的“请以 source.pdf 为准”占位替代。

## 当前机器结果

- 已生成 11 册教材和 190 个章节入口；每个可用章节保留连续、严格递增的 `reading.md` 源行区间。
- 结构门通过；原始 PDF、MinerU Markdown、JSON 和图片资产均保留在证据层。
- 911 张图已按“图后首个非空行是带正文的 `Figure` 图注”这一单向规则生成短 alt；另有 2248 张图仍只有 PDF 回看提示。两类均不等于视觉内容已人工确认，相关章节保持 `needs-manual-review`。
- 各书的 `image-review-queue.json` 合计记录 3159 张章节内图像，每项均可回到图片源行；其中高置信图注的源行再由 `image-caption-audit.json` 复核。
- `control-character-review-queue.json` 合计记录 1204 个可能丢失符号；其中 1172 个已按 PDF 视觉确认的受限模式恢复（其中 533 个来自 FOML 的书内 `U+000F` 至 `ε` 规则），32 个已逐行 PDF 确认修复，415 个已找到同一 MinerU JSON 块及 PDF 候选页；其余不得猜测补写。
- `render-risk-review-queue.json` 合计记录 193 个 OCR 渲染风险源行；其中 57 个已由 PDF 确认修复，131 个拥有唯一 JSON/PDF 页候选。其余 `(...)` 占位符与连续 HTML 上标均须按页视觉核对后再修复。
- `chapter-boundary-audit.json` 为 187 个可用章节记录章首与首节锚点；其中 7 个得到唯一 JSON/PDF 页候选，其余保留为歧义或未决，未写入伪造页码。
- 已完成三项 PDF 确认的数学修复：First-Order Methods 第 2、3 章，Modern Convex 第 2 章；每项均记录在对应 `review-log.md` 的自动修复列。
- 严格公式门通过。Foundations of Machine Learning 第 8、10 章和 Lectures on Modern Convex Optimization 第 3、5 章的 10 个不可安全转写公式，已改为嵌入其已核验的原 PDF 页，而非机械补 `\end{array}`。
- 上述 10 个 PDF 公式回退仍保留 `needs-manual-review`：它们在视觉上准确可读，但若要得到可搜索、可编辑的 LaTeX，必须逐式人工转写并在 `review-log.md` 留下页级证据。

## 明确阻塞

- PRML 第 12 章：归档 PDF 与 MinerU 正文均没有目录中列出的完整章节页面。
- Speech and Language Processing 第 10、16 章：转录中只出现标题/`Placeholder`，没有可审校正文。

对应章节文件仅记录阻塞，不伪造正文。所有待审工作以每本书的 `review-log.md` 为准。
