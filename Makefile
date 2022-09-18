NAME = inception

url = oipadeol.42.fr


$(NAME): volume-dir
	docker compose -f src/docker-compose.yml up --build

volume-dir:
	mkdir -p /home/${USER}/data
	mkdir -p /home/${USER}/data/db
	mkdir -p /home/${USER}/data/www

reload: 
	docker compose -f src/docker-compose.yml up 

host: 
	$(sudo echo "127.0.0.1 $url" >> /etc/hosts)

all: $(NAME)

clean: 
	docker compose -f src/docker-compose.yml down -v --rmi all --remove-orphans  
	# rm -rf /home/${USER}/data/*

fclean:
	docker rm -f `docker ps -aq`
	docker rmi -f `docker images -aq`