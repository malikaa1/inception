FROM debian:buster
EXPOSE 9000
RUN apt-get update
RUN apt-get install -y php php-common php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath

#used by php-fpm 
RUN mkdir /run/php 

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 127.0.0.1:9000|' /etc/php/7.3/fpm/pool.d/www.conf

RUN cat /etc/php/7.3/fpm/pool.d/www.conf | grep "listen = "

CMD [ "/usr/sbin/php-fpm7.3","--nodaemonize","--fpm-config", "/etc/php/7.3/fpm/php-fpm.conf" ]