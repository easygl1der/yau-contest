#!/bin/bash

# Compile LaTeX with xelatex to support xeCJK and ensure local kaobook template is used
cd "$(dirname "$0")"

# 设置搜索路径以包含本地修改过的 kaobook 模板
export TEXINPUTS=".:./texmf/tex/latex/kaobook//:$TEXINPUTS"

echo "Compiling main.tex with xelatex (pass 1/3)..."
xelatex -interaction=nonstopmode -synctex=1 main.tex

echo "Compiling main.tex with xelatex (pass 2/3)..."
xelatex -interaction=nonstopmode -synctex=1 main.tex

echo "Compiling main.tex with xelatex (pass 3/3)..."
xelatex -interaction=nonstopmode -synctex=1 main.tex

echo "Compilation complete. Output: main.pdf"
