FROM ruby

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install nodejs -y && \
    gem install rails bundler
RUN apt-get install -y npm
RUN npm install -g yarn

ONBUILD WORKDIR /opt
ONBUILD RUN rails new app
ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
ONBUILD RUN rails generate migration CreateProducts name:string
ONBUILD RUN rake db:migrate


# docker build -t ft-rails:on-build .
# docker build -f Dockerfile_from_subject -t ex02 .
# docker run -it --name ft-rails -p 3000:3000 ex02
