FROM alpine

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

RUN apk update && \
    apk upgrade && \
    apk add emacs

ENTRYPOINT emacs test; /bin/sh

# How to build it?
# docker build -t ex00 .

# How to run it?
# docker run --rm -ti ex00
