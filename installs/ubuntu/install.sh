#!/bin/bash
# a collection of things i use all the time

## install golang
cd /tmp
wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz

## install ubuntu packages
apt install -y git subversion jq bat wget arandr
