#!/bin/bash
scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/container.sh

echo "Stopping bai-rtsp-stream container"
docker stop ${CONTAINER_NAME}
