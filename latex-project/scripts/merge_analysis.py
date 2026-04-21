import os
import glob

base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"
out_dir = os.path.join(base_dir, "split_analysis")
if os.path.exists(out_dir):
    files = sorted(glob.glob(os.path.join(out_dir, "analysis_*.tex")))
    content = ""
    for f in files:
        with open(f, 'r', encoding='utf-8') as fp:
            content += fp.read()
            content += "\n\n"
    
    with open(os.path.join(base_dir, "analysis.tex"), 'w', encoding='utf-8') as fp:
        fp.write(content)
    print("Merged Analysis files back to analysis.tex")
