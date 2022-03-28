#!/bin/bash
scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/../environment.sh

IMAGE_SERVER_CONTAINER="sh-image-server"

RESULT_VIDEO=$1
if [ -z "${RESULT_VIDEO}" ]
then
    echo "The first argument must be the video file to write!"
    exit -1
fi
# touch the file first so that permissions are set by the current user, not docker
touch ${RESULT_VIDEO}
RESULT_VIDEO=$(realpath ${RESULT_VIDEO})


set -e

eval ${GSTREAMER_PRE_RUN_CMD}

if [ $SOURCE_ELEMENT == "baicamerasrc" ]; then
    echo -n "Waiting for $IMAGE_SERVER_CONTAINER to become available before launching..."
    while [ ! "$(docker ps -a -f status=running | grep ${IMAGE_SERVER_CONTAINER})" ]; do
       echo -n "."
       sleep 3
    done
    sleep 3
    echo "done"
fi

echo "Staring camera capture with source element ${SOURCE_ELEMENT}"
mkdir -p /data
docker run \
    -v ${RESULT_VIDEO}:${RESULT_VIDEO} \
    -v /data/sockets:/data/sockets \
    -v /tmp/argus_socket:/tmp/argus_socket \
    --device=/dev/video0:/dev/video0 \
    --net=host \
    --ipc=host \
    --pid=host \
    --runtime nvidia \
    --rm \
    --name bai-camera-capture \
    --cap-add SYS_PTRACE \
    -e DISPLAY=$DISPLAY \
    -t bai-camera-capture ${SOURCE_ELEMENT} ${RESULT_VIDEO}
echo "Completed camera capture with element ${SOURCE_ELEMENT}"
