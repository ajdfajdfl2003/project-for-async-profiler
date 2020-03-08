#!/usr/bin/env bash
set -e

java \
-Djava.rmi.server.hostname=10.1.1.42 \
-Dcom.sun.management.jmxremote.rmi.port=9090 \
-Dcom.sun.management.jmxremote.port=9090 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-jar /app/play-async-profiler.jar

touch dummy_file
tail -f dummy_file
