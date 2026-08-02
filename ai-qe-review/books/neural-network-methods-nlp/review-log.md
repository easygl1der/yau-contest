---
title: "Neural Network Methods for Natural Language Processing \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: neural-network-methods-nlp
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-introduction|第 1 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 517–620 |
| [[chapters/02-chapter-2-learning-basics-and-linear-models|第 2 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对 | 621–1118 |
| [[chapters/03-chapter-3-from-linear-models-to-multi-layer-perceptrons|第 3 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义 | 1119–1176 |
| [[chapters/04-chapter-4-feed-forward-neural-networks|第 4 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 1177–1363 |
| [[chapters/05-chapter-5-neural-network-training|第 5 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对 | 1364–1609 |
| [[chapters/06-chapter-6-features-for-textual-data|第 6 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义 | 1610–1786 |
| [[chapters/07-chapter-7-case-studies-of-nlp-features|第 7 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对 | 1787–2017 |
| [[chapters/08-chapter-8-from-textual-features-to-inputs|第 8 章]] | needs-manual-review | 1 张图使用相邻原文图注生成 alt，仍需视觉核对 | 2018–2294 |
| [[chapters/09-chapter-9-language-modeling|第 9 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 2295–2487 |
| [[chapters/10-chapter-10-pre-trained-word-representations|第 10 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 2488–2849 |
| [[chapters/11-chapter-11-using-word-embeddings|第 11 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 2850–2975 |
| [[chapters/12-chapter-12-case-study-a-feed-forward-architecture-for-sentence-meaning-i|第 12 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 2976–3101 |
| [[chapters/13-chapter-13-ngram-detectors-convolutional-neural-networks|第 13 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3102–3298 |
| [[chapters/14-chapter-14-recurrent-neural-networks-modeling-sequences-and-stacks|第 14 章]] | needs-manual-review | 9 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3299–3486 |
| [[chapters/15-chapter-15-concrete-recurrent-neural-network-architectures|第 15 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3487–3625 |
| [[chapters/16-chapter-16-modeling-with-recurrent-networks|第 16 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；2 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3626–3813 |
| [[chapters/17-chapter-17-conditioned-generation|第 17 章]] | needs-manual-review | 5 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3814–4092 |
| [[chapters/18-chapter-18-modeling-trees-with-recursive-neural-networks|第 18 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；1 张图使用相邻原文图注生成 alt，仍需视觉核对 | 4093–4178 |
| [[chapters/19-chapter-19-structured-output-prediction|第 19 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 4179–4532 |
| [[chapters/20-chapter-20-cascaded-multi-task-and-semi-supervised-learning|第 20 章]] | needs-manual-review | 6 张图使用相邻原文图注生成 alt，仍需视觉核对 | 4533–4782 |
| [[chapters/21-chapter-21-conclusion|第 21 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义 | 4783–5512 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
