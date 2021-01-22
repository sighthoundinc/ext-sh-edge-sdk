#!/bin/bash

scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/../environment.sh

docker build $@ --build-arg L4TBASE_VERSION=${L4TBASE_VERSION} -t cuda-sample:v1.0 ${scriptdir}/docker
