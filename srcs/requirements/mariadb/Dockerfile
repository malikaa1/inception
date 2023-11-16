FROM debian:buster
RUN apt update && apt install -y mariadb-server && apt install -y mariadb-client

COPY ./tools/init.sh .
RUN chmod +x ./init.sh


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


RUN mkdir /run/mysqld
RUN chown -R mysql:mysql /run/mysqld


CMD ["./init.sh"]
