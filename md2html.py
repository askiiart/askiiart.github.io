import os
from pathlib import Path

dir = os.path.dirname(__file__)
os.chdir(dir)
files = [str(item)[:-3] for item in Path(dir).rglob('*.md')]

for item in files:
    os.system(f'pandoc -f markdown-smart --data-dir . --template template.html -t html -o {item}.html {item}.md --metadata title=\"$(grep -m 1 -oP \'(?<=^# ).*\' {item}.md | cat)\"')
