import re
import os

subjects = ['applied', 'geometry', 'physics', 'probability']
base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"

for subj in subjects:
    file_path = os.path.join(base_dir, f"{subj}.tex")
    if not os.path.exists(file_path):
        continue
        
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find the sections like \section{2011} or \section{Year 2011} or \section{2011 - Applied Math}
    parts = re.split(r'(?=\\section\{.*?\d{4}.*?\})', content)
    
    out_dir = os.path.join(base_dir, f"split_{subj}")
    os.makedirs(out_dir, exist_ok=True)
    
    for i, part in enumerate(parts):
        if not part.strip():
            continue
        match = re.search(r'\\section\{.*?(\d{4}).*?\}', part)
        if match:
            year = match.group(1)
            out_name = f"{subj}_{year}.tex"
        else:
            out_name = f"{subj}_intro_{i}.tex"
            
        with open(os.path.join(out_dir, out_name), 'w', encoding='utf-8') as f:
            f.write(part)
    
    print(f"Split {subj} into {len(parts)} parts in {out_dir}")

