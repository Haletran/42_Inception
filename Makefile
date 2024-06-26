# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: baptiste <baptiste@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 20:06:19 by baptiste          #+#    #+#              #
#    Updated: 2024/05/12 15:57:39 by baptiste         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GREEN='\033[0;32m'
NC='\033[0m'

all: print
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

print:
	@echo -e $(GREEN)" ▄█  ███▄▄▄▄    ▄████████    ▄████████    ▄███████▄     ███      ▄█   ▄██████▄  ███▄▄▄▄   "$(NC)
	@echo -e $(GREEN)"███  ███▀▀▀██▄ ███    ███   ███    ███   ███    ███ ▀█████████▄ ███  ███    ███ ███▀▀▀██▄ "$(NC)
	@echo -e $(GREEN)"███▌ ███   ███ ███    █▀    ███    █▀    ███    ███    ▀███▀▀██ ███▌ ███    ███ ███   ███ "$(NC)
	@echo -e $(GREEN)"███▌ ███   ███ ███         ▄███▄▄▄       ███    ███     ███   ▀ ███▌ ███    ███ ███   ███ "$(NC)
	@echo -e $(GREEN)"███▌ ███   ███ ███        ▀▀███▀▀▀     ▀█████████▀      ███     ███▌ ███    ███ ███   ███ "$(NC)
	@echo -e $(GREEN)"███  ███   ███ ███    █▄    ███    █▄    ███            ███     ███  ███    ███ ███   ███ "$(NC)
	@echo -e $(GREEN)"███  ███   ███ ███    ███   ███    ███   ███            ███     ███  ███    ███ ███   ███ "$(NC)
	@echo -e $(GREEN)"█▀    ▀█   █▀  ████████▀    ██████████  ▄████▀         ▄████▀   █▀    ▀██████▀   ▀█   █▀  "$(NC)
	@echo -e $(GREEN)"                                                                                          "$(NC)