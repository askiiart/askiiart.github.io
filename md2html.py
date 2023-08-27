import os
from pathlib import Path

dir = os.path.dirname(__file__)
print(dir)
os.chdir(dir)
files = [str(item)[:-3] for item in Path(dir).rglob('*.md')]

for item in files:
    os.system(f'pandoc -f markdown-smart --data-dir . --template {dir}/template.html -t html -o {item}.html {item}.md --metadata title=\"$(grep -m 1 -oP \'(?<=^# ).*\' {item}.md | cat)\"')

# Replace 'language-' with 'language-' recursively
os.system("find . \( ! -regex '.*/\..*' \) -type f | xargs sed -i 's/language-/language-/g'")
