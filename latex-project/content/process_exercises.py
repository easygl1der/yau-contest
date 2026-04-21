import os
import subprocess
from concurrent.futures import ThreadPoolExecutor

files = [f"analysis_{year}.tex" for year in range(2010, 2026)]

def process_file(file):
    print(f"Starting {file}...")
    prompt = (
        f"Read {file}. For every exercise, add a detailed mathematical solution directly after the \\end{{exercise}} block. "
        "Use the \\begin{solution} and \\end{solution} environment. "
        "The solutions should be as detailed as possible. "
        "Do not leave any exercise without a solution. "
        "Once done, save the changes to the file. Ensure valid LaTeX syntax."
    )
    cmd = f'export PATH=/Users/yueyh/.nvm/versions/node/v22.22.0/bin:$PATH; gemini -y -p "{prompt}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"Success for {file}")
    else:
        print(f"Failed for {file}:\n{result.stderr}\n{result.stdout}")

with ThreadPoolExecutor(max_workers=3) as executor:
    executor.map(process_file, files)

print("All done!")
