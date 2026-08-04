---
title: "Computer Vision: Algorithms and Applications \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: computer-vision-algorithms-applications
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-introduction|第 1 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 558–1057 |
| [[chapters/02-chapter-2-image-formation|第 2 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；22 张图使用相邻原文图注生成 alt，仍需视觉核对 | 1058–2719 |
| [[chapters/03-chapter-3-image-processing|第 3 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；21 张图使用相邻原文图注生成 alt，仍需视觉核对 | 2720–4560 |
| [[chapters/04-chapter-4-model-fitting-and-optimization|第 4 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；13 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.254) × 1；PDF-confirmed control-symbol repair (PDF p.255) × 3 | 4561–5402 |
| [[chapters/05-chapter-5-deep-learning|第 5 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；45 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.265) × 4；PDF-confirmed control-symbol repair (PDF p.326) × 2 | 5403–7106 |
| [[chapters/06-chapter-6-recognition|第 6 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；29 张图使用相邻原文图注生成 alt，仍需视觉核对 | 7107–8205 |
| [[chapters/07-chapter-7-feature-detection-and-matching|第 7 章]] | needs-manual-review | 疑似转录/渲染风险；源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；29 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.465) × 1；PDF-confirmed book-specific control-codepoint pattern × 2 | 8206–9678 |
| [[chapters/08-chapter-8-image-alignment-and-stitching|第 8 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；9 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 2 | 9679–10745 |
| [[chapters/09-chapter-9-motion-estimation|第 9 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；9 张图使用相邻原文图注生成 alt，仍需视觉核对 | 10746–11778 |
| [[chapters/10-chapter-10-computational-photography|第 10 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；30 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 3 | 11779–13174 |
| [[chapters/11-chapter-11-structure-from-motion-and-slam|第 11 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；16 张图使用相邻原文图注生成 alt，仍需视觉核对 | 13175–14419 |
| [[chapters/12-chapter-12-depth-estimation|第 12 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；14 张图使用相邻原文图注生成 alt，仍需视觉核对 | 14420–15369 |
| [[chapters/13-chapter-13-3d-reconstruction|第 13 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；12 张图使用相邻原文图注生成 alt，仍需视觉核对 | 15370–16251 |
| [[chapters/14-chapter-14-image-based-rendering|第 14 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；9 张图使用相邻原文图注生成 alt，仍需视觉核对 | 16252–26083 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
