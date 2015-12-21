DOCKER_IMAGE := cantireinnovations/kafka:0.9.0.0
MAKEFLAGS += --always-make

build :
	docker build -t ${DOCKER_IMAGE} .

push : build
	docker push ${DOCKER_IMAGE}
