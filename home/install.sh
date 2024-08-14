#!/bin/bash

cd ~/github
git clone https://github.com/gcholette/bash-ps1-themes

cd /tmp
git clone https://github.com/dysfunc/ascii-emoji.git
pushd ascii-emoji/
mv emojis ~/bin/
popd
rm -rf /tmp/ascii-emoji

