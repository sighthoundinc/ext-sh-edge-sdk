#!/bin/bash

ip=$(/sbin/ip route|awk '/default/ { print $3 }')
SOURCE_ELEMENT="$@"
echo "Starting rtsp stream with gstreamer source element ${SOURCE_ELEMENT}, connect on rtsp://${ip}:8554/test"
gst-rtsp-server/examples/test-launch "${SOURCE_ELEMENT} image-index=0 ! \
        nvvidconv ! \
        nvv4l2h264enc ! video/x-h264, profile=baseline, stream-format=byte-stream, width=(int)1920, height=(int)1080 ! \
        h264parse ! rtph264pay name=pay0 pt=96 config-interval=1 "

code=$?
if [ $code -ne 0 ]; then
    echo "ERROR: rtsp server failed with code $code"
    exit $code
else
    echo "rtsp server shutting down"
fi

exit 0
