#!/bin/sh

if [ ! -d server ]
then
    git clone https://github.com/knitter-org/server.git
else
    cd server && git pull && cd -
fi

wget $(curl -s https://api.github.com/repos/knitter-org/app/releases/latest | grep "\/bundle\.zip" | cut -d : -f 2,3 | tr -d \") -P web/

docker-compose build
docker-compose up -d
