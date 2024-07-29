#!/bin/bash

export your gpg like `gpg --export --armor $HASH > /tmp/gpg_private

encrypt  
```bash
openssl aes-256-cbc -salt -pbkdf2 -a -e -in /tmp/gpg_private  -out /tmp/gpg_private.enc
```

decrypt
```bash
openssl aes-256-cbc -d -a -pbkdf2 -in ./gpg_private.enc -out /tmp/gpg_private
rm /tmp/gpg_private
```


import   
```bash
gpg --import --armor /tmp/gpg_private
```

get `pass` 
```bash
sudo apt install -y pass
```

import your `pass` stuff
```bash
git clone https://github.com/R4wm/pass-store.git ~/.password-store

```
