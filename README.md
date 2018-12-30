# ros_experiments

##### Table of Contents  
https://github.com/jakem68/ros_experiments#general
https://github.com/jakem68/ros_experiments#docker-links
https://github.com/jakem68/ros_experiments#fiddling-with-ros-in-docker-containers

## general
- [Master Github Markdown](https://guides.github.com/features/mastering-markdown/)
- [kuroemon2509 ROS cheatsheet](https://github.com/kuroemon2509/ROS-cheatsheet)
- [Turtlesim](http://wiki.ros.org/ROS/Tutorials/UnderstandingNodes)

## docker links
* Docker sandbox: https://training.play-with-docker.com/beginner-linux/#Task_2
* Docker images: https://hub.docker.com/search?q=idlab&type=image
* ROS Docker image: https://hub.docker.com/_/ros
* Do not run docker images as root: https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b `--user $(id -u):$(id -g)`
* Running multiple commands with docker exec:

      sudo docker exec boring_hawking bash -c "cd /var/log ; tar -cv ./file.log"

* Uploading and tagging the Docker repository: https://docs.docker.com/get-started/part2/#tag-the-image


## fiddling with ros in docker containers
* From starting individual services off from image to setting up a docker-compose file: https://docs.docker.com/samples/library/ros/#networks
* Docker compose: ` $ docker-compose up -d `

* Start ros master container with access to display

      docker run --rm -it -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY roskinetic_master
	*(afterwards added to docker-compose file)*
* Start rosmaster container with access to hardware acceleration (previously error starting up turtlesim_node): added `devices: - /dev/dri` *(added to docker-compose file)*

* Start turtlesim in running rosmaster container:

      docker exec master bash -c "source ros_entrypoint.sh ; rosrun turtlesim turtlesim_node"

  * Start more than one by giving individual names:
  
        docker exec master bash -c "source ros_entrypoint.sh ; rosrun turtlesim turtlesim_node __name:=turtle1"

* Added ros-kinetic-rqt and ros-kinetic-rqt-common-plugins tot Dockerfile → rebuild images
* Pushed to Docker online as jankempeneers/ros-tutorials:rqt

      docker login
      docker tag 2648c60f3e98 jankempeneers/ros-tutorials:rqt
      docker push jankempeneers/ros-tutorials:rqt


