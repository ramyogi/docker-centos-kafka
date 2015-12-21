DOCKER_IMAGE := cantireinnovations/kafka:0.8.2.1
MAKEFLAGS += --always-make

build :
	docker build -t ${DOCKER_IMAGE} .

push : build
	docker push ${DOCKER_IMAGE}
