FROM ubuntu:18.04

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install wget openssh-server tzdata ca-certificates emacs && \
    apt -y clean

ENV TERM xterm

RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
RUN chmod 777 ./script.deb.sh && ./script.deb.sh
RUN apt-get install -y gitlab-ce
RUN apt -y clean

ARG EXTERNAL_URL="192.168.99.115"
ARG HTTPS_PORT="443"
ARG GITLAB_OMNIBUS_CONFIG="external_url 'https://${EXTERNAL_URL}/'; letsencrypt['enable'] = false"

EXPOSE 22 80 ${HTTPS_PORT}

RUN mkdir -p /etc/gitlab/ssl && \
    chmod 755 /etc/gitlab/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/gitlab/ssl/${EXTERNAL_URL}.key -out /etc/gitlab/ssl/${EXTERNAL_URL}.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=docker-1/CN=${EXTERNAL_URL}" && \
    chmod 600 /etc/gitlab/ssl/* && \
    sed -i "s/\# letsencrypt\['enable'\] = nil/letsencrypt\['enable'\] = false/" /etc/gitlab/gitlab.rb && \
    sed -i "s/external_url 'http:\/\/gitlab.example.com'/external_url 'https:\/\/${EXTERNAL_URL}:${HTTPS_PORT}'/" /etc/gitlab/gitlab.rb && \
    sed -i "s/# nginx\['redirect_http_to_https'\] = false/nginx\['redirect_http_to_https'\] = true/" /etc/gitlab/gitlab.rb

RUN mkdir -p /run/sshd
RUN echo 'root:root' | chpasswd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "Port 22" >> /etc/ssh/sshd_config
RUN /etc/init.d/ssh restart

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && /usr/sbin/sshd && gitlab-ctl reconfigure && tail -f /dev/null

# How to build it?
# docker build -t ex03 .

# How to run it?
# docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
