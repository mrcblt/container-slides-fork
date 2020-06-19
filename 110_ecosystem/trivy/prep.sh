#!/bin/bash

curl --silent https://api.github.com/repos/aquasecurity/trivy/releases/latest | \
    jq --raw-output '.assets[] | select(.name | endswith("_Linux-64bit.tar.gz")) | .browser_download_url' | \
    xargs curl --silent --location --fail | \
    tar -xvzC /usr/local/bin trivy

# Download databases to avoid delay
if [[ ! -d ~/.cache/trivy ]]; then
    trivy --refresh
fi
