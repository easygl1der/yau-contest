import os
import re

base_dir = '/Volumes/SSK SSD/Projects/yau-contest/latex-project/content'

files_to_fix = [
    'split_analysis/analysis_2019.tex',
    'split_analysis/analysis_2020.tex',
    'split_algebra/algebra_2011.tex',
    'split_algebra/algebra_2017.tex',
    'split_algebra/algebra_2018.tex',
    'split_algebra/algebra_2019.tex',
    'split_algebra/algebra_2020.tex'
]

def fix_display_math(content):
    # Replace $$ ... $$ with \[ ... \]
    # Using a non-greedy match for everything inside $$...$$
    return re.sub(r'\$\$(.*?)\$\$', r'\\[\1\\]', content, flags=re.DOTALL)

def fix_enumerate(content):
    # This is trickier. We need to find patterns like:
    # (a) ...
    # (b) ...
    # and wrap them in \begin{enumerate} \item ... \end{enumerate}
    # However, we must be careful to only do this inside exercise and solution environments,
    # and not mess up existing enumerates.
    
    def process_env(match):
        env_name = match.group(1)
        env_content = match.group(2)
        
        # Check if there are manual (a), (b), etc. at the start of lines
        # Sometimes they might have a space before them.
        pattern = r'^(\s*)\(([a-z])\)\s+(.*)'
        
        lines = env_content.split('\n')
        new_lines = []
        in_enum = False
        
        for i, line in enumerate(lines):
            m = re.match(pattern, line)
            if m:
                if not in_enum:
                    new_lines.append(m.group(1) + '\\begin{enumerate}')
                    in_enum = True
                new_lines.append(m.group(1) + '\\item ' + m.group(3))
            else:
                # If we hit an empty line, we might still be in the enumerate item
                # Let's keep it simple: if we hit another item, it's matched.
                # If we hit a line that doesn't start with (a), (b), but we are in_enum,
                # it's just continuation of the item. 
                # We should close enumerate at the end of the environment.
                new_lines.append(line)
                
        if in_enum:
            # check indentation of last item to match
            new_lines.append('\\end{enumerate}')
            
        return f'\\begin{{{env_name}}}{chr(10)}' + '\n'.join(new_lines) + f'{chr(10)}\\end{{{env_name}}}'

    # Process both exercise and solution environments
    content = re.sub(r'\\begin\{(exercise|solution)\}\n(.*?)\n\\end\{\1\}', process_env, content, flags=re.DOTALL)
    
    # Also standardize \item[(a)] to \item inside enumerate
    content = re.sub(r'\\item\[\([a-z]\)\]', r'\\item', content)
    
    return content

for file_path in files_to_fix:
    full_path = os.path.join(base_dir, file_path)
    if not os.path.exists(full_path):
        print(f"File not found: {full_path}")
        continue
        
    with open(full_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    original_content = content
    
    # 1. Fix subsections for 2020
    if '2020' in file_path:
        content = re.sub(r'\\subsection\*?\{Exam\}', r'\\subsection{Individual \\& Team}', content)
        
    # 2. Fix display math
    content = fix_display_math(content)
    
    # 3. Fix enumerate
    content = fix_enumerate(content)
    
    if content != original_content:
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Fixed {file_path}")
    else:
        print(f"No changes needed for {file_path}")

print("Done.")
