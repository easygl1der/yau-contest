---
title: "Lectures on Convex Optimization \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: lectures-convex-optimization
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-nonlinear-optimization|第 1 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 10 | 356–2537 |
| [[chapters/02-chapter-2-smooth-convex-optimization|第 2 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 4 | 2538–5864 |
| [[chapters/03-chapter-3-nonsmooth-convex-optimization|第 3 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.224) × 1；PDF-confirmed book-specific control-codepoint pattern × 7 | 5865–10223 |
| [[chapters/04-chapter-4-second-order-methods|第 4 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 5 | 10224–13679 |
| [[chapters/05-chapter-5-polynomial-time-interior-point-methods|第 5 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 4 | 13680–17886 |
| [[chapters/06-chapter-6-the-primal-dual-model-of-an-objective-function|第 6 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 8 | 17887–20495 |
| [[chapters/07-chapter-7-optimization-in-relative-scale|第 7 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 7 | 20496–24285 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
