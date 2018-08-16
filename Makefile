CONTAINER_NAME?=cpp-container
IMG_NAME?=cpp-program
TAG?=latest

default: build-docker

build-docker:
	docker build . -t ${IMG_NAME}:${TAG}

run-docker:
	docker run --rm -it ${IMG_NAME}:${TAG}

run-docker-with-parameters:
	docker run --rm -it ${IMG_NAME}:${TAG} parameter1 parameter2

run-docker-detached:
	docker run -d --restart=always --name=${CONTAINER_NAME} ${IMG_NAME}:${TAG}

upload-docker: build-docker
	docker tag ${IMG_NAME}:${TAG} ${DOCKER_REPOSITORY}:${TAG}
	docker push ${DOCKER_REPOSITORY}:${TAG}

clean:
	rm bin/*

.PHONY: upload-docker-to-ecr
