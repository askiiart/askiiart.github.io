#!/usr/bin/env bash
git clone https://git.askiiart.net/askiiart/http-status-codes.git
cp -r http-status-codes/pages/ .
mv pages/ error/
cp http-status-codes/you.gif assets/
cp http-status-codes/boykisser.jpg assets/
rm -rf http-status-codes/
