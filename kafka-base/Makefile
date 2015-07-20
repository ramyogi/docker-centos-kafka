image := cantireinnovations/kafka-base@kafka-v0.8.2.1_scala-v2.10

build : 
	docker build -t $(image) .

bash : build
	docker run -i -t $(image) bash

push : build
	docker push $(image)
