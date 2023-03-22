import os
from glob import glob

# pandoc --data-dir /big-stuff/files/websites/personal-site/html --template template.html -t html -o index.html index.md
os.chdir('/big-stuff/files/websites/personal-site/html')
md_files = glob('*.md')
md_files_no_ext = []

for item in md_files:
    md_files_no_ext.append(item[:-3])

for item in md_files_no_ext:
    os.system(f'pandoc -f markdown-smart --data-dir /big-stuff/files/websites/personal-site/html --template template.html -t html -o {item}.html {item}.md')
