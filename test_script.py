#!/usr/bin/env python3

print("Test script starting...")

try:
    import yaml
    print("✅ yaml imported")
    
    import markdown
    print("✅ markdown imported")
    
    from docx import Document
    print("✅ docx imported")
    
    from bs4 import BeautifulSoup
    print("✅ bs4 imported")
    
    from pathlib import Path
    print("✅ pathlib imported")
    
    # Test loading the mkdocs config
    config_file = Path("mkdocs.yml")
    print(f"📁 Config file exists: {config_file.exists()}")
    
    if config_file.exists():
        with open(config_file, 'r', encoding='utf-8') as f:
            config = yaml.safe_load(f)
        print(f"✅ Config loaded: {config.get('site_name', 'Unknown')}")
        print(f"📋 Navigation items: {len(config.get('nav', []))}")
    
    # Test creating a document
    doc = Document()
    doc.add_paragraph("Test paragraph")
    doc.save("test_output.docx")
    print("✅ Test DOCX created successfully")
    
    print("🎉 All tests passed!")
    
except Exception as e:
    print(f"❌ Error: {e}")
    import traceback
    traceback.print_exc()
