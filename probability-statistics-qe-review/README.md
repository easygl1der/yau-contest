# 求真书院概率统计博士生资格考试题库

本目录以 `ai-qe-review/` 为模板，保存清华大学求真书院公开的概率统计方向博士生资格考试（QE）档案。截至 2026-07-28，官方“考题资源”页可追溯到 2023 秋至 2026 春，共 6 套公开原卷；另含 2026-06-30 发布的考试大纲。

## 目录

- `sources/exams/`：官方原卷 PDF。
- `sources/syllabus/`：官方考试大纲 PDF。
- `transcripts/mineru/`：每份 PDF 的 MinerU VLM 转录包，含 `source.pdf`、`reading.md`、原始 Markdown、JSON 和图像资产。
- `notes/`：Obsidian 入口、考纲、考点地图和按学期组织的 MinerU 公式转录笔记（中文版本）。
- `notes-en/`：与 `notes/` 保持目录、文件名和题目顺序平行的英文版 Obsidian 笔记，面向英文 QE 题目与专业术语复习。
- `author-runs/2026-07-28-source-acquisition/`：来源、抽取与校验记录。
- `scripts/export_obsidian_notes.rb`：从 MinerU 阅读包重建 `notes/` 的项目内入口；其共享实现位于仓库根目录 `scripts/build_qe_mineru_notes.rb`。

## 入口

中文版本从 [notes/README.md](notes/README.md) 开始阅读；英文版本从 [notes-en/README.md](notes-en/README.md) 开始阅读。题目 PDF 是数学符号与排版的最终依据；Markdown 转录服务于检索、链接和后续解答扩写。
