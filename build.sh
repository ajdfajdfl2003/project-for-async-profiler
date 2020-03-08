#!/usr/bin/env bash
set -e

if [[ -n $(docker ps -aq --filter=name='play-async-profiler') ]]; then
    docker rm -f play-async-profiler
fi
if [[ -n $(docker images -aq --filter=reference='play-async-profiler:0.1.0') ]]; then
    docker rmi -f play-async-profiler:0.1.0
    docker image prune -f
fi

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
M2_FOLDER=${HOME}"/m2"
TS=`date +%s`

docker run \
  -i \
  --rm \
  --name my-maven-project-GameAuthProvider-${TS} \
  --net=host \
  -v "${SCRIPT_PATH}":/usr/src/mymaven:z \
  -v "${M2_FOLDER}":/root/.m2:z \
  -w /usr/src/mymaven \
  maven:3.3.9-jdk-8 mvn -U clean package -Dmaven.test.skip=true

docker build -t play-async-profiler:0.1.0 .
