#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage: ./configure_firmware.sh [node_name]" 1>&2
  exit 1
fi

ros2 run micro_ros_setup configure_firmware.sh $1
ros2 run micro_ros_setup build_firmware.sh
ros2 run micro_ros_setup flash_firmware.sh