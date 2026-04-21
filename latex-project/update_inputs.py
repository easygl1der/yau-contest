import os
import glob

subjects = ['algebra', 'analysis', 'applied', 'geometry', 'physics', 'probability']
content_dir = '/Volumes/SSK SSD/Projects/yau-contest/latex-project/content'

for subj in subjects:
    split_dir = os.path.join(content_dir, f'split_{subj}')
    if not os.path.isdir(split_dir): continue
    
    files = [f for f in os.listdir(split_dir) if f.endswith('.tex') and not f.endswith('summary')]
    
    # Sort files properly so intro comes first
    def sort_key(f):
        if 'intro' in f: return -1
        try:
            return int(''.join(filter(str.isdigit, f)))
        except ValueError:
            return 9999
            
    files.sort(key=sort_key)
    
    out_path = os.path.join(content_dir, f'{subj}.tex')
    with open(out_path, 'w') as f:
        for file in files:
            f.write(f"\\input{{content/split_{subj}/{file.replace('.tex', '')}}}\n")
            
print("Updated all content files to input from split directories.")
