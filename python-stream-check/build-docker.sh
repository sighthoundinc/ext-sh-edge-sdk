#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${scriptdir}/../environment.sh
pushd ${scriptdir}
./pull-docker.sh
docker build --build-arg L4TBASE_VERSION=${L4TBASE_VERSION} -t rtsp-stream-check ${scriptdir}/docker
