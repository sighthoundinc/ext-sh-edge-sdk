# rtsp-camera-stream

This sample builds a container which streams a rtsp videos stream using an NVIDIA nvarguscamerasrc gstreamer pipeline.

# Building the container

Run [build-docker.sh](build-docker.sh) to build the container.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.  A rtsp video stream will start on rtsp://<name_or_ip_addr>:8554/test

# Stopping the container

Run `docker stop -t 1 bai-rtsp-stream`

# Printing container logs

Run `docker logs bai-rtsp-stream`
