#!/bin/bash
openssl aes-256-cbc -a -d -salt -pbkdf2 -in ./.bashrc.enc -out /tmp/.bashrc && echo "mv /tmp/.bashrc ~/.bashrc"
