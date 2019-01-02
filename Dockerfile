# This is an auto generated Dockerfile for ros:robot
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:kinetic-ros-base-xenial

ARG COMPOSE_HTTP_TIMEOUT
ARG COMPOSE_PARALLEL_LIMIT

# install ros packages
RUN apt-get update && \
    apt-get install -y ros-kinetic-robot=1.3.2-0* && \
    apt-get install -y ros-kinetic-ros-tutorials && \
    apt-get install -y ros-kinetic-rqt && \
    apt-get install -y ros-kinetic-rqt-common-plugins && \
    rm -rf /var/lib/apt/lists/*

# to run X11
RUN apt update && \
    apt install -y libcanberra-gtk-module libcanberra-gtk3-module && \
    apt-get install -y dbus-x11
# RUN apt-get install -y dbus-x11

# easyier to edit files
RUN apt-get install -y nano

# add user docker, make him sudo, add sourcing of ros_entrypoint in .bashr for when logging in via new terminal
RUN apt-get -y install sudo && \
    useradd -m docker && \
    echo "docker:docker" | chpasswd && \
    adduser docker sudo && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    printf "\nsource /ros_entrypoint.sh"  >> ~/.bashrc && \
    printf "\nsource /ros_entrypoint.sh"  >> /home/docker/.bashrc
