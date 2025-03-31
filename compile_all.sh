#!/bin/bash

# First touch the cv_text.tex file to update its timestamp
touch cv_text.tex

# Find all .tex files and compile them
for file in *.tex; do
  # Skip cv_text.tex itself
  if [ "$file" != "cv_text.tex" ]; then
    echo "Compiling $file..."
    pdflatex -interaction=nonstopmode "$file"
    # Run twice to resolve references if needed
    pdflatex -interaction=nonstopmode "$file"
  fi
done

echo "All files compiled."