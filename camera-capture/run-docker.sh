#!/bin/bash
mkdir -p /data
docker run --net=host --runtime nvidia --rm --ipc=host -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /tmp/argus_socket:/tmp/argus_socket -v /dev/video0:/dev/video0 -v /data:/data --cap-add SYS_PTRACE -e DISPLAY=$DISPLAY -t bai-camera-capture
