import re

with open('analysis.tex', 'r') as f:
    content = f.read()

parts = re.split(r'(\\section\{.*?\})', content)
preamble = parts[0]

output = preamble

sections = len(parts) // 2

import os

for i in range(sections):
    header = parts[i*2+1]
    body = parts[i*2+2]
    
    match = re.search(r'\\section\{(\d+)\s+Analysis\}', header)
    if match:
        year = match.group(1)
        filename = f"analysis_{year}.tex"
        
        with open(filename, 'w') as f:
            f.write(header + body)
        
        output += f"\\input{{{filename}}}\n\n"
    else:
        # just append if not matching year
        output += header + body

with open('analysis.tex', 'w') as f:
    f.write(output)

print("Finished splitting")
