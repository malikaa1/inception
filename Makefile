all: 
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build
stop:
	sudo docker-compose -f ./srcs/docker-compose.yml stop