#!/bin/bash

# Compile LaTeX twice with synctex for forward/reverse search

cd "$(dirname "$0")"

echo "Compiling main.tex (pass 1/2)..."
pdflatex -interaction=nonstopmode -synctex=1 main.tex

echo "Compiling main.tex (pass 2/2)..."
pdflatex -interaction=nonstopmode -synctex=1 main.tex

echo "Compilation complete. Output: main.pdf"
