#!/bin/bash

cd `dirname $0`/docker
docker build . -t cuda-sample:v1.0 

