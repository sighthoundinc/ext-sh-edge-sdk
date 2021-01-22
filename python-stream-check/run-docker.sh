#!/bin/bash
set -e
mkdir -p /data
docker run \
	--runtime nvidia --net=host \
	-v /data:/data --cap-add SYS_PTRACE -t rtsp-stream-check
