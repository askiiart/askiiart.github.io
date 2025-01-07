#!/usr/bin/env bash

# Makes RSS feed (feed.xml)
# Currently missing description and pubDate
# Based off https://en.wikipedia.org/wiki/RSS, particularly the example
printf "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">\n\n<channel>\n  <title>askiiart.net</title>\n  <description>The feed for askiiart.net, I guess</description>\n  <link>https://askiiart.net</link>\n  <lastBuildDate>$(TZ='UTC' date --rfc-2822)</lastBuildDate>" >feed.xml
find . -path ./error -prune -o -name '*.html' -print | while read -r item; do
    # Skip template.html, wishlist.html, resume.html, and portfolio.html
    if [[ ${item} == "./index.html" || ${item} == "./template.html" || ${item} == "./wishlist.html" || ${item} == "./resume.html" || ${item} == "./portfolio.html" || ${item} == "./opx.html"  || ${item} == "./blog/this-page-is-actually-portable.html" ]]; then
        continue
    fi
    item="${item%.*}"
    item="${item#./}"
    TITLE=$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)
    printf "\n  <item>\n    <title>${TITLE}</title>\n    <link>https://askiiart.net/${item}.html</link>\n  </item>" >>feed.xml
done
printf "\n\n</channel>\n</rss>" >>feed.xml

# same thing, but for TIL only
cd ./til
printf "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">\n\n<channel>\n  <title>askiiart.net TIL</title>\n  <description>The feed for askiiart.net but just TIL, I guess</description>\n  <link>https://askiiart.net/til/</link>\n  <lastBuildDate>$(TZ='UTC' date --rfc-2822)</lastBuildDate>" >feed.xml
find . -name "*.html" | while read -r item; do
    item="${item%.*}"
    item="${item#./}"
    TITLE=$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)
    printf "\n  <item>\n    <title>${TITLE}</title>\n    <link>https://askiiart.net/til/${item}.html</link>\n  </item>" >>feed.xml
done
printf "\n\n</channel>\n</rss>" >>feed.xml
cd ..

# same thing, but for blog only
cd ./blog
printf "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">\n\n<channel>\n  <title>askiiart.net blog</title>\n  <description>The feed for askiiart.net but just the blog, I guess</description>\n  <link>https://askiiart.net/blog/</link>\n  <lastBuildDate>$(TZ='UTC' date --rfc-2822)</lastBuildDate>" >feed.xml
find . -name "*.html" | while read -r item; do
    if [[ ${item} == "./this-page-is-actually-portable.html" ]]; then
        continue
    fi
    item="${item%.*}"
    item="${item#./}"
    TITLE=$(grep -m 1 -oP '(?<=^# ).*' ${item}.md | cat)
    printf "\n  <item>\n    <title>${TITLE}</title>\n    <link>https://askiiart.net/til/${item}.html</link>\n  </item>" >>feed.xml
done
printf "\n\n</channel>\n</rss>" >>feed.xml
cd ..