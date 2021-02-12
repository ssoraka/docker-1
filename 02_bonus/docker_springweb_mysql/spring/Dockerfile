FROM debian

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y tzdata default-jdk default-jre git emacs maven

COPY q1 /restService
WORKDIR /restService
RUN mvn package -DskipTests=true
ENTRYPOINT java -jar target/serving-web-content-0.0.1-SNAPSHOT.jar

# docker build -t spr .
# docker run -ti spr