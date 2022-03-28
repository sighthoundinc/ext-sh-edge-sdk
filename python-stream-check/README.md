# python-stream-check

This container demonstrates the use of a python container with OpenCV support and adding a custom
python application to the base container.

# Build the container
Run [build-docker.sh](build-docker.sh) to pull the necessary base container from the repository and
build a container with additional python components.  
Add the optional argument `--no-cache` to run the container from scratch.


# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.  The container will print whether the python
stream exists on localhost (whether the rtsp stream container is running).  
Change line 3 of the script at `docker/rtsp-check.py` to check a different RTSP stream's status. 

