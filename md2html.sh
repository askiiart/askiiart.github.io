#!/usr/bin/env bash
set -e

git status --porcelain | awk 'match($1, "(M|A|\?\?)"){print $2}' | while read -r item; do
    if [[ ${item} == *.md ]]; then
        item="${item%.*}"
        echo "Currently processing ${item}"
        pandoc -f markdown-smart --data-dir . --template ${dir}/template.html -t html -o ${item}.html ${item}.md --metadata title="$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)"
    fi
done
