#!/bin/bash
set -e
pushd `dirname $0`
source container.sh
cat /data/keys/external-bai-*.json | docker login -u _json_key --password-stdin https://gcr.io
docker pull $container
