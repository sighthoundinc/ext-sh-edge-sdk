# gps-imu

This container demonstrates how to access the GPS and IMU optional hardware for
dnncam

# Build the container
Run [build-docker.sh](build-docker.sh) to pull the necessary base container from the repository and
build a container with additional python components.  
Add the optional argument `--no-cache` to run the container from scratch.


# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.

Then start gpsd within the container using `./start-gpsd.sh`

* Run an example using the 3-axis gyroscope with `l3g20_test`.  See https://github.com/jackw01/l3gd20-python for details.
* Run an example using the accelerometer with `python3 bai-test-accel.py` in the `LSM303DLHC_Python` subdirectory.
* Run an example gps application using `python3 bai-test-gps.py` 
