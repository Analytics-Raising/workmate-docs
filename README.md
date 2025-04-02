# Workmate Documentation

This repository contains the documentation for Workmate, built with [MkDocs](https://www.mkdocs.org/) and the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.

## Live Documentation

The live documentation is available at: https://yourusername.github.io/workmate-docs/

## Local Development

To set up the documentation site locally:

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/workmate-docs.git
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

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

[Add your license information here] 