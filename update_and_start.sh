#!/bin/sh

if [ ! -d server ]
then
    git clone https://github.com/knitter-org/server.git
else
    cd server && git pull && cd -
fi

docker-compose up -d --build --no-cache
