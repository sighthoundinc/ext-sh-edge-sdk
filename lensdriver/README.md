# lensdriver

This sample pulls and runs a container which gives the ability to control the motor lens on sensors for all Boulder AI platforms.

In order to test lensdriver functionality, make sure the file at `/data/production/defaults.json` is present and setup with the correct
production information for the camera you are using.

# Pull the container
Run [pull-docker.sh](pull-docker.sh) to pull the container from the bai registry.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.  
Running the `run-docker.sh` script will start the `lensdriver` executable inside the docker container. The `lensdriver` executable
is a CLI to interact with the lens motors onboard the DNN-Cam. See "Getting to know the lensDrvier" application below for an overview
of it's functionality. 

Enter `quit` inside the CLI or press `ctrl-A` followed by `ctrl-D` to exit from the docker container after modifying the lens settings.  

# Getting to know lensDriver Application  
`lensDriver` gives user the ability to control the lens using command line.
Once `lensDriver` is executed using the instructions specified above, the user can type `help` for the list of commands to control lens.  
**Note:** `Help` may give different output based on the sensor used.  

`zoom, iris and focus` positions can be controlled in terms of percentages abstracting all the other details from the user.  
`<percent>` is the percentage to which the lens parameter should be set in the commands below.

- `setzoom <percent>` : This command would set the zoom to *<percent>* percentage.  
- `setfocus <percent>` : This command would set the focus to *<percent>* percentage.  
- `setiris <percent>` : This command would set the iris to *<percent>* percentage.

For example: `setzoom 50`, `setfocus 30` or `setiris 70` can be the various commands.  
  
- `zoomlocation` : This command would display the current zoom percentage value.  
- `focuslocation` : This command would display the current focus percentage value.  
- `irislocation` : This command would display the current iris percentage value.

- `ircuton` and `ircutoff` can be used to flip the ircut filter on or off.   
**NOTE:** Default value  for ircut filter is on  
- `resetlens` : Resets lens to the default position   
- `calibratelens` : Calibrates the lens and repositions to persistent   
- `defaultcalibratelens` : Calibrates the lens and repositions to default position.   
- `quit` can be used to quit the `lensDriver` application.  
  
**NOTE:**
The default percent values can be found in `/data/production/defaults.json`.  
The current percent values can be found in `/etc/bai/persist/imageserver/lens.json`.   

# Running lensdriver in daemon mode

For this, you'll have to modify `run-docker.sh` script for this operation:

```
diff --git a/lensdriver/run-docker.sh b/lensdriver/run-docker.sh
index 738b79c..78238e5 100755
--- a/lensdriver/run-docker.sh
+++ b/lensdriver/run-docker.sh
@@ -3,7 +3,7 @@ cd `dirname $0`
 mkdir -p /data
 source container.sh
 
-docker run \
+docker run -d \
     -v /data/images:/data/images \
     -v /data/production:/data/production:ro \
     -v /etc/bai-production:/etc/bai-production:ro \
@@ -14,5 +14,5 @@ docker run \
     --ipc=host \
     --cap-add SYS_PTRACE \
     -e DISPLAY=$DISPLAY \
-    -it ${container} /bin/bash -c -i "${@}"
+    -t ${container}
```

Running `run-docker.sh` after modification will launch lensdriver in daemon mode. 
Lens Setting ZMQ socket is exposed at `/data/images/lensSettings.ipc`.

Following commands are supported:
1. `setzoom` - sending `setzoom <value>` to the socket will set the zoom to value. 0 <= `value` <= 100. Returns `success` on successful operation.
2. `setfocus` - sending `setfocus <value>` to the socket will set the focus to value. 0 <= `value` <= 100. Returns `success` on successful operation.
3. `setiris` - sending `setiris <value>` to the socket will set the iris to value. 0 <= `value` <= 100. Returns `success` on successful operation.
4. `EnableIRCutFilter` - this will enable IR cut filter. Returns `success` on successful operation.
5. `DisableIRCutFilter` - this will disable IR cut filter. Returns `success` on successful operation.
6. `FactoryDefaults` - this will reset the lens settings to factory default. Returns `success` on successful operation.
7. `ZoomGetLocation` - this will return current location of zoom
8. `FocusGetLocation` - this will return current location of focus
9. `IrisGetLocation` - this will return current location of iris
10. `IRCutStatus` - this will return 0 if IR cut is disabled, and 1 if enabled.

Example for Python:
```python
import zmq
import threading

context = zmq.Context()
socket = context.socket(zmq.REQ)
timeout_ms = 30000
socket.RCVTIMEO = timeout_ms
socket.SNDTIMEO = timeout_ms
socket.REQ_RELAXED = True
socket.connect("ipc:///data/images/lensSettings.ipc")
lock = threading.Lock()

zoom_val = 40
command = f"setzoom {str(zoom_val)}"
socket.send_string(command)
response = socket.recv()
print(response.decode('utf-8'))
```
