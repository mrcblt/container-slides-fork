#!/bin/bash
set -o errexit

docker-setup --tools=docker,buildx,docker-compose,kind,helm,kubectl,gvisor install