# 求真书院 AI 博士生资格考试复习资料

本目录是一个独立的增量 LaTeX 工程，不依赖仓库中已有的 `latex-project/` 大书。

## 内容

- `sources/exams/`: 已下载的三套官方 QE-AI 原卷 PDF 及 `pdftotext` 抽取文本。
- `sources/syllabus/`: 官方 AI 方向博士生资格考试大纲 PDF 及抽取文本。
- `chapters/`: 复习资料与真题解答源码。
- `main.tex`: LaTeX 入口。
- `refs.bib`: 官方来源和教材引用。
- `build/`: 编译输出目录。

## 编译

```bash
latexmk -xelatex -interaction=nonstopmode -file-line-error -outdir=build main.tex
biber build/main
latexmk -xelatex -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

最终 PDF 为 `build/main.pdf`。

## 增量维护

新增试卷时：

1. 将官方 PDF 放入 `sources/exams/`。
2. 用 `pdftotext -layout` 生成同名 `.txt`。
3. 在 `refs.bib` 增加官方页面条目。
4. 新增一个 `chapters/YY-term.tex`，并在 `main.tex` 中 `\include{...}`。
5. 编译并检查 `main.log` 中是否有 `Undefined control sequence`、`Emergency stop` 或未解析引用。
