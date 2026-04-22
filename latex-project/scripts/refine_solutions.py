import os
import re
import glob
from google import genai
from google.genai import types
import time

# Initialize client
client = genai.Client()

def refine_solution(exercise_text, solution_text):
    prompt = f"""You are an expert mathematics tutor. Your task is to rewrite the given mathematical solution to make it highly detailed and easy to understand for a beginner in math (a junior student with little background in college math).

Exercise:
{exercise_text}

Original Solution:
{solution_text}

Instructions:
1. Explain every step in detail. Do not skip any algebraic or logical steps.
2. Clearly state any theorems or formulas used.
3. Keep the output ONLY as the LaTeX content that should go inside \\begin{{solution}} and \\end{{solution}}. Do NOT wrap it in \\begin{{solution}}...\\end{{solution}} tags.
4. Maintain a rigorous but accessible tone.
5. Use standard LaTeX math formatting.
"""
    for attempt in range(10):
        try:
            response = client.models.generate_content(
                model='gemini-2.5-flash',
                contents=prompt,
            )
            return response.text.strip()
        except Exception as e:
            err_str = str(e)
            if '429' in err_str or '503' in err_str:
                wait_time = 2**attempt * 5
                print(f"API busy or rate limit hit. Sleeping for {wait_time} seconds...")
                time.sleep(wait_time)
            else:
                print(f"Error generating content: {e}")
                time.sleep(5)
    return None

def process_file(filepath):
    print(f"\\n--- Processing {filepath} ---")
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    pattern = re.compile(r'(\\begin\{exercise\}(.*?)\\end\{exercise\})\s*\\begin\{solution\}(.*?)\\end\{solution\}', re.DOTALL)
    
    matches = list(pattern.finditer(content))
    if not matches:
        print(f"No exercises found in {filepath}")
        return
    
    new_content = content
    # Process sequentially backwards so indices don't change
    for match in reversed(matches):
        full_exercise_block = match.group(1)
        exercise_content = match.group(2)
        old_solution = match.group(3)
        
        print("  Refining a solution...")
        new_solution = refine_solution(exercise_content, old_solution)
        
        # Enforce rate limit (15 requests per minute -> 4 seconds per request)
        time.sleep(4.5)
        
        if new_solution:
            if new_solution.startswith('```latex'):
                new_solution = new_solution[8:]
            if new_solution.startswith('```'):
                new_solution = new_solution[3:]
            if new_solution.endswith('```'):
                new_solution = new_solution[:-3]
            new_solution = new_solution.strip()
            
            replacement = f"{full_exercise_block}\n\n\\begin{{solution}}\n{new_solution}\n\\end{{solution}}"
            new_content = new_content[:match.start()] + replacement + new_content[match.end():]
        else:
            print("  Failed to refine a solution.")

    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath} successfully.")
    else:
        print(f"No changes made to {filepath}")

def main():
    base_dir = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content"
    subjects = ['split_analysis', 'split_applied', 'split_geometry', 'split_probability', 'split_physics', 'split_algebra']
    
    files_to_process = []
    for subj in subjects:
        subj_dir = os.path.join(base_dir, subj)
        if os.path.exists(subj_dir):
            files_to_process.extend(glob.glob(os.path.join(subj_dir, '*.tex')))
    
    print(f"Found {len(files_to_process)} files to process sequentially to respect API limits.")
    
    for file in files_to_process:
        process_file(file)

if __name__ == "__main__":
    main()
