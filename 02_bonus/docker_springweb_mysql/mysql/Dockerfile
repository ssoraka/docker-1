FROM mysql:5.7

MAINTAINER ssoraka <ssoraka@student.21-school.ru>

EXPOSE 3306
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
RUN echo "explicit_defaults_for_timestamp = 1" >> /etc/mysql/my.cnf
RUN echo "" >> /etc/mysql/my.cnf

# docker build -t my .
# docker run -dit --name test -p 3306:3306 --restart on-failure -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=public -e MYSQL_USER=root -e MYSQL_PASSWORD=root my --default-authentication-plugin=mysql_native_password
