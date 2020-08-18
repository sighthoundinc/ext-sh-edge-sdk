# lensdriver

This sample pulls and runs a container which gives the ability to control the motor lens on sensors for all Boulder AI platforms.

In order to test imx334 lensdriver functionality, make sure the path: `/data/production/lens/motor-driver/` is setup with the correct
production information for the camera you are using.

# Pull the container
Run [pull-docker.sh](pull-docker.sh) to pull the container from the bai registry.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.
lensdriver executable will appear in `/usr/src/app`. Run `./lensdriver` to run the executable.
