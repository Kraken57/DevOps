# DOCKER

### *docker run -it <image_name>* **OR** *docker run -it --name <container_name(anything)> <image_name>*

> to get a image from docker hub and run it in your device and spin up a new container

### docker container ls

> list all the running docker containers

### docker container ls -a

> list all the containers even if it is off

### docker start <container_name>

> to start the container

### docker stop <container_name>

> to stop the container

### docker exec <container_name> <command>

### docker exec -it <container_name> bash

> for a particular isolated docker container

### docker images or docker image ls

> see the images present in your localmachine

### docker run -it -p <local_port>:<container_port> <image_name>

> port mapping

### docker run -it -p <local_port>:<container_port> -e key=value -e key=value <image_name>

> env

### To dockerize a project for example a nodejs

- Create a Dockerfile

```shell
FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs


# COPY <source> <destination>
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

RUN npm install

ENTRYPOINT [ "node", "main.js" ]
```
- Now to create this image
### docker build -t <image_name> .
>create the docker image of your file in the same folder

### Publishing to hub
- Go to hub.docker.com
- Create a free account
- CLick on Create Repository
- Give image name
- Select public
- Click Create
- Now you will get a docker command to create a image for ex : docker push <youraccountname>/<image_name>:tagname
- So create a image with this name <youraccountname>/<image_name> i.e. docker build -t <youraccountname>/<image_name> .
- Login to docker hub
- Now in the terminal write *docker push <youraccountname>/<image_name>*

### Docker Compose
- Create a file docker-compose.yml

```shell
version: "3.8"

services:
  postgres:
    image: postgres # hub.docker.com
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: postgres
      POSTGRES_DB: review
      POSTGRES_PASSWORD: password

  redis:
    image: redis
    ports:
      - "6379:6379"
```

- Now on terminal run this *docker compose up* or *sudo docker compose up* or *sudo docker compose up -d* to run in detached mode
- To stop run *docker compose down*