#!/usr/bin/env python3
import re
import sys

# add title attribute to img tags
filename = sys.argv[1]
with open(filename, 'r+') as f:
    contents = ''.join(f.readlines())
    regexp = re.compile('alt="(.*?)"')
    for match in regexp.finditer(contents):
        contents = contents.replace(match.group(0), f'title="{match.group(1)}" {match.group(0)}')

with open(filename, 'wt') as f:
    f.write(contents)