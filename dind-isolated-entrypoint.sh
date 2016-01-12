#!/bin/sh
set -e

dockerd-entrypoint.sh $DOCKER_DAEMON_FLAGS > /etc/docker-daemon-logs 2>&1 &

echo "waiting for docker daemon..."


while ! (docker ps) >/dev/null 2>&1;
    do sleep 1;
done;

exec "$@"
