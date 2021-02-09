# lensdriver

This sample pulls and runs a container which gives the ability to control the motor lens on sensors for all Boulder AI platforms.

In order to test imx334 lensdriver functionality, make sure the path: `/data/production/lens/motor-driver/` is setup with the correct
production information for the camera you are using.

# Pull the container
Run [pull-docker.sh](pull-docker.sh) to pull the container from the bai registry.

# Running the container

Run [run-docker.sh](run-docker.sh) to run the container.
Running the `run-docker.sh` script will start the docker container in interactive mode with a new command line on top of the existing one.  
This can be verified by using the `pwd` command on new the command line.  
`pwd` must return `/usr/src/app` or `ls` must simply show `lensDriver` executable after running `run-docker.sh`  

`lensDriver` executable will appear in `/usr/src/app`.  
Run `./lensDriver` to run the executable from `/usr/src/app` directory.  
Enter `exit` on the command line or press `ctrl-A` followed by `ctrl-D` to exit from the docker container after modifying the lens settings.  

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
  

# Modifying values without entering the docker container

We already discussed how to modify values by running the container interactively.

`run-docker-command.sh` provides another method to achieve the results of lensDriver commands without starting the docker container interactively i.e using `run-docker.sh`.

Run `./run-docker-command.sh "echo '<command>' | ./lensDriver"` from the current directory.  
`<command>` refers to the different `lensDriver` application commands mentioned in **Getting to know LensDriver Application** section.  
  
**For example:** In order to set zoom to 50 percent, use the following command   
- `./run-docker-command.sh "echo 'setzoom 50' | ./lensDriver"` and likewise for other commands as well.
