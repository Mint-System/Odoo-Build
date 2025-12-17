#!/usr/bin/env python3

import os
import glob

def rename_snippet_files():
    # Get all XML files in the snippets folder
    xml_files = glob.glob("snippets/*.xml")
    
    for file_path in xml_files:
        # Get the basename (filename only)
        filename = os.path.basename(file_path)
        
        # Create the new filename with mint_system. prefix
        new_filename = f"mint_system.{filename}"
        new_file_path = os.path.join("snippets", new_filename)
        
        # Rename the file
        os.rename(file_path, new_file_path)
        print(f"Renamed: {filename} -> {new_filename}")

if __name__ == "__main__":
    rename_snippet_files()