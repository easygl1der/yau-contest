---
title: AI 博士考教材分章阅读库
tags:
  - ai-qe
  - textbook-library
---

# AI 博士考教材分章阅读库

每册教材的 `chapters/` 中每个 Markdown 文件对应一章；`review-log.md` 给出逐章质量状态；`manifest.json` 保存可机读的源行、图片和公式检查记录。原始 PDF 与 MinerU 转录包不被改写，始终是证据层。

开始阅读前先看 [[QUALITY_GATE|质量门与当前状态]]；它区分可用阅读层、已确认修复、待审公式和源材料阻塞。

> [!warning] 引用原则
> 章节文件中的源行定位用于快速回溯到合并转录。精确页码、逐字引文、数学符号、图和表必须回看对应 `source.pdf`；任何尚无可验证页码映射的地方均显式保留为 `null`。

| 课程 | 教材 | 属性 | 分章数 | 待人工复核 |
| --- | --- | --- | ---: | ---: |
| machine-learning | [[understanding-machine-learning/README|Understanding Machine Learning: From Theory to Algorithms]] | 官方指定 | 31 | 26 |
| machine-learning | [[foundations-of-machine-learning-2e/README|Foundations of Machine Learning]] | 官方指定 | 17 | 17 |
| deep-learning | [[deep-learning-goodfellow/README|Deep Learning]] | 官方指定 | 20 | 20 |
| deep-learning | [[deep-learning-foundations-concepts/README|Deep Learning: Foundations and Concepts]] | 官方指定 | 20 | 20 |
| deep-learning | [[pattern-recognition-machine-learning/README|Pattern Recognition and Machine Learning]] | 官方指定 | 14 | 13 |
| deep-learning | [[computer-vision-algorithms-applications/README|Computer Vision: Algorithms and Applications]] | 官方指定 | 14 | 14 |
| optimization | [[lectures-convex-optimization/README|Lectures on Convex Optimization]] | 官方指定 | 7 | 7 |
| optimization | [[first-order-methods-optimization/README|First-Order Methods in Optimization]] | 官方指定 | 15 | 11 |
| natural-language-processing | [[speech-language-processing/README|Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models]] | 官方指定 | 26 | 23 |
| natural-language-processing | [[neural-network-methods-nlp/README|Neural Network Methods for Natural Language Processing]] | 官方指定 | 21 | 15 |
| optimization | [[lectures-modern-convex-optimization/README|Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications]] | 补充资料 | 5 | 5 |

## 再生成与验证

- 构建：`ruby ai-qe-review/scripts/build_ai_qe_book_library.rb`
- 结构验证：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb`
- 严格公式验证：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb --strict`
- 自动修复只限高置信度 OCR 拼写、换行/编码和图片相对路径；不重写原文的知识内容、证明、公式或图像。
