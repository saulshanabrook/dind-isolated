#!/bin/sh
set -e

docker daemon \
    --host=unix:///var/run/docker.sock \
    --host=tcp://0.0.0.0:2375 \
    --storage-driver=overlay $DOCKER_DAEMON_FLAGS \
    > /etc/docker-daemon-logs 2>&1 &

echo "waiting for docker daemon..."


while ! (docker ps) >/dev/null 2>&1;
    do sleep 1;
done;

exec "$@"
