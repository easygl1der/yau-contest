import os
import re
import shutil

dir_mapping = {
    '代数与数论': 'Algebra',
    '几何与拓扑': 'Geometry',
    '分析与微分方程': 'Analysis',
    '应用与计算数学': 'Applied',
    '数学物理': 'Physics',
    '概率与统计': 'Probability'
}

def get_actual_year(md_path):
    if not os.path.exists(md_path):
        return None
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
        match = re.search(r'S\.-T\. Yau.*?(\d{4})', content, re.IGNORECASE | re.DOTALL)
        if match:
            return match.group(1)
    return None

def get_type(filename):
    filename = filename.lower()
    if 'soln' in filename or 'solution' in filename:
        return 'soln'
    if 'team' in filename:
        return 'team'
    if 'individual' in filename or 'indi' in filename:
        return 'individual'
    return 'individual' # Default to individual as per observations

def perform_rename(old_path, new_path):
    if old_path == new_path:
        return False
    if os.path.exists(new_path):
        base, ext = os.path.splitext(new_path)
        new_path = f"{base}_v2{ext}"
    
    print(f"Renaming: {old_path} -> {new_path}")
    os.rename(old_path, new_path)
    return True

def process_all():
    renames_performed = []

    for chinese_dir, english_subject in dir_mapping.items():
        if not os.path.exists(chinese_dir):
            continue
        
        print(f"Processing directory: {chinese_dir} ({english_subject})")
        
        files = [f for f in os.listdir(chinese_dir) if f.endswith('.pdf')]
        
        for filename in files:
            old_pdf_path = os.path.join(chinese_dir, filename)
            base_name = filename[:-4]
            
            # Specific overrides for Geometry
            if english_subject == 'Geometry':
                if filename == '2023_Geometry.pdf':
                    new_year = '2025'
                elif filename == '2024_Geometry.pdf':
                    new_year = '2024'
                elif filename == '2022_Geometry.pdf':
                    new_year = '2022'
                elif filename == '2021_Geometry.pdf':
                    new_year = '2021'
                elif filename == '2020_Geometry.pdf':
                    new_year = '2020'
                else:
                    new_year = None # Fallback to auto-detection
            else:
                new_year = None

            # Auto-detection if not overridden
            transcript_folder = os.path.join(chinese_dir, 'transcript', base_name)
            md_path = os.path.join(transcript_folder, 'hybrid_ocr', f"{base_name}.md")
            
            if new_year is None:
                detected_year = get_actual_year(md_path)
                if detected_year:
                    new_year = detected_year
                else:
                    # Try to extract year from filename
                    year_match = re.search(r'(\d{4})', filename)
                    new_year = year_match.group(1) if year_match else "0000"

            item_type = get_type(filename)
            new_base_name = f"{new_year}_{english_subject}-{item_type}"
            new_filename = f"{new_base_name}.pdf"
            new_pdf_path = os.path.join(chinese_dir, new_filename)

            # Rename PDF
            if old_pdf_path != new_pdf_path:
                # Check for conflict and use _v2 if needed
                target_pdf_path = new_pdf_path
                while os.path.exists(target_pdf_path) and target_pdf_path != old_pdf_path:
                     base, ext = os.path.splitext(target_pdf_path)
                     target_pdf_path = f"{base}_v2{ext}"
                
                if target_pdf_path != old_pdf_path:
                    print(f"Renaming PDF: {old_pdf_path} -> {target_pdf_path}")
                    os.rename(old_pdf_path, target_pdf_path)
                    renames_performed.append(f"PDF: {old_pdf_path} -> {target_pdf_path}")
                    
                    # Update new_base_name for transcript folder
                    new_base_name = os.path.basename(target_pdf_path)[:-4]

            # Rename transcript folder and contents
            if os.path.exists(transcript_folder):
                new_transcript_folder = os.path.join(chinese_dir, 'transcript', new_base_name)
                
                if transcript_folder != new_transcript_folder:
                    # Rename files inside the folder first
                    for root, dirs, files_in_folder in os.walk(transcript_folder):
                        for f in files_in_folder:
                            if f.startswith(base_name):
                                old_f_path = os.path.join(root, f)
                                new_f_name = f.replace(base_name, new_base_name, 1)
                                new_f_path = os.path.join(root, new_f_name)
                                os.rename(old_f_path, new_f_path)
                    
                    # Rename the folder itself
                    print(f"Renaming transcript folder: {transcript_folder} -> {new_transcript_folder}")
                    os.rename(transcript_folder, new_transcript_folder)
                    renames_performed.append(f"Folder: {transcript_folder} -> {new_transcript_folder}")

    return renames_performed

if __name__ == "__main__":
    renames = process_all()
    print("\nSummary of renames:")
    for r in renames:
        print(r)
