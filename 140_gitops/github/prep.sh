#!/bin/bash

curl --silent https://api.github.com/repos/github/hub/releases/latest | \
    jq --raw-output '.assets[] | select(.name  | startswith("hub-linux-amd64-")) | .browser_download_url' | \
    xargs curl --silent --location --fail | \
    tar -xvzC ~/.local/ --wildcards --strip-components=1 */bin/hub
curl --silent https://api.github.com/repos/github/hub/releases/latest | \
    jq --raw-output '.assets[] | select(.name  | startswith("hub-linux-amd64-")) | .browser_download_url' | \
    xargs curl --silent --location --fail | \
    tar -xvzC ~/.local/etc/bash_completion.d/ --wildcards --strip-components=2 */etc/hub.bash_completion.sh

curl --silent https://api.github.com/repos/cli/cli/releases/latest | \
    jq --raw-output '.assets[] | select(.name | endswith("_linux_amd64.tar.gz")) | .browser_download_url' | \
    xargs curl --silent --location --fail | \
    tar -xvzC ~/.local/bin/ --wildcards --strip-components=2 */bin/gh
