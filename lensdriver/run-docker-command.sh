#!/bin/bash
cd `dirname $0`
mkdir -p /data
source container.sh

docker run \
    -v /data/production:/data/production:ro \
    -v /etc/bai-production:/etc/bai-production:ro \
    -v /etc/bai/persist:/etc/bai/persist \
    --privileged \
    --runtime nvidia \
    --rm \
    --ipc=host \
    --cap-add SYS_PTRACE \
    -e DISPLAY=$DISPLAY \
    -it ${container} /bin/bash -c "${@}"

