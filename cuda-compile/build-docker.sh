#!/bin/bash

scriptdir="$(realpath `dirname ${BASH_SOURCE[0]}`)"
source ${scriptdir}/../environment.sh

docker build $@ --build-arg CUDA_IMAGE=${CUDA_IMAGE} -t cuda-sample:v1.0 ${scriptdir}/docker
