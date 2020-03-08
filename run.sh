#!/usr/bin/env bash
set -e

if [[ -n $(docker ps -aq --filter=name='play-async-profiler') ]]; then
    docker rm -f play-async-profiler
fi

docker run -d -p 9090:9090 --name play-async-profiler play-async-profiler:0.1.0
