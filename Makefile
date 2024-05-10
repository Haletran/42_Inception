all: print
	@docker compose -f ./srcs/docker-compose.yml up -d --build

print:
	@echo -e '\033[1;32m$$$$$$\                                          $$\     $$\                     \033[0m'
	@echo -e '\033[1;32m\__$$  _|                                         $$ |    \__|                    \033[0m'
	@echo -e '\033[1;32m  $$ |  $$$$$$$\   $$$$$$$\  $$$$$$\   $$$$$$\ $$$$$$\   $$\  $$$$$$\  $$$$$$$\  \033[0m'
	@echo -e '\033[1;32m  $$ |  $$  __$$\ $$  _____|$$  __$$\ $$  __$$\\_$$  _|  $$ |$$  __$$\ $$  __$$\ \033[0m'
	@echo -e '\033[1;32m  $$ |  $$ |  $$ |$$ /      $$$$$$$$ |$$ /  $$ | $$ |    $$ |$$ /  $$ |$$ |  $$ |\033[0m'
	@echo -e '\033[1;32m  $$ |  $$ |  $$ |$$ |      $$   ____|$$ |  $$ | $$ |$$\ $$ |$$ |  $$ |$$ |  $$ |\033[0m'
	@echo -e '\033[1;32m$$$$$$\ $$ |  $$ |\$$$$$$$\ \$$$$$$$\ $$$$$$$  | \$$$$  |$$ |\$$$$$$  |$$ |  $$ |\033[0m'
	@echo -e '\033[1;32m\______|\__|  \__| \_______| \_______|$$  ____/   \____/ \__| \______/ \__|  \__|\033[0m'
	@echo -e '\033[1;32m                                      $$ |                                       \033[0m'
	@echo -e '\033[1;32m                                      $$ |                                       \033[0m'
	@echo -e '\033[1;32m                                      \__|                                       \033[0m'

