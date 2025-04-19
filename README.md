# My site

## Site generation

Pages are written as markdown files, then converted to HTML using `md2html.sh`, which converts them to pandoc and fixes some small bits (with `sed` and `regex-chicanery.py`). Then a new RSS feed and sitemap are generated using `generate-rss.sh` and `generate-sitemap.xml`.

## Organization

- Standard blog posts go in `/blog/`
- Today I learned stuff goes in `/til/`
- Misc data go in `/data/`
- Assets (images, videos, etc) go in `/assets/`, lining up with the organization of the page they go to (e.g. `/blog/marlin-boot-animations.{md,html}` -> `/assets/blog/marlin-boot-animations/`)

## Errors

Error pages are provided by [http-status-codes](https://git.askiiart.net/askiiart/http-status-codes).
