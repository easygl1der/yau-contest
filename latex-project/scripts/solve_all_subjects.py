import os
import subprocess
from concurrent.futures import ThreadPoolExecutor
import glob

# Define the directories and file patterns for all subjects
subjects = {
    'analysis': 'analysis_*.tex',
    'applied': 'split_applied/applied_*.tex',
    'geometry': 'split_geometry/geometry_*.tex',
    'probability': 'split_probability/probability_*.tex',
    'physics': 'split_physics/physics_*.tex'
}

base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"

# Collect all files to process
all_files = []
for subj, pattern in subjects.items():
    # Only target 2024 and 2025 initially to act as an incremental update
    # as per the user's "incremental" request, avoiding massive parallel overloads
    for year in range(2024, 2026):
        if subj == 'analysis':
            filepath = os.path.join(base_dir, f"analysis_{year}.tex")
        else:
            filepath = os.path.join(base_dir, f"split_{subj}", f"{subj}_{year}.tex")
            
        if os.path.exists(filepath):
            all_files.append(filepath)

def process_file(filepath):
    filename = os.path.basename(filepath)
    print(f"Starting subagent for {filename}...")
    prompt = (
        f"Read the file at {filepath}. "
        "For every \\begin{exercise} ... \\end{exercise} block, add a detailed, rigorous, graduate-level mathematical solution. "
        "Wrap each solution in a \\begin{solution} ... \\end{solution} environment immediately after the exercise. "
        "Overwrite the file with the updated content. Do not skip any exercises."
    )
    # Call the Gemini CLI as a subagent
    cmd = f'export PATH=/Users/yueyh/.nvm/versions/node/v22.22.0/bin:$PATH; gemini -y -p "{prompt}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode == 0:
        print(f"Subagent successfully completed {filename}")
    else:
        print(f"Subagent failed for {filename}. See logs.")
        # Optionally print result.stderr for debugging

# Run the subagents concurrently
print(f"Dispatching {len(all_files)} subagents concurrently...")
with ThreadPoolExecutor(max_workers=5) as executor:
    executor.map(process_file, all_files)

print("Incremental processing completed. Merging split files back is the next step.")
