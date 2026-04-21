import os
import glob

out_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_algebra"
files = sorted(glob.glob(os.path.join(out_dir, "algebra_*.tex")))
# Ensure correct order: algebra_intro_0.tex, algebra_2010.tex, ...
intro_files = [f for f in files if "intro" in f]
year_files = [f for f in files if "intro" not in f]

all_files = intro_files + year_files

content = ""
for f in all_files:
    with open(f, 'r') as fp:
        content += fp.read()

with open("/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/algebra.tex", 'w') as fp:
    fp.write(content)
print("Merged all files back to algebra.tex")
