#!/bin/sh

set -e

# Check for availability of required commands
type git
type curl
type docker-compose

if [ ! -d server ]
then
    git clone https://github.com/knitter-org/server.git
else
    cd server && git pull && cd -
fi

curl -L $(curl -s https://api.github.com/repos/knitter-org/app/releases/latest | grep "\/bundle\.zip" | cut -d : -f 2,3 | tr -d \") -o web/bundle.zip

docker-compose build
docker-compose up -d
