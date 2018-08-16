# Testing it locally

Build the Docker image:
```bash
make build-docker
```

Run the Docker image interactively
```bash
make run-docker
```

Run the Docker image interactively with parameters
```bash
make run-docker-with-parameters
```

Run the Docker image detached
```bash
make run-docker-detached
```

Check if the container is running
```bash
docker ps
```

See the container output
```bash
docker logs cpp-container
```

Delete the detached Docker image (important!)
```bash
docker stop cpp-container
docker rm cpp-container
```

# Deploying a C++ application to AWS with Docker

Build the Docker image:
```bash
make build-docker
```

Login to AWS ECR:
```bash
$(aws ecr get-login --no-include-email --region us-east-1)
```

Upload the Docker image to the AWS ECR repository:
```bash
DOCKER_REPOSITORY=<repository_url> TAG=<tag> make upload-docker
```

Log into a Docker-ready AWS EC2 instance and run:
```bash
docker run -d --restart=always --name=cpp-container <repository_url>:<tag>
```

# Adding new libraries to the container

Edit the Dockerfile and install any libraries you want through apt-get, the same way libboost is installed in this example.
