#!/bin/bash
set -e
cd `dirname $0`
mkdir -p /data
source container.sh
docker run --net=host --privileged --runtime nvidia --rm --ipc=host -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /tmp/argus_socket:/tmp/argus_socket -v /dev/video0:/dev/video0 -v /dev/i2c-2:/dev/i2c-2 -v /dev/i2c-6:/dev/i2c-6 -v /data:/data --cap-add SYS_PTRACE -e DISPLAY=$DISPLAY -it $container
