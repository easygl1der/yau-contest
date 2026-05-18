import os
import re

def get_tex_content(year):
    path = f"latex-project/content/split_applied/applied_{year}.tex"
    if not os.path.exists(path):
        return None
    with open(path, 'r') as f:
        return f.read()

def get_md_content(year):
    # Try individual first
    paths = [
        f"应用与计算数学/transcript/{year}_Applied-individual/hybrid_ocr/{year}_Applied-individual.md",
        f"应用与计算数学/transcript/{year}_Applied/hybrid_ocr/{year}_Applied.md",
        f"应用与计算数学/transcript/Applied_{year}/hybrid_ocr/Applied_{year}.md" # Some might be named differently
    ]
    for path in paths:
        if os.path.exists(path):
            with open(path, 'r') as f:
                return f.read()
    return None

def main():
    years = range(2010, 2026)
    for year in years:
        tex = get_tex_content(year)
        md = get_md_content(year)
        
        if not tex:
            print(f"{year}: LaTeX file missing")
            continue
        if not md:
            # Try to find directory
            dir_path = f"应用与计算数学/transcript/"
            found = False
            if os.path.exists(dir_path):
                for d in os.listdir(dir_path):
                    if str(year) in d and "Applied" in d:
                        md_path = f"{dir_path}/{d}/hybrid_ocr/{d}.md"
                        if os.path.exists(md_path):
                            with open(md_path, 'r') as f:
                                md = f.read()
                            found = True
                            break
            if not found:
                print(f"{year}: Transcript missing")
                continue
        
        # Simple check: extract first exercise question
        tex_match = re.search(r'\\begin{exercise}(.*?)\\end{exercise}', tex, re.DOTALL)
        if tex_match:
            tex_ex = tex_match.group(1).strip()
            # Clean up latex commands for comparison
            tex_ex_clean = re.sub(r'\\[a-zA-Z]+', '', tex_ex).replace('{', '').replace('}', '').strip()
            
            # Find a snippet from MD that should be in the first exercise
            # MD exercises are often numbered 1. 2. 3.
            md_match = re.search(r'1\.(.*?)(?=2\.)', md, re.DOTALL)
            if not md_match:
                md_match = re.search(r'\(1\)(.*?)(?=\(2\))', md, re.DOTALL)
            
            if md_match:
                md_ex = md_match.group(1).strip()
                # Check if some key words overlap
                md_words = set(re.findall(r'\w+', md_ex.lower()))
                tex_words = set(re.findall(r'\w+', tex_ex_clean.lower()))
                
                common = md_words.intersection(tex_words)
                # Filter out very common short words
                common = {w for w in common if len(w) > 3}
                
                if len(common) > 2:
                    print(f"{year}: LIKELY CONSISTENT (common words: {list(common)[:5]})")
                else:
                    print(f"{year}: DISCREPANCY FOUND")
                    print(f"  LaTeX snippet: {tex_ex[:100]}...")
                    print(f"  MD snippet: {md_ex[:100]}...")
            else:
                print(f"{year}: Could not find first exercise in MD")
        else:
            print(f"{year}: Could not find exercise in LaTeX")

if __name__ == "__main__":
    main()
