import os
import re
import glob
from concurrent.futures import ThreadPoolExecutor

base_dir = "latex-project/content"

def process_file_with_subagent(filepath):
    # Skip non-target files
    if not os.path.isfile(filepath): return
    
    print(f"Fixing {filepath}...")
    prompt = (
        f"Read the LaTeX file at {filepath}. "
        "Strictly perform the following fixes: "
        "1. Fix any broken environment closures (ensure all \\begin{...} have matching \\end{...} within exercise blocks). "
        "2. Fix syntax errors like \\item appearing in math mode (wrap in $ $). "
        "3. Ensure the LaTeX code is valid and compiles without errors. "
        "4. Overwrite the file with the corrected code."
    )
    cmd = f'export PATH=/Users/yueyh/.nvm/versions/node/v22.22.0/bin:$PATH; gemini -y -p "{prompt}"'
    os.system(cmd)

files = glob.glob(os.path.join(base_dir, "**/*.tex"), recursive=True)
# Filter to subject files and year files
files = [f for f in files if "split_" in f or any(s in f for s in ["algebra.tex", "analysis.tex", "applied.tex", "geometry.tex", "physics.tex", "probability.tex"])]

with ThreadPoolExecutor(max_workers=6) as executor:
    executor.map(process_file_with_subagent, files)
