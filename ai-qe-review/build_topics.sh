#!/usr/bin/env bash
set -e

AI_QE_DIR="$(cd "$(dirname "$0")" && pwd)"
TOPICS_DIR="$AI_QE_DIR/topics"

compile_topic() {
    folder="$1"
    name="$2"
    TARGET_DIR="$TOPICS_DIR/$folder"
    echo "----------------------------------------"
    echo "Building $folder/$name.tex ..."
    
    cd "$TARGET_DIR"
    ln -sf "../../refs.bib" "refs.bib"
    
    # Standalone ctexart sources live in this directory (no \input of chapters/).
    # -synctex=1: PDF ↔ TeX inverse/forward search (editor jump)
    if ! xelatex -synctex=1 -interaction=nonstopmode -file-line-error "$name.tex" > "$name.build.log" 2>&1; then
        echo "⚠️  first xelatex pass reported errors (see $name.build.log)"
    fi
    biber "$name" >> "$name.build.log" 2>&1 || true
    if ! xelatex -synctex=1 -interaction=nonstopmode -file-line-error "$name.tex" >> "$name.build.log" 2>&1; then
        echo "⚠️  second xelatex pass reported errors (see $name.build.log)"
    fi
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error "$name.tex" >> "$name.build.log" 2>&1 || true
    
    if [ -f "$name.pdf" ] && [ -f "$name.synctex.gz" ]; then
        # SyncTeX should point into this directory's .tex, not chapters/topics/
        if gzip -dc "$name.synctex.gz" 2>/dev/null | head -c 20000 | grep -q "chapters/topics"; then
            echo "⚠️  SyncTeX still references chapters/topics (unexpected for standalone article)"
        fi
        echo "✅ Success: topics/$folder/$name.pdf + SyncTeX ($(du -h "$name.pdf" | cut -f1))"
    elif [ -f "$name.pdf" ]; then
        echo "⚠️  PDF ok but missing SyncTeX: topics/$folder/$name.pdf"
    else
        echo "❌ Error: topics/$folder/$name.pdf failed to generate (see $name.build.log)"
        rg -n 'Error|!' "$name.build.log" | head -20 || true
    fi
}

echo "=== Compiling Topic PDFs in Subdirectories ==="

compile_topic "00-syllabus" "syllabus"
compile_topic "01-ml-theory" "ml_theory"
compile_topic "02-deep-rl" "deep_rl"
compile_topic "03-optimization" "optimization"
compile_topic "04-nlu" "nlu"

echo "========================================"
echo "All 5 topic PDFs built with custom filenames!"
