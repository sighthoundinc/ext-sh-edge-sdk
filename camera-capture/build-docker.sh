#!/bin/bash

scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/../environment.sh

eval ${GSTREAMER_PRE_BUILD_CMD}

docker build $@ \
    --build-arg BAICAMERASRC_VERSION=${BAICAMERASRC_VERSION} \
    --build-arg L4TBASE_VERSION=${L4TBASE_VERSION} \
    -t bai-camera-capture ${scriptdir}/docker
