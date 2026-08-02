# 2024 春季 计算与应用数学博资考

此目录是官方 PDF 的 MinerU VLM 转录包。原卷 PDF 保持为题目、版式和公式的权威版本；`reading.md` 是经过数学间距清理的阅读副本。

## 内容

- `source.pdf`：与 `sources/exams/qzc-qe-applied-math-2024-spring.pdf` 对应的不可变硬链接。
- `reading.md`：清理后的主阅读文件，图片路径已调整为在本目录可解析。
- `parts/qzc-qe-applied-math-2024-spring.md`：MinerU 的清理后原始 Markdown。
- `parts/qzc-qe-applied-math-2024-spring.json`：MinerU 的结构化输出。
- `parts/images/`：MinerU 提取出的图像资产（若有）。

## 转录记录

- 工具：`mineru-open-api extract`。
- 模式：认证精度转录，`--model vlm --format md,json`；考试卷使用英文模型提示，大纲使用中文模型提示。
- 数学清理：`clean_mineru_markdown.py --in-place`，只规范数学环境内的 OCR 式空格。
- 原始 PDF SHA-256：`4010dd600b06962888b3d41429b3c451615dcd1d5c7fb78c95da4da4cf54ddf8`。
