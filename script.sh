#!/bin/bash

#7Jxp4sl3s(9#xxC3%d
    mkdir ~/goinfre/.docker

    echo "____01____"
    docker-machine create --driver virtualbox --virtualbox-memory "3072" --virtualbox-cpu-count "2" Char

    echo "____03____"
    eval $(docker-machine env Char)

    echo "____06____"
    docker run -d -p 5000:80 --name overlord --restart=always nginx

    echo "____08____"
    docker run -dit --rm --name sasha alpine
    docker exec sasha apk update
    docker exec sasha apk upgrade
    docker exec sasha apk add --update alpine-sdk

# echo "#include <stdio.h>" > main.c ; echo ' int main() {printf("Hello World!!!\n"); return (0);}' >> main.c
    
    echo "____10____"
    docker volume create --name hatchery

    echo "____12____"
    docker run -dit --name spawning-pool --restart on-failure -e MYSQL_ROOT_PASSWORD=Kerrigan -e MYSQL_DATABASE=zerglings -v hatchery:/var/lib/mysql mysql --default-authentication-plugin=mysql_native_password

    echo "____14____"
    docker run -dit --name lair -p 8080:80 --link spawning-pool:mysql wordpress

    echo "____15____"
    docker run --name roach-warden  -dit --link spawning-pool:db -p 8081:80 phpmyadmin/phpmyadmin

    echo "____19____"
    docker run --name Abathur -v ~/:/root -p 3000:3000 -dit python:2-slim
    docker exec Abathur pip install Flask

    echo '
from flask import Flask, jsonify, request
import json, os, signal

app = Flask(__name__)

@app.route("/")
def hello_world():
	return "<h1>Hello, World!</h1>"

@app.route("/stopServer", methods=['"'GET'"'])
def stopServer():
	os.kill(os.getpid(), signal.SIGINT)
	return jsonify({ "success": True, "message": "Server is shutting down..." })
' > ~/app.py

    docker exec -d -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000

    echo "____20____"
    docker swarm init --advertise-addr $(docker-machine ip Char)

    echo "____21____"
    docker-machine create --driver virtualbox Aiur

    echo "____22____"
    docker-machine ssh Aiur "docker swarm join --token $(docker swarm join-token worker -q) $(docker-machine ip Char):2377"

    echo "____23____"
    docker network create -d overlay overmind

    echo "____24____"
#    docker service create -d --network overmind --name orbital-command -e RABBITMQ_DEFAULT_USER=root -e RABBITMQ_DEFAULT_PASS=root --hostname Char -p 8082:15672 rabbitmq:3-management

#    echo "____25____"
#    docker service ls

    echo "____26____"
 #   docker service create -d --network overmind --name engineering-bay --replicas 2 -e OC_USERNAME=root -e OC_PASSWD=root 42school/engineering-bay

    echo "____27____"
#    docker service logs -f $(docker service ps engineering-bay -f "name=engineering-bay.1" -q)

    echo "____28____"
#    docker service create -d --network overmind --name marines --replicas 2 -e OC_USERNAME=root -e OC_PASSWD=root 42school/marine-squad

#    echo "____29____"
#    docker service ps marines

#    echo "____30____"
#    docker service scale -d marines=20

#    echo "____31____"
#    docker service rm $(docker service ls -q)

#    echo "____32____"
#    docker rm -f $(docker ps -a -q)

#    echo "____33____"
#    docker rmi $(docker images -a -q)

#    echo "____34____"
#    docker-machine rm -y Aiur

    echo "The End!"

    zsh