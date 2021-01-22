#!/bin/bash

scriptdir="$(realpath `dirname ${BASH_SOURCE}`)"
source ${scriptdir}/container.sh

eval ${GSTREAMER_PRE_BUILD_CMD}

docker build $@ \
    --build-arg L4TBASE_VERSION=${L4TBASE_VERSION} \
    --build-arg BAICAMERASRC_NAME=${BAICAMERASRC_NAME} \
    --build-arg BAICAMERASRC_VERSION=${BAICAMERASRC_VERSION} \
    -t ${CONTAINER_NAME} ${scriptdir}/docker
