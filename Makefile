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
	docker compose -f srcs/docker-compose.yml up --build -d
	@echo $(BGREEN)"\n[ MANDATORY ] :"$(NC)
	@echo $(BCYAN)"-> Wordpress :"$(NC)
	@echo $(BGREEN)"\n[ BONUS ] :"$(NC)
	@echo $(BCYAN)"-> Uptime Kuma :"$(NC)" http://bapasqui.42.fr:3001"
	@echo $(BCYAN)"-> FTP :"$(NC)" ftp://10.11.249.22:21/"
	@echo $(BCYAN)"-> Static Site :"$(NC)" http://bapasqui.42.fr:8080"
	@echo $(BCYAN)"-> Homepage :"$(NC)" http://bapasqui.42.fr:3000"
	@echo $(BGREEN)"\n[ DEBUG ] :"$(NC)
	@echo $(BCYAN)"-> Portainer :"$(NC)" https://bapasqui.42.fr:9443"

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_static_data srcs_uptime_data srcs_ftp_data srcs_homepage_data
	@sudo docker rmi $$(docker images -a -q) -f
	@docker volume prune -f
	reset

reset:
	@echo "Resetting all data..."
	@sudo rm -rf /home/bapasqui/data/*
	@mkdir -p ~/data/static_site
	@mkdir -p ~/data/uptime-kuma
	@mkdir -p ~/data/ftp
	@mkdir -p ~/data/homepage

re: all

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
