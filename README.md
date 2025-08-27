# Workmate Documentation

This repository contains the documentation for Workmate

## Live Documentation

The live documentation is available at: https://analytics-raising.github.io/workmate-docs/

## Local Development

To set up the documentation site locally:

1. Clone this repository:
   ```
   git clone https://github.com/Analytics-Raising/workmate-docs.git
   cd workmate-docs
   ```

2. Create and activate a virtual environment:
   ```
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. Install the dependencies:
   ```
   pip install mkdocs-material
   pip install mkdocs
   ```

4. Start the development server:
   ```
   mkdocs serve
   ```

5. Open your browser and go to `http://127.0.0.1:8000/`

## Deployment

The documentation is automatically deployed to GitHub Pages when changes are pushed to the main branch using GitHub Actions.

To manually deploy:

```
mkdocs gh-deploy
```

## Converting to DOCX

To convert the documentation to a single Word document with embedded images:

### Prerequisites

Make sure you have Poetry installed:
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

### Conversion Methods

#### Method 1: Using the Shell Script (Recommended)

1. Run the conversion script:
   ```bash
   ./convert_docs.sh
   ```

This script will automatically:
- Install all required dependencies via Poetry
- Run the conversion process
- Download and embed all images from URLs
- Generate `workmate_documentation.docx` in the project root

#### Method 2: Manual Conversion

1. Install the conversion dependencies:
   ```bash
   poetry install
   ```

2. Run the conversion script directly:
   ```bash
   poetry run python convert_to_docx.py [output_filename.docx]
   ```

### Output

The script will create a `workmate_documentation.docx` file that includes:
- Title page with document information
- Table of contents based on your navigation structure
- All documentation content in the order specified in `mkdocs.yml`
- **Embedded images** downloaded from URLs and local files
- Proper formatting for headings, lists, tables, and code blocks
- Image captions based on alt text

### Image Support

The converter supports:
- **Remote images**: Automatically downloads images from URLs (like your Tango.us screenshots)
- **Local images**: Embeds images from the local file system
- **Fallback handling**: If an image can't be loaded, it shows descriptive text instead
- **Automatic sizing**: Images are resized to fit properly in the document

### Customization

You can modify the `convert_to_docx.py` script to:
- Change the output filename
- Adjust document styling and image sizing
- Modify the conversion behavior
- Add custom formatting

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

[Add your license information here] 