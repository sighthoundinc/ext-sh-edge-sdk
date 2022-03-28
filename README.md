# Overview
This repository contains example code demonstrating Sighthound SDK Features on Boulder-AI
device hardware.

Login to your device using ssh and the IP address of the device or the name of the device as
specified in your delivery instructions.  

You should then find this repository in the `/data` partition of the device.  
Follow release instructions to update this repository as new SDK releases become available.

You can use the examples in this repository as a base for your own Sighthound custom application implementation.  
Please keep any of your working changes in the /data partition, as contents in the root filesystem  will be changed as the system is upgraded to 
support future SDK and OS releases.

# Samples
Each sample directory contains a README file with sample specific instructions
and scripts which can be used to build and run example application containers on SH hardware.

## Lens and Sensor Related Samples

These samples use the lens and onboard sensor which are only available on camera models

[camera-capture](camera-capture): A container which captures a video from the onboard camera using a gstreamer pipeline.

[rtsp-camera-stream](rtsp-camera-stream): A container which starts a rtsp video stream using the onboard camera.

[lensdriver](lensdriver): A command line utility which can manipulate the lens.

## Other Samples

[python-stream-check](python-stream-check): A container with NVIDIA accelerated opencv+python support, capable
of checking for a working rtsp-camera-stream instance.  You can use this as an example for accessing an rtsp stream
on a Node device without lens or sensor hardware.

[cuda-compile](cuda-compile): A container demonstrating compilation of cuda code

[gps-imu](gps-imu): A container demonstrating the use of optional GPS and IMU hardware.

## baicamerasrc
In the examples, baicamerasrc is the default gstreamer source of images for gstreamer based containers.  This
gstreamer element supports multiple streams from a single bayer sensor and runtime manipulation of ISP parameters.

When starting a gstreamer based container with the baicamerasrc gstreamer element selected, the image server will
automatically be started.

The baicamerasrc does not have a fixed framerate.  
The baicamerasrc can output images of one resolution out of a possible three. The selection is made via the 'image-index' property.  
`image-index=0` corresponds to the  resolution.
`image-index=1` corresponds to the 1280x720 resolution.
`image-index=2` corresponds to the  300x512 resolution.
Height: [2160,  720, 512]  
Width:  [3840, 1280, 300]  

You can obtain debug information for baicamerasrc by including `-e GST_DEBUG=4` in the docker run command argument list.

## nvarguscamerasrc
You can switch to use the NVIDIA gstreamer nvarguscamerasrc element by changing which SOURCE_ELEMENT line in [environment.sh](environment.sh)
is commented out. When using nvarguscamerasrc instead of baicamerasrc you may only run one gstreamer example at a time.  Use `docker ps` to see the running
list of containers.  You must also stop the image server and UI, which you can do with `systemctl stop bai-device-ui`.
In order to prevent the image server from starting on boot, you need to disable the UI, which you can do with:
```
mkdir /etc/bai/persist/ui
touch /etc/bai/persist/ui/not-to-be-started
```
As an alternative to using Boulder AI hardware, you can begin development with a [Jetson Development Kit](https://developer.nvidia.com/buy-jetson)
and use nvarguscamerasrc for container development.

# Release History
* SDK 0.2 and baios release 2.4 : Initial baicamerasrc release and initial web UI version 2 release.  SDK 0.2 requires at least
baios release 2.4 (see `cat /etc/mender/artifact_info` for version information).  Contact support at `support@boulderai.com` for
assistance upgrading your device.
* SDK 0.1.1 and baios release 2.1.0.  Add cuda compile example
* SDK 0.1 and baios release 2.0.0.  Supporting Jetpack 4.4 and L4T release 32.4.3  

# Known Issues
* To change the root password, remount the rootfs read/write using `mount -oremount,rw /`.  Password changes will
be lost on upgrades.

# Release Instructions  
* Enter `git pull origin master` command to update the repository to the latest content and features from the base directory of the repository.
