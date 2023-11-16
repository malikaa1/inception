FROM debian:buster
EXPOSE 443
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get -y install openssl

# Create ssl certIficate 
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/wordpress.key -out /etc/ssl/certs/wordpress.crt -subj="/CN=mrahmani.42.fr"

# copy 
COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf

# start nginx in non daemon mode
CMD [ "nginx","-g","daemon off;" ]