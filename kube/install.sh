#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod a+x kubectl
mv kubectl ~/bin
cp -rav .kube ~/

cd .kube
openssl aes-256-cbc -d -a -pbkdf2 -in config.enc -out ~/.kube/config

ls -la ~/.kube/
