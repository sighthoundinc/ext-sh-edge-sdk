#!/bin/bash

ip=$(/sbin/ip route|awk '/default/ { print $3 }')
echo "Starting rtsp stream, connect on rtsp://${ip}:8554/test"

gst-rtsp-server/examples/test-launch "gst-launch-1.0 nvarguscamerasrc ! video/x-raw(memory:NVMM), width=1920, height=1080, framerate=28/1, format=NV12, pixel-aspect-ratio=1/1 ! nvvidconv ! nvv4l2h264enc ! video/x-h264, profile=baseline, stream-format=byte-stream ! h264parse ! rtph264pay name=pay0 pt=96 config-interval=1 "

code=$?
if [ $code -ne 0 ]; then
    echo "ERROR: rtsp server failed with code $code"
    exit $code
else
    echo "rtsp server shutting down"
fi

exit 0
