#!/bin/bash
FILE="mathematical-statistics-notes"

for i in 1 2 3; do
    xelatex -interaction=nonstopmode -synctex=1 "$FILE.tex" > /dev/null 2>&1
done
