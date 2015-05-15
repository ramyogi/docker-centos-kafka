build : 
	docker build -t cantireinnovations/centos-kafka .

bash : build
	docker run -it cantireinnovations/centos-kafka bash

run :
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=$1 -e ZK=$2 -i -t cantireinnovations/centos-kafka /bin/bash