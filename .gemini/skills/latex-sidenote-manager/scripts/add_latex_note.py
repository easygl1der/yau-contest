import sys
import argparse
import os

def add_note(file_path, search_string, note_content, note_type):
    if not os.path.exists(file_path):
        print(f"Error: File {file_path} not found.")
        sys.exit(1)

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    if search_string not in content:
        print(f"Error: Search string '{search_string}' not found in {file_path}.")
        sys.exit(1)

    # Escape backslashes in note_content if necessary, 
    # but since we're using f-strings and raw strings, let's be careful.
    note_latex = f"\\{note_type}{{{note_content}}}"
    
    # We want to insert it right after the search string.
    # If the search string ends with a word, we might want to check if it's already there.
    if note_latex in content:
        print(f"Note already exists in {file_path}.")
        return

    new_content = content.replace(search_string, search_string + note_latex, 1)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Successfully added {note_type} to {file_path}.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Add a LaTeX note to a file.")
    parser.add_argument("file_path", help="Path to the .tex file")
    parser.add_argument("search_string", help="String after which to insert the note")
    parser.add_argument("note_content", help="Content of the note")
    parser.add_argument("--type", choices=["sidenote", "marginnote", "footnote"], default="sidenote", help="Type of note")

    args = parser.parse_args()
    add_note(args.file_path, args.search_string, args.note_content, args.type)
