#!/bin/sh

set -e

# Check for availability of required commands
type git
type wget
type curl
type docker-compose

if [ ! -d server ]
then
    git clone https://github.com/knitter-org/server.git
else
    cd server && git pull && cd -
fi

wget -O -P web/ $(curl -s https://api.github.com/repos/knitter-org/app/releases/latest | grep "\/bundle\.zip" | cut -d : -f 2,3 | tr -d \") 

docker-compose build
docker-compose up -d
