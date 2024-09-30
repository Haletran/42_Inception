# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bapasqui <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/05 15:35:56 by bapasqui          #+#    #+#              #
#    Updated: 2024/09/05 15:35:58 by bapasqui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GREEN='\033[0;32m'
BGREEN='\033[1;32m'
BLUE='\033[0;34m'
BCYAN='\033[1;36m'
NC='\033[0m'

all: print
	docker compose -f srcs/docker-compose.yml up --build -d --remove-orphans
	@echo $(BGREEN)"\n[ MANDATORY ] :"$(NC)
	@echo $(BCYAN)"-> Wordpress :"$(NC)" https://bapasqui.42.fr"
	@echo $(BCYAN)"-> Nginx :"$(NC)" https://bapasqui.42.fr"
	@echo $(BCYAN)"-> MariaDB :"$(NC)" http://bapasqui.42.fr:3036"
	@echo $(BGREEN)"\n[ BONUS ] :"$(NC)
	@echo $(BCYAN)"-> Uptime Kuma :"$(NC)" http://bapasqui.42.fr:3001"
	@echo $(BCYAN)"-> FTP :"$(NC)" ftp://10.11.249.22:21/"
	@echo $(BCYAN)"-> Static Site :"$(NC)" https://bapasqui.42.fr/static_site"
	@echo $(BCYAN)"-> Homepage :"$(NC)" https://bapasqui.42.fr/homepage" "(take a few seconds to load : js slow)"
	@echo $(BGREEN)"\n[ DEBUG ] :"$(NC)
	@echo $(BCYAN)"-> Portainer :"$(NC)" https://bapasqui.42.fr:9443"

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

down:
	@docker compose -f ./srcs/docker-compose.yml down
	-docker volume rm srcs_static_data srcs_uptime_data srcs_ftp_data srcs_homepage_data srcs_wordpress_data srcs_db_data
	-docker container prune -f
	-docker rmi $$(docker images -a -q)
	-docker volume prune -f
	-docker image prune -f -a
	-docker network prune -f
	-docker builder prune --all
	@echo "Do you want to remove all data ? [y/n]" && read ans && [ $${ans:-n} = y ] && make reset || echo "Data kept."

reset:
	@echo "Resetting all data..."
	@sudo rm -rf /home/bapasqui/data/*
	@mkdir -p ~/data/static_site
	@mkdir -p ~/data/uptime-kuma
	@mkdir -p ~/data/homepage
	@mkdir -p ~/data/adminer
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/db

clean:
	@docker system prune --all --volumes

re: down all

print:
	@echo  $(GREEN)" ▄█  ███▄▄▄▄    ▄████████    ▄████████    ▄███████▄     ███      ▄█   ▄██████▄  ███▄▄▄▄   "$(NC)
	@echo  $(GREEN)"███  ███▀▀▀██▄ ███    ███   ███    ███   ███    ███ ▀█████████▄ ███  ███    ███ ███▀▀▀██▄ "$(NC)
	@echo  $(GREEN)"███▌ ███   ███ ███    █▀    ███    █▀    ███    ███    ▀███▀▀██ ███▌ ███    ███ ███   ███ "$(NC)
	@echo  $(GREEN)"███▌ ███   ███ ███         ▄███▄▄▄       ███    ███     ███   ▀ ███▌ ███    ███ ███   ███ "$(NC)
	@echo  $(GREEN)"███▌ ███   ███ ███        ▀▀███▀▀▀     ▀█████████▀      ███     ███▌ ███    ███ ███   ███ "$(NC)
	@echo  $(GREEN)"███  ███   ███ ███    █▄    ███    █▄    ███            ███     ███  ███    ███ ███   ███ "$(NC)
	@echo  $(GREEN)"███  ███   ███ ███    ███   ███    ███   ███            ███     ███  ███    ███ ███   ███ "$(NC)
	@echo  $(GREEN)"█▀    ▀█   █▀  ████████▀    ██████████  ▄████▀         ▄████▀   █▀    ▀██████▀   ▀█   █▀  "$(NC)
	@echo  $(GREEN)"                                                                                          "$(NC)
