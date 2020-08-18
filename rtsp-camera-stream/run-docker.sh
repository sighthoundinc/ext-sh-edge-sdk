#!/bin/bash

docker run -d \
    -p 8554:8554 \
    --runtime nvidia \
    --rm \
    --ipc=host \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /tmp/argus_socket:/tmp/argus_socket \
    -v /dev/video0:/dev/video0 \
    --cap-add SYS_PTRACE \
    -e DISPLAY=$DISPLAY \
    --name bai-rtsp-stream \
    -t \
    bai-rtsp-stream
