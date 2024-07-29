#!/bin/bash
cd ~/github
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/r4wm/awesome-copycats.git
git remote add upstream https://github.com/lcpz/awesome-copycats

git fetch --all
git merge upstream/master


