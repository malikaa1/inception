all: 
	[ -d /home/mrahmani/data/mariadb ] || sudo mkdir -p /home/mrahmani/data/mariadb
	[ -d /home/mrahmani/data/wordpress ] || sudo mkdir -p /home/mrahmani/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
clean:
	sudo rm -rf /home/mrahmani/data/*
re:	stop clean all