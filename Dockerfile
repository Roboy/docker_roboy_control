FROM osrf/ros:indigo-desktop
RUN apt-get update
RUN apt-get install build-essential -y
# install ros_control
RUN apt-get install -y \
	ros-indigo-ros-control \
	ros-indigo-control-toolbox
RUN apt-get install -y python-rosinstall python-wstool
RUN apt-get install -y libncursesw5-dev ncurses-dev
RUN rm -rf /var/lib/apt/lists/*

RUN rosdep update

RUN mkdir -p /root/catkin_ws
RUN cd /root/catkin_ws
WORKDIR /root/catkin_ws

COPY roboy_control.rosinstall .
RUN wstool init src roboy_control.rosinstall
RUN wstool update -t src
RUN /bin/bash /root/catkin_ws/src/flexrayusbinterface/install_libftd2_and_udev_rules.sh
RUN rosdep install --from-paths src --ignore-src --rosdistro indigo


RUN /bin/bash -c "source /opt/ros/indigo/setup.bash && \
					catkin_make && source /root/catkin_ws/devel/setup.sh"