#!/usr/bin/env bash
set -e

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    IP_ADDRESS=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    IP_ADDRESS=$(ip addr show en0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
fi

if [[ -n $(docker ps -aq --filter=name='play-async-profiler') ]]; then
    docker rm -f play-async-profiler
fi

docker run -d -p 9090:9090 --name play-async-profiler \
--pid=host \
--userns=host \
--security-opt seccomp=unconfined \
--cap-add SYS_ADMIN \
play-async-profiler:0.1.0 \
${IP_ADDRESS}