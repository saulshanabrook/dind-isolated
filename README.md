# `dind-isolated`
Use this to run a docker daemon (in docker) in the background of a container
while you access it in the foreground.

It is based on [`docker:dind`](https://hub.docker.com/_/docker).

I am using it for Gitlab CI builds, so I have it install Docker Compose
and Git as well.

This requires [overlayfs](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/)
on the host machine, so that the containairized docker can use it as well.
 

```bash
$ docker run --rm --privileged saulshanabrook/dind-isolated docker run hello-world
waiting for docker daemon...
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b901d36b6f2f: Pull complete
0a6ba66e537a: Pull complete
Digest: sha256:8be990ef2aeb16dbcb9271ddfe2610fa6658d13f6dfb8bc72074cc1ca36966a7
Status: Downloaded newer image for hello-world:latest

Hello from Docker.
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker Hub account:
 https://hub.docker.com

For more examples and ideas, visit:
 https://docs.docker.com/userguide/
```


The flags set in `DOCKER_DAEMON_FLAGS` will be passed to the daemon. 
