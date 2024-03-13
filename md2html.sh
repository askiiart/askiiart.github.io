#!/usr/bin/env bash
set -e

dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
find . -name "*.md" | while read -r item; do
    item="${item%.*}"
    echo "Currently processing ${item}"
    pandoc -f markdown-smart --data-dir . --template ${dir}/template.html -t html -o ${item}.html ${item}.md --metadata title="$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)"
    sed -i s/sourceCode\ /language-/g ${item}.html
    python3 $dir/regex-chicanery.py ${item}.html
done
