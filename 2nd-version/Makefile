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
	@echo $(BCYAN)"-> Uptime Kuma :"$(NC)" http://10.11.249.22:3001"
	@echo $(BCYAN)"-> FTP :"$(NC)" ftp://10.11.249.22:21/"
	@echo $(BCYAN)"-> Static Site :"$(NC)" http://10.11.249.22:8080"

down:
	@docker compose -f ./srcs/docker-compose.yml down

stop:
	@docker compose -f ./srcs/docker-compose.yml stop
	@docker volume rm ~/data/uptime-kuma
	@docker volume rm /data/ftp
	@docker volume rm /data/static-site

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
