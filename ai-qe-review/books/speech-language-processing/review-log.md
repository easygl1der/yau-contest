---
title: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models \u2014 \u9010\u7AE0\u5BA1\u8BA1"
book_slug: speech-language-processing
tags:
  - ai-qe
  - textbook
  - transcription-audit
---

# 逐章审计与复核队列

此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

| 章节 | 状态 | 复核信息 | 源行 |
| --- | --- | --- | --- |
| [[chapters/01-chapter-1-introduction|第 1 章]] | machine-verified | 无自动异常；涉及公式/图像时仍可按源行回看 PDF | 328–335 |
| [[chapters/02-chapter-2-regular-expressions-text-normalization-edit-distance|第 2 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；2 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 1 | 336–1105 |
| [[chapters/03-chapter-3-n-gram-language-models|第 3 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 1 | 1106–1852 |
| [[chapters/04-chapter-4-naive-bayes-and-sentiment-classification|第 4 章]] | needs-manual-review | 3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 1853–2409 |
| [[chapters/05-chapter-5-logistic-regression|第 5 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对 | 2410–3009 |
| [[chapters/06-chapter-6-vector-semantics-and-embeddings|第 6 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；9 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.126) × 3；PDF-confirmed control-symbol repair (PDF p.129) × 4 | 3010–3716 |
| [[chapters/07-chapter-7-neural-networks-and-neural-language-models|第 7 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；10 张图使用相邻原文图注生成 alt，仍需视觉核对 | 3717–4293 |
| [[chapters/08-chapter-8-sequence-labeling-for-parts-of-speech-and-named-entities|第 8 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；5 张图使用相邻原文图注生成 alt，仍需视觉核对 | 4294–4949 |
| [[chapters/09-chapter-9-deep-learning-architectures-for-sequence-processing|第 9 章]] | needs-manual-review | 20 张图使用相邻原文图注生成 alt，仍需视觉核对 | 4950–5502 |
| [[chapters/10-contextual-embeddings|第 10 章]] | blocked: placeholder-content | 转录中只有章节标题和 Placeholder，不能将其视作可审校正文。 | — |
| [[chapters/11-chapter-11-machine-translation-and-encoder-decoder-models|第 11 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；14 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.234) × 2 | 5503–6135 |
| [[chapters/12-chapter-12-constituency-grammars|第 12 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；4 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 1 | 6136–7150 |
| [[chapters/13-chapter-13-constituency-parsing|第 13 章]] | needs-manual-review | 源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；5 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed book-specific control-codepoint pattern × 1 | 7151–7629 |
| [[chapters/14-chapter-14-dependency-parsing|第 14 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；7 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.313) × 1 | 7630–8189 |
| [[chapters/15-chapter-15-logical-representations-of-sentence-meaning|第 15 章]] | needs-manual-review | 3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 8190–8995 |
| [[chapters/16-computational-semantics-and-semantic-parsing|第 16 章]] | blocked: placeholder-content | 转录中只有不完整标题和 Placeholder，不能将其视作可审校正文。 | — |
| [[chapters/17-chapter-17-information-extraction|第 17 章]] | needs-manual-review | 3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 8996–9631 |
| [[chapters/18-chapter-18-word-senses-and-wordnet|第 18 章]] | needs-manual-review | 3 张图使用相邻原文图注生成 alt，仍需视觉核对 | 9632–10112 |
| [[chapters/19-chapter-19-semantic-role-labeling|第 19 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；2 张图使用相邻原文图注生成 alt，仍需视觉核对 | 10113–10698 |
| [[chapters/20-chapter-20-lexicons-for-sentiment-affect-and-connotation|第 20 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；6 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.412) × 1；PDF-confirmed control-symbol repair (PDF p.418) × 1 | 10699–11173 |
| [[chapters/21-chapter-21-coreference-resolution|第 21 章]] | needs-manual-review | 疑似转录/渲染风险；源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；4 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.442) × 1；PDF-confirmed book-specific control-codepoint pattern × 6 | 11174–11880 |
| [[chapters/22-chapter-22-discourse-coherence|第 22 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；5 张图使用相邻原文图注生成 alt，仍需视觉核对 | 11881–12384 |
| [[chapters/23-chapter-23-question-answering|第 23 章]] | needs-manual-review | 疑似转录/渲染风险；源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；10 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.493) × 1；PDF-confirmed book-specific control-codepoint pattern × 1 | 12385–13007 |
| [[chapters/24-chapter-24-chatbots-dialogue-systems|第 24 章]] | needs-manual-review | 疑似转录/渲染风险；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；6 张图使用相邻原文图注生成 alt，仍需视觉核对 | 13008–13879 |
| [[chapters/25-chapter-25-phonetics|第 25 章]] | needs-manual-review | 原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；19 张图使用相邻原文图注生成 alt，仍需视觉核对 | 13880–14280 |
| [[chapters/26-chapter-26-automatic-speech-recognition-and-text-to-speech|第 26 章]] | needs-manual-review | 疑似转录/渲染风险；源稿含控制字符（已从阅读层移除）；原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义；11 张图使用相邻原文图注生成 alt，仍需视觉核对；已应用可追溯自动修复：PDF-confirmed control-symbol repair (PDF p.576) × 1；PDF-confirmed control-symbol repair (PDF p.572) × 1；PDF-confirmed book-specific control-codepoint pattern × 3 | 14281–20414 |

## 人工核验顺序

1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
