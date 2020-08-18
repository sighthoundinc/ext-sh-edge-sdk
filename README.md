# Overview
This repository contains example code demonstrating Boulder AI SDK Features on Boulder-AI
device hardware.

Login to your device using ssh and the IP address of the camera or the name of the camera as
specified in your delivery instructions.  You should then find this repository in the `/data`
partition of the device.  Follow release instructions to update this repository as new SDK
releases become available.

You can use the examples in this repository as a base for your own BAI custom application
 implementation. Please keep any of your working changes in the /data partition, 
as contents in the root filesystem  will be changed as the system is upgraded to 
support future SDK and OS releases.

# Samples
Each sample directory contains a README file with sample specific instructions
and scripts which can be used to build and run example application containers on BAI hardware.

[camera-capture](camera-capture): A container which captures a video using a gstreamer pipeline.

[rtsp-camera-stream](rtsp-camera-stream): A container which starts a rtsp video stream.

[lens-driver](lens-driver): A command line utility which can manipulate the lens.

[python-stream-check](python-stream-check): A container with NVIDIA accelerated opencv+python support.

# Release History

* SDK 0.1 and baidistro release 2.0.0.  Supporting Jetpack 4.4 and L4T release 32.4.3
