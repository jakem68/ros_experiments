FROM jankempeneers/ros-tutorials:rqt
# install ros tutorials packages

ARG COMPOSE_HTTP_TIMEOUT
ARG COMPOSE_PARALLEL_LIMIT

RUN apt-get update && rm -rf /var/lib/apt/lists/
