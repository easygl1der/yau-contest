import os
import re
import glob
from concurrent.futures import ThreadPoolExecutor

base_dir = "latex-project/content"
all_tex_files = glob.glob(os.path.join(base_dir, "**/*.tex"), recursive=True)
files_to_analyze = [f for f in all_tex_files if ("split_" in f or "analysis_" in f) and "intro" not in f and "algebra" in f or "analysis" in f or "applied" in f or "geometry" in f or "physics" in f or "probability" in f]

def analyze_file(filepath):
    filename = os.path.basename(filepath)
    print(f"Analyzing {filename} with subagent...")
    prompt = (
        f"Read the LaTeX file: {filepath}. "
        "1. Read every single exercise carefully. "
        "2. Identify the specific knowledge points and question types for EACH exercise. "
        "3. Output a summary: 'Year: YYYY Subject: SSS Q1: [Topic], Q2: [Topic]...'."
    )
    cmd = f'export PATH=/Users/yueyh/.nvm/versions/node/v22.22.0/bin:$PATH; gemini -y -p "{prompt}"'
    result = os.popen(cmd).read()
    with open(f"{filepath}.summary", "w") as f:
        f.write(result)

with ThreadPoolExecutor(max_workers=8) as executor:
    executor.map(analyze_file, files_to_analyze)
