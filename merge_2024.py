import re
import os

with open('/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_algebra/algebra_2024.tex', 'r') as f:
    tex = f.read()

with open('/Volumes/SSK SSD/Projects/yau-contest/solutions_2024.txt', 'r') as f:
    sols = f.read().split('---SOLUTION_SEPARATOR---')

# Split tex by \end{exercise}
parts = tex.split('\\end{exercise}')
if len(parts) - 1 != len(sols):
    print(f"Error: {len(parts)-1} exercises in tex, but {len(sols)} solutions found.")
else:
    merged = ""
    for i in range(len(sols)):
        merged += parts[i] + "\\end{exercise}\n\\begin{solution}\n" + sols[i].strip() + "\n\\end{solution}\n"
    merged += parts[-1]
    
    with open('/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_algebra/algebra_2024.tex', 'w') as f:
        f.write(merged)
    print("Merged 2024 solutions successfully.")
