# This is an auto generated Dockerfile for ros:robot
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:kinetic-ros-base-xenial

ARG COMPOSE_HTTP_TIMEOUT
ARG COMPOSE_PARALLEL_LIMIT

# install ros packages
RUN apt-get update && \
    apt-get install -y ros-kinetic-robot=1.3.2-0* && \
    rm -rf /var/lib/apt/lists/*
RUN apt update && apt install -y libcanberra-gtk-module libcanberra-gtk3-module
RUN apt-get install -y dbus-x11
RUN apt-get install -y nano
RUN apt-get install -y ros-kinetic-ros-tutorials
RUN apt-get install -y ros-kinetic-rqt
RUN apt-get install -y ros-kinetic-rqt-common-plugins
RUN apt-get -y install sudo
RUN useradd -m docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

# adding this line to /etc/sudoers: echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers, check out /etc/sudoers.d/README