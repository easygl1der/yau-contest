---
title: "Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: lectures-modern-convex-optimization
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-from-linear-to-conic-programming|第 1 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；2 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 9；Affine × 55；different × 6；efficient × 5；sufficient × 26 | 673–3528 |
| [[chapters/02-chapter-2-conic-quadratic-programming|第 2 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对；LaTeX 环境不配对，需逐式对照 PDF；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 17；Affine × 41；different × 5；efficient × 2；sufficient × 1；PDF-confirmed LMCO PDF p.155 Eq. (2.5.6) repair × 1 | 3529–6574 |
| [[chapters/03-chapter-3-convex-sets-in-r-n|第 3 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；LaTeX 环境不配对，需逐式对照 PDF；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.164) × 1；PDF-confirmed control-symbol repair (PDF p.220) × 1；PDF-confirmed book-specific control-codepoint pattern × 34；Affine × 45；different × 13；efficient × 8；sufficient × 17；PDF-page fallback for unrecoverable formula (PDF p.232) × 1 | 6575–13668 |
| [[chapters/04-chapter-4-polynomial-time-interior-point-algorithms-for-lp-cqp-and-sdp|第 4 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 34；Affine × 11；different × 6；efficient × 1；sufficient × 4 | 13669–16727 |
| [[chapters/05-chapter-5-simple-methods-for-large-scale-problems|第 5 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；6 张图使用相邻原文图注生成 alt，仍需视觉核对；LaTeX 环境不配对，需逐式对照 PDF；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.460) × 1；PDF-confirmed book-specific control-codepoint pattern × 73；Affine × 244；different × 23；Differentiability × 8；efficient × 1；sufficient × 37；PDF-page fallback for unrecoverable formula (PDF p.476) × 1；PDF-page fallback for unrecoverable formula (PDF p.477) × 1；PDF-page fallback for unrecoverable formula (PDF p.480) × 1；PDF-page fallback for unrecoverable formula (PDF p.481) × 1；PDF-page fallback for unrecoverable formula (PDF p.506) × 1；PDF-page fallback for unrecoverable formula (PDF p.507) × 1 | 16728–32517 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
