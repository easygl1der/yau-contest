---
title: "First-Order Methods in Optimization \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: first-order-methods-optimization
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-vector-spaces|第 1 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.13) × 1；Affine × 7；different × 2 | 252–761 |
| [[chapters/02-chapter-2-extended-real-valued-functions|第 2 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；3 张图使用相邻原文图注生成 alt，仍需视觉核对；LaTeX 环境不配对，需逐式对照 PDF；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.23) × 1；Affine × 4；different × 1；PDF-confirmed FOMO PDF p.33 convexity-proof equation repair × 1 | 762–1694 |
| [[chapters/03-chapter-3-subgradients|第 3 章]] | needs-manual-review | 3 张图使用相邻原文图注生成 alt，仍需视觉核对；LaTeX 环境不配对，需逐式对照 PDF；已应用可追溯自动修复：Affine × 17；different × 3；Differentiability × 10；sufficient × 8；PDF-confirmed FOMO p.95 table repair × 1 | 1695–4179 |
| [[chapters/04-chapter-4-conjugate-functions|第 4 章]] | machine-verified | 已应用可追溯自动修复：Affine × 3；Conjugacy × 4 | 4180–5067 |
| [[chapters/05-chapter-5-smoothness-and-strong-convexity|第 5 章]] | machine-verified | 已应用可追溯自动修复：Affine × 2；different × 3；Differentiability × 3 | 5068–5961 |
| [[chapters/06-chapter-6-the-proximal-operator|第 6 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：Affine × 4；Differentiability × 4 | 5962–8108 |
| [[chapters/07-chapter-7-spectral-functions|第 7 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 8109–8670 |
| [[chapters/08-chapter-8-primal-and-dual-projected-subgradient-methods|第 8 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：Affine × 1；different × 1；sufficient × 3 | 8671–10779 |
| [[chapters/09-chapter-9-mirror-descent|第 9 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；2 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：different × 3；Differentiability × 1 | 10780–11684 |
| [[chapters/10-chapter-10-the-proximal-gradient-method|第 10 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；5 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：Affine × 2；different × 5；sufficient × 20 | 11685–14368 |
| [[chapters/11-chapter-11-the-block-proximal-gradient-method|第 11 章]] | machine-verified | 已应用可追溯自动修复：different × 1；sufficient × 12 | 14369–15310 |
| [[chapters/12-chapter-12-dual-based-proximal-gradient-methods|第 12 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；5 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.363) × 1；different × 2 | 15311–16314 |
| [[chapters/13-chapter-13-the-generalized-conditional-gradient-method|第 13 章]] | needs-manual-review | 1 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：different × 3；sufficient × 7 | 16315–17395 |
| [[chapters/14-chapter-14-alternating-minimization|第 14 章]] | needs-manual-review | 疑似转录/渲染风险；1 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：different × 3；sufficient × 3 | 17396–18103 |
| [[chapters/15-chapter-15-admm|第 15 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：Affine × 6；different × 4；Differentiability × 1；efficient × 2；sufficient × 2 | 18104–19422 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
