import re
import os

file_path = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/algebra.tex"
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Split the content by \section{Year 
parts = re.split(r'(?=\\section\{Year )', content)

out_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_algebra"
os.makedirs(out_dir, exist_ok=True)

for i, part in enumerate(parts):
    if not part.strip():
        continue
    # Find the year
    match = re.search(r'\\section\{Year (\d{4})\}', part)
    if match:
        year = match.group(1)
        out_name = f"algebra_{year}.tex"
    else:
        out_name = f"algebra_intro_{i}.tex"
    
    with open(os.path.join(out_dir, out_name), 'w', encoding='utf-8') as f:
        f.write(part)

print(f"Split into {len(parts)} parts in {out_dir}")
