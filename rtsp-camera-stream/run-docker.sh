#!/bin/bash
scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/container.sh

eval ${GSTREAMER_PRE_RUN_CMD}

echo "Starting RTSP Stream Container with source element ${SOURCE_ELEMENT}"

docker run -d \
    -v /data/sockets:/data/sockets \
    -v /tmp/argus_socket:/tmp/argus_socket \
    -p 8554:8554 \
    --runtime nvidia \
    --rm \
    --ipc=host \
    --device=/dev/video0:/dev/video0 \
    --cap-add SYS_PTRACE \
    -e DISPLAY=$DISPLAY \
    --name ${CONTAINER_NAME} \
    -t \
    ${CONTAINER_NAME} ${SOURCE_ELEMENT}

echo "Started RTSP stream container using source element ${SOURCE_ELEMENT}"
echo "To stop, use the \"./stop-docker.sh\" script"
