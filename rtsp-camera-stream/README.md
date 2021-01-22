# rtsp-camera-stream

This sample builds a container which streams a rtsp videos stream using an NVIDIA nvarguscamerasrc gstreamer pipeline.

The video will stream at a resolution of 1080p.  This can be changed by modifying the gstreamer pipeline in `.../docker/rtsp-stream.sh`

# Building the container

Run [build-docker.sh](build-docker.sh) to build the container.
Add `--no-cache` as an argument to build container from scratch.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.  
An rtsp video stream will start on `rtsp://<name_or_ip_addr>:8554/test`
VLC can be used to view the video stream.  
Open **VlC -> Media -> Open Network Stream**: a dialog box will appear, enter `rtsp://<name_or_ip_addr>:8554/test` under the **Network** tab and click **Play**.
# Stopping the container

Run [stop-docker.sh](stop-docker.sh)

# Printing container logs

Run `docker logs bai-rtsp-stream`
