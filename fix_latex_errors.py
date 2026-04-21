import re
import os
import glob

base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Pattern: \[ followed by content ending in ; or , then \item
    # We want to insert \] before \item
    # Regex for unclosed \[ before \item
    # This is tricky with regex. Let's look for \[ that doesn't have a \] before the next \item or \end
    
    parts = re.split(r'(\\item|\\end\{itemize\}|\\end\{enumerate\})', content)
    new_content = ""
    for i in range(len(parts)):
        part = parts[i]
        # If we just saw an open \[ in this part that wasn't closed
        # (This is a simplified check)
        open_math = part.count('\\[')
        close_math = part.count('\\]')
        if open_math > close_math and i < len(parts) - 1:
            # Check if the last math block is unclosed
            last_open = part.rfind('\\[')
            last_close = part.rfind('\\]')
            if last_open > last_close:
                # Unclosed!
                # Fix it by adding \] before the next \item or \end
                part = part.rstrip() + "\n\\]\n"
        
        new_content += part
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Fixed unclosed math in {filepath}")

# Find all tex files
tex_files = glob.glob(os.path.join(base_dir, "**/*.tex"), recursive=True)
for f in tex_files:
    fix_file(f)

print("Finished fixing LaTeX errors.")
