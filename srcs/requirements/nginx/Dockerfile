FROM debian:buster
EXPOSE 80
EXPOSE 443
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get -y install openssl
COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf
COPY ./conf/index.html /var/www/wordpress/
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/wordpress.key -out /etc/ssl/certs/wordpress.crt -subj="/CN=mrahmani.42.fr"


CMD [ "nginx","-g","daemon off;" ]