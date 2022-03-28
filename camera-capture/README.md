# camera-capture

This sample builds a container which captures a video using a gstreamer pipeline with either `nvarguscamerasrc` or 
`baicamerasrc` input, defined by `../environment.sh`. 

# Building the container

Run [build-docker.sh](build-docker.sh) to build the container.  
Add the optional argument `--no-cache` to run the container from scratch.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.  
A 600 frame video capture named `test.mp4` will be placed in the current working directory by the running container.