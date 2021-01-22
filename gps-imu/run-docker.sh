#!/bin/bash
set -e
mkdir -p /data
# Below definitions are for Xavier NX
GPS_DEVICE=/dev/ttyTHS0
# Map the imu bus to i2c-1 so
# example applications can find it
IMU_BUS=/dev/i2c-8
docker run \
	--runtime nvidia --net=host \
	-v /data:/data --device=${GPS_DEVICE}:/dev/gps --device=${IMU_BUS}:/dev/imu  --device=${IMU_BUS}:/dev/i2c-1 -it gps-imu
