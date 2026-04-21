import os
import glob

subjects = ['applied', 'geometry', 'physics', 'probability']
base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"

for subj in subjects:
    out_dir = os.path.join(base_dir, f"split_{subj}")
    if not os.path.exists(out_dir):
        continue
        
    files = sorted(glob.glob(os.path.join(out_dir, f"{subj}_*.tex")))
    intro_files = [f for f in files if "intro" in f]
    year_files = [f for f in files if "intro" not in f]
    all_files = intro_files + year_files

    content = ""
    for f in all_files:
        with open(f, 'r', encoding='utf-8') as fp:
            content += fp.read()

    main_file = os.path.join(base_dir, f"{subj}.tex")
    with open(main_file, 'w', encoding='utf-8') as fp:
        fp.write(content)
        
    print(f"Merged {len(all_files)} files back to {subj}.tex")
