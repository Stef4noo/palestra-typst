#!/usr/bin/env python3
import os
import re
import sys
import string
from spellchecker import SpellChecker

def main():
    # Initialize spell checkers for both Italian and English
    spell_it = SpellChecker(language='it')
    spell_en = SpellChecker(language='en')

    # Load custom whitelist terms if the file exists
    whitelist_file = 'custom-whitelist.txt'
    if os.path.exists(whitelist_file):
        with open(whitelist_file, 'r', encoding='utf-8') as f:
            custom_words = [line.strip().lower() for line in f if line.strip() and not line.startswith('#')]
            spell_it.word_frequency.load_words(custom_words)
            spell_en.word_frequency.load_words(custom_words)

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

                # Extract words, including Italian accented characters
                raw_words = re.findall(r'\b[a-zA-ZàèéìòùÀÈÉÌÒÙ]+\b', content)

                # Clean words: remove punctuation, lowercase, filter out short tokens (<= 2 chars)
                clean_words = []
                for w in raw_words:
                    word_clean = w.strip(string.punctuation).lower()
                    if len(word_clean) > 2:
                        clean_words.append(word_clean)

                # Find words unknown to BOTH dictionaries
                unknown_it = spell_it.unknown(clean_words)
                unknown_en = spell_en.unknown(clean_words)
                misspelled = unknown_it.intersection(unknown_en)

                if misspelled:
                    print(f"::error file={filepath}::Potential spelling errors found (IT/EN):")
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
