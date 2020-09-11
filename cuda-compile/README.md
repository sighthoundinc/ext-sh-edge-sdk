# Cuda-compile build inside docker Container

## Instructions
1. This utility sets up a docker container environment to verify the working of cuda compilation on the host device using `--runtime nvidia`. 
2. Clone the `bai-edge-sdk` repository on the target device and navigate to the `bai-edge-sdk/cuda-compile/docker` directory.
3. In order to build and run cuda samples, you will need to `scp` the cuda samples provided by Nvidia to the target device.
4. The cuda samples can be obtained using the Nvidia sdk manager to install cuda toolkit or by leveraging any already existing jetson device consisting of cuda-samples.
5. The cuda-samples should be typically at the following path: `/usr/local/cuda/samples`
6. Copy the samples directory in `bai-edge-sdk/cuda-compile/docker` i.e the current working directory.
    Note: Make sure to copy the folder and not the contents of the folder. The current working directory should have two folder `docker` and `samples`

## Building the Docker Container
Run [build-docker.sh](build-docker.sh) to pull the necessary base container from the repository and set up a docker container environment.

## Running the Docker Container
Run [run-docker.sh](run-docker.sh) to run the container interactively.  
The current working directory inside the docker container will list the source files to build `deviceQuery` executable.
Run   
```
make
./deviceQuery
```
to make and run the executable.
