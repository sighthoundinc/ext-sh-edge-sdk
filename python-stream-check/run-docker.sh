#!/bin/bash
set -e
cd `dirname $0`
mkdir -p /data
source container.sh
docker run --runtime nvidia --net=host \
	-v /data:/data --cap-add SYS_PTRACE -t rtsp-stream-check
