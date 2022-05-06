#!/bin/bash

pushd `dirname $0`
source container.sh
cat /data/keys/docker-key.json | docker login -u _json_key --password-stdin https://us-central1-docker.pkg.dev
docker pull $container
