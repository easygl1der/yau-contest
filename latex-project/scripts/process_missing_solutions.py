import os
import glob
import subprocess
from concurrent.futures import ThreadPoolExecutor

base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"

# Define the search patterns for each subject
patterns = [
    os.path.join(base_dir, 'split_algebra', 'algebra_*.tex'),
    os.path.join(base_dir, 'analysis_*.tex'),
    os.path.join(base_dir, 'split_applied', 'applied_*.tex'),
    os.path.join(base_dir, 'split_geometry', 'geometry_*.tex'),
    os.path.join(base_dir, 'split_probability', 'probability_*.tex'),
    os.path.join(base_dir, 'split_physics', 'physics_*.tex')
]

all_files = []
for p in patterns:
    all_files.extend(glob.glob(p))

files_to_process = []

for filepath in all_files:
    if "intro" in filepath:
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    ex_count = content.count('\\begin{exercise}')
    sol_count = content.count('\\begin{solution}')
    
    if ex_count > sol_count:
        files_to_process.append(filepath)

print(f"Found {len(files_to_process)} files needing solutions out of {len(all_files)} total files.")

def process_file(filepath):
    filename = os.path.basename(filepath)
    print(f"Starting subagent for {filename}...")
    prompt = (
        f"Read the file at {filepath}. "
        "For every \\begin{exercise} ... \\end{exercise} block that does NOT have a \\begin{solution} block immediately after it, "
        "add a detailed, rigorous, graduate-level mathematical solution. "
        "Wrap each solution in a \\begin{solution} ... \\end{solution} environment immediately after the exercise. "
        "Overwrite the file with the fully updated content. Make sure valid LaTeX is used and no exercises are skipped."
    )
    cmd = f'export PATH=/Users/yueyh/.nvm/versions/node/v22.22.0/bin:$PATH; gemini -y -p "{prompt}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode == 0:
        print(f"Subagent successfully completed {filename}")
    else:
        print(f"Subagent failed for {filename}. Error snippet: {result.stderr[:200]}")

if files_to_process:
    print(f"Dispatching {len(files_to_process)} subagents concurrently...")
    # Use max_workers=3 to avoid rate limits
    with ThreadPoolExecutor(max_workers=3) as executor:
        executor.map(process_file, files_to_process)
    print("All missing solutions have been processed!")
else:
    print("All files already have solutions for their exercises.")
