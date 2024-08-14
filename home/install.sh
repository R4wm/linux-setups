#!/bin/bash

cd ~/github
git clone https://github.com/gcholette/bash-ps1-themes

cd /tmp
git clone https://github.com/dysfunc/ascii-emoji.git
cd ascii-emoji/
mv emojis ~/bin/
cd ~
rm -rf /tmp/ascii-emoji

