#!/bin/sh

ros2 run micro_ros_setup configure_firmware.sh complex_msg_publisher
ros2 run micro_ros_setup build_firmware.sh
ros2 run micro_ros_setup flash_firmware.sh