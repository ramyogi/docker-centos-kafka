image := cantireinnovations/kafka@kafka-v0.8.2.1_scala-v2.10

build : 
	docker build -t $(image) .

bash : build
	docker run -i -t --rm \
        $(image) \
        bash

run :
	docker run -i -t --rm \
        -e HOST_IP=$1 \
        -e ZK=$2 \
         $(image)

push : build
	docker push $(image)