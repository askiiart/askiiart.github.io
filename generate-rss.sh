#!/usr/bin/env bash

# Makes RSS feed (feed.xml)
# Currently missing description and pubDate
# Based off https://en.wikipedia.org/wiki/RSS, particularly the example
printf "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">\n\n<channel>\n  <title>askiiart.net</title>\n  <description>The feed for askiiart.net, I guess</description>\n  <link>https://askiiart.net</link>\n  <lastBuildDate>$(TZ='UTC' date --rfc-2822)</lastBuildDate>" >feed.xml
find . -name "*.html" | while read -r item; do
    # Skip template.html, wishlist.html, resume.html, and portfolio.html
    if [[ ${item} == "./template.html" || ${item} == "./wishlist.html" || ${item} == "./resume.html" || ${item} == "./portfolio.html" ]]; then
        continue
    fi
    item="${item%.*}"
    item="${item#./}"
    TITLE=$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)
    printf "\n  <item>\n    <title>${TITLE}</title>\n    <link>https://askiiart.net/${item}.html</link>\n  </item>" >>feed.xml
done
printf "\n\n</channel>\n</rss>" >>feed.xml