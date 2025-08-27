#!/bin/bash

# Workmate Documentation to DOCX Converter Script
# This script automates the process of converting MkDocs documentation to a single DOCX file

set -e  # Exit on any error

echo "🚀 Workmate Documentation to DOCX Converter"
echo "============================================="

# Check if Poetry is installed
if ! command -v poetry &> /dev/null; then
    echo "❌ Poetry is not installed. Please install Poetry first:"
    echo "   curl -sSL https://install.python-poetry.org | python3 -"
    exit 1
fi

echo "✅ Poetry found"

# Check if we're in the correct directory
if [ ! -f "mkdocs.yml" ]; then
    echo "❌ mkdocs.yml not found. Please run this script from the project root directory."
    exit 1
fi

echo "✅ Project structure validated"

# Install dependencies using Poetry
echo "📦 Installing dependencies..."
if poetry install; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

# Set output filename
OUTPUT_FILE=${1:-"workmate_documentation.docx"}

echo "📄 Converting documentation to DOCX..."
echo "   Output file: $OUTPUT_FILE"

# Run the conversion script
if poetry run python convert_to_docx.py "$OUTPUT_FILE"; then
    echo ""
    echo "🎉 Conversion completed successfully!"
    echo "📁 Output file: $(pwd)/$OUTPUT_FILE"
    
    # Show file size if the file exists
    if [ -f "$OUTPUT_FILE" ]; then
        FILE_SIZE=$(ls -lh "$OUTPUT_FILE" | awk '{print $5}')
        echo "📊 File size: $FILE_SIZE"
    fi
    
    echo ""
    echo "💡 Tips:"
    echo "   • Open the file in Microsoft Word or LibreOffice Writer"
    echo "   • The document includes a table of contents based on your navigation structure"
    echo "   • Images are referenced but not embedded (due to compatibility reasons)"
    echo "   • All markdown formatting has been preserved as much as possible"
    
else
    echo "❌ Conversion failed. Please check the error messages above."
    exit 1
fi
