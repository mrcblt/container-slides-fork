#!/bin/bash

#curl -s https://api.github.com/repos/moby/buildkit/releases/latest | \
curl -s https://api.github.com/repos/moby/buildkit/releases | jq 'map(select(.tag_name | startswith("v"))) | .[0]' | \
    jq --raw-output '.assets[] | select(.name | endswith(".linux-amd64.tar.gz")) | .browser_download_url' | \
    xargs curl -sLf | \
    tar -xvzC /usr/local/
