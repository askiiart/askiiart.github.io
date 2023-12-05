#!/usr/bin/env bash
rm -rf error/
git clone https://git.askiiart.net/askiiart/http-status-codes.git
cd http-status-codes/
python3 nginx-create-pages.py
cp -r pages/ ..
cd ..
mv pages/ error/
cp http-status-codes/you.gif assets/
cp http-status-codes/boykisser.png assets/
rm -rf http-status-codes/
find error/ -type f | xargs sed -i 's/img src=\//img src=\/assets\//g'