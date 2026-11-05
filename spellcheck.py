#!/usr/bin/env python3
import os
import re
import sys
from spellchecker import SpellChecker

def main():
    # Initialize the spellchecker for Italian
    spell = SpellChecker(language='it')

    # Optional: Load custom whitelist terms if the file exists
    whitelist_file = 'custom-whitelist.txt'
    if os.path.exists(whitelist_file):
        with open(whitelist_file, 'r', encoding='utf-8') as f:
            custom_words = [line.strip().lower() for line in f if line.strip() and not line.startswith('#')]
            spell.word_frequency.load_words(custom_words)

    failed = False

    # Recursively look for .typ files inside src/
    for root, _, files in os.walk('src'):
        for file in files:
            # Check if it's a Typst file and does NOT start with 'template_'
            if file.endswith('.typ') and not file.startswith('template_'):
                filepath = os.path.join(root, file)
                print(f"Checking spelling in: {filepath}")

                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()

                # Strip Typst comments to avoid false positives
                content = re.sub(r'//.*', '', content)
                content = re.sub(r'/\*.*?\*/', '', flags=re.DOTALL, string=content)

                # Extract words, including Italian accented characters (à, è, é, ì, ò, ù)
                words = re.findall(r'\b[a-zA-ZàèéìòùÀÈÉÌÒÙ]+\b', content)

                # Filter out short words (length <= 2) to avoid false triggers on code/variables
                words = [w.lower() for w in words if len(w) > 2]

                # Find misspelled words
                misspelled = spell.unknown(words)

                if misspelled:
                    print(f"::error file={filepath}::Potential Italian spelling errors found:")
                    for word in sorted(misspelled):
                        print(f"  - {word}")
                    failed = True

    if failed:
        print("\nSpell check failed! Please fix errors or add terms to custom-whitelist.txt.")
        sys.exit(1)
    else:
        print("\nSpell check passed successfully!")

if __name__ == '__main__':
    main()
