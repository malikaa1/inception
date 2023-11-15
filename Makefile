all: 
	sudo docker-compose -f ./srcs/docker-compose.yml up --build
stop:
	sudo docker-compose -f ./srcs/docker-compose.yml stop
clean:
	sudo rm -rf /home/mrahmani/data/*
re:	stop clean all

