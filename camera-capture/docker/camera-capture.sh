#!/bin/bash

SOURCE_ELEMENT=$1
RESULT_VIDEO=$2

echo "Starting camera capture with ${SOURCE_ELEMENT}, writing capture to ${RESULT_VIDEO}"

gst-launch-1.0 -e ${SOURCE_ELEMENT} num-buffers=300 ! \
    nvvidconv ! 'video/x-raw(memory:NVMM), width=(int)3840, height=(int)2160, format=(string)NV12' ! \
    nvv4l2h265enc \
    control-rate=1 bitrate=8000000 ! 'video/x-h265, \
    stream-format=(string)byte-stream' ! h265parse ! qtmux ! filesink \
    location=${RESULT_VIDEO}
  
