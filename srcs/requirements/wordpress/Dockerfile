FROM debian:buster
EXPOSE 9000
RUN apt-get update
RUN apt-get install -y php php-common php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
RUN apt-get install wget

#used by php-fpm to start
RUN mkdir /run/php 

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/setup-wordpress.sh /usr/local/bin
RUN chmod +x /usr/local/bin/setup-wordpress.sh

CMD [ "/usr/local/bin/setup-wordpress.sh" ]