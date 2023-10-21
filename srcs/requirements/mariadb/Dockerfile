FROM debian:buster
EXPOSE 3306

RUN apt-get update && apt-get install -y mariadb-server && apt-get install -y mariadb-client

COPY ./tools/configure-mariadb.sh .
RUN chmod +x ./configure-mariadb.sh


CMD [ "./configure-mariadb.sh"]