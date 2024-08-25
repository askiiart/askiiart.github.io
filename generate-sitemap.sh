#!/usr/bin/env bash

### Stolen from TCCD-CompSci-and-Coding-Club/website on Codeberg (also written by me)

# Taken from here and modified: https://www.lostsaloon.com/technology/how-to-create-an-xml-sitemap-using-wget-and-shell-script/
# (https://web.archive.org/web/20231202193251/https://www.lostsaloon.com/technology/how-to-create-an-xml-sitemap-using-wget-and-shell-script/) (https://archive.ph/qtdMP)
sitedomain=https://askiiart.net/
dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
wget --spider --recursive --level=inf --output-file=$dir/linklist.txt $sitedomain
# greps for the relevant lines, gets the URLs, gets only the lines for $sitedomain, and sorts them
# wget's output changed, so this line had to be updated
# also, not sure why it ends up working, since there's a leading space in the lines after `awk` runs, but it works soooo i'mnot gonna mess with it
grep "Adding URL:" $dir/linklist.txt | awk -F 'Adding URL:' '{print $2}' | grep "$sitedomain" | sort -u  >$dir/sortedurls.txt
header='<?xml version="1.0" encoding="UTF-8"?><urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">'
echo $header >sitemap.xml
while read p; do
  case "$p" in
  */ | *.html | *.htm)
    echo '<url><loc>'$p'</loc></url>' >>sitemap.xml
    ;;
  *) ;;
  esac
done <$dir/sortedurls.txt
echo "</urlset>" >>sitemap.xml
rm $dir/linklist.txt
rm $dir/sortedurls.txt
