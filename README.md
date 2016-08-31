# docker_roboy_control
Docker container for deploying the hardware-only roboy ros_control stack

Build me with

```
docker-compose build
```

If you want to quickly modify code you can fish out the latest container id from the console out put of the above and replace the ```c9effa1973a2``` in the command below:

```
docker run --rm -ti \
  -v /home/rapha/Development/Roboy/flexrayusbinterface:/root/catkin_ws/src/flexrayusbinterface \
  -v /home/rapha/Development/Roboy/roboy-ros-control:/root/catkin_ws/src/roboy-ros-control \
  -v /home/rapha/Development/Roboy/roboy-ros-control-simulation:/root/catkin_ws/src/roboy-ros-control-simulation \
  c9effa1973a2 /bin/bash
```

