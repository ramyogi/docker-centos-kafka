build : 
	docker build -t cantireinnovations/centos-kafka .

run :
	docker run -it cantireinnovations/centos-kafka bash
