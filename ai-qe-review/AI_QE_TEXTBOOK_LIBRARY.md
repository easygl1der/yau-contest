# AI QE 官方教材库

本目录收录求真书院人工智能方向博士生资格考试大纲所指定教材的本地阅读包，以及用户明确选定的补充资料。每本教材均保留一份不可变的本地副本，并将 MinerU 转换结果与原件分开存放；Downloads 中的原始文件不作移动或删除。

## 目录约定

- `sources/textbooks/official/<course>/<slug>/source.pdf`：从 Downloads 复制的教材原件。
- `transcripts/mineru/<slug>/reading.md`：按原始页序合并、清理后的主阅读文件。
- `transcripts/mineru/<slug>/parts/`：MinerU 分段 Markdown、JSON 和图像资源，供回溯与重建使用。
- `transcripts/mineru/<slug>/README.md`：来源、SHA-256、页数、解析模式、页段和验收结果。
- `textbook-library-manifest.json`：官方大纲条目与本地资料状态的机器可读索引。

## 使用边界

后续扩写复习笔记时，知识点、定义、定理和考点优先参照本库中由考纲指定的教材；正文可直接使用相应的 <code>\cite</code>、<code>\textcite</code> 或 <code>\parencite</code> 标注出处。补充讲义只能作为补充，不能替代官方指定教材的依据。

- 本库的“官方指定”标签只来自 `sources/syllabus/qzc-qe-ai-syllabus-2026-06.pdf`，不因教材主题相近而扩张。
- 当前包共含 11 本：10 本已入库的官方指定书，以及 1 本凸优化补充讲义；二者在路径和清单中分开标记。
- 文末书目与官网/DOI 链接仍以 `refs.bib` 为准；本库负责本地原件和可编辑 Markdown 的可追溯性。
- 转录文本是检索和复习辅助，涉及公式、图表或原文措辞时应回看同包的 `source.pdf`。

## 已入库

### 机器学习理论

- [Understanding Machine Learning](transcripts/mineru/understanding-machine-learning/reading.md) | [原 PDF](sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
- [Foundations of Machine Learning, 2nd ed.](transcripts/mineru/foundations-of-machine-learning-2e/reading.md) | [原 PDF](sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)

### 深度学习和强化学习

- [Deep Learning](transcripts/mineru/deep-learning-goodfellow/reading.md) | [原 PDF](sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
- [Deep Learning: Foundations and Concepts](transcripts/mineru/deep-learning-foundations-concepts/reading.md) | [原 PDF](sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
- [Pattern Recognition and Machine Learning](transcripts/mineru/pattern-recognition-machine-learning/reading.md) | [原 PDF](sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf)
- [Computer Vision: Algorithms and Applications, 2nd ed.](transcripts/mineru/computer-vision-algorithms-applications/reading.md) | [原 PDF](sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf)

### 人工智能中的优化方法

- [Lectures on Convex Optimization, 2nd ed.](transcripts/mineru/lectures-convex-optimization/reading.md) | [原 PDF](sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
- [First-Order Methods in Optimization](transcripts/mineru/first-order-methods-optimization/reading.md) | [原 PDF](sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)

### 补充资料：凸优化

- [Lectures on Modern Convex Optimization](transcripts/mineru/lectures-modern-convex-optimization/reading.md) | [原 PDF](sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf) | Ben-Tal 与 Nemirovski 课程讲义，非大纲指定书。

### 自然语言处理

- [Speech and Language Processing](transcripts/mineru/speech-language-processing/reading.md) | [原 PDF](sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
- [Neural Network Methods in Natural Language Processing](transcripts/mineru/neural-network-methods-nlp/reading.md) | [原 PDF](sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)

目前 10 本官方指定书均已完成 MinerU 转录；上述凸优化补充讲义亦已单独入库并转录。
