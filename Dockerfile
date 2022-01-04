FROM ros:foxy

env ROS_DISTRO foxy

# for source command
SHELL ["/bin/bash", "-c"]

RUN source /opt/ros/${ROS_DISTRO}/setup.bash

# microros
WORKDIR /extern
RUN git clone  -b ${ROS_DISTRO} https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup
RUN apt-get update \
  && rosdep update \
  && source /opt/ros/${ROS_DISTRO}/setup.bash \
  && rosdep install --from-path src --ignore-src -y \
  && apt-get install python3-pip --no-install-recommends -y \
  && apt-get clean && rm -rf /var/lib/opt/lists/*

RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
  && colcon build \
  && source install/local_setup.bash
