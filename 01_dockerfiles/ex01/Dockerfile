FROM debian

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

ENV TS3SERVER_LICENSE=accept

WORKDIR /home/teamspeak

EXPOSE 9987/udp 10011 30033

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget bzip2 && \
    wget http://dl.4players.de/ts/releases/3.13.2/teamspeak3-server_linux_amd64-3.13.2.tar.bz2 && \
    tar -xjvf teamspeak3-server_linux_amd64-3.13.2.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

ENTRYPOINT sh ts3server_minimal_runscript.sh

# ENTRYPOINT /bin/sh

# How to build it?
# docker build -t ex01 .

# How to run it?
# docker run --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
# https://teamspeak.com/en/downloads/
# зарегаться, ввести никнейм и ip во вкладке connect, а админпароль оставляем пустым, далее token из логов
