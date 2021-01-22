#!/bin/bash
L4TBASE_VERSION="r32.4.3"
BAICAMERASRC_NAME="bai-baicamerasrc"
BAICAMERASRC_VERSION="1.3-${L4TBASE_VERSION}"
BAICAMERASRC_CONTAINER="${BAICAMERASRC_NAME}:${BAICAMERASRC_VERSION}"

if [[ $0 == ${BASH_SOURCE} ]]; then
    echo "Please source this script"
    exit 1
fi
relpath=$(dirname ${BASH_SOURCE})
BAI_SDK_BASE_DIR=$(realpath $relpath)

# Use the source element below to select between
# one of two possible gstreamer sources.
#  - baicamerasrc:  Requires image_server container,
#               supports multiple bayer sensor streams
#               and dynamic ISP settings.  Use this by default.
#  - nvarguscamerasrc: Default nvidia gstreamer element.
#               Only supports a single bayer sensor stream,
#               no support for dynamic ISP settings.  Use this
#               for troubleshooting 

# Use fake video source for node builds for streaming
#SOURCE_ELEMENT="nvarguscamerasrc"
SOURCE_ELEMENT="baicamerasrc"
node_build=$(cat /data/production/defaults.json | grep '\"node\": true')
if [ ! -z ${node_build} ]; then
    SOURCE_ELEMENT="videotestsrc"
fi

if [ "${SOURCE_ELEMENT}" == "baicamerasrc" ]; then
    GSTREAMER_PRE_BUILD_CMD="cat /data/keys/external-bai-*.json | docker login -u _json_key --password-stdin https://gcr.io && docker pull gcr.io/external-bai/${BAICAMERASRC_CONTAINER}"
fi
