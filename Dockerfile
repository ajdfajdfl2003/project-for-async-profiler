FROM jdb168dev/alpine-java:3.6_jdk8u241

EXPOSE 9090

WORKDIR /app

COPY target/play-async-profiler.jar /app

COPY docker-entrypoint.sh /app

RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
