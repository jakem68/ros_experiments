# ros_experiments
## general
- [Master Github Markdown](https://guides.github.com/features/mastering-markdown/)
- [kuroemon2509 ROS cheatsheet](https://github.com/kuroemon2509/ROS-cheatsheet)
- [Turtlesim](http://wiki.ros.org/ROS/Tutorials/UnderstandingNodes)

## fiddling with ros in Docker containers
* From starting individual services off from image to setting up a docker-compose file: https://docs.docker.com/samples/library/ros/#networks
* Docker compose: ` $ docker-compose up -d `

* Start rosmaster container with access to display
```docker run --rm -it -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY roskinetic_master```
	*(afterwards added to docker-compose file)*
* Start rosmaster container with access to hardware acceleration (previously error starting up turtlesim_node): added

`devices:
  - /dev/dri` *(added to docker-compose file)*

* Start turtlesim in running rosmaster container: `docker exec master bash -c "source ros_entrypoint.sh ; rosrun turtlesim turtlesim_node"`

* Added ros-kinetic-rqt and ros-kinetic-rqt-common-plugins tot Dockerfile → rebuild images
* Pushed to Docker online as jankempeneers/ros-tutorials:rqt
```
docker login
docker tag 2648c60f3e98 jankempeneers/ros-tutorials:rqt
docker push jankempeneers/ros-tutorials:rqt
```

