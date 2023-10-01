
all: start

check:
	docker compose -f srcs/docker-compose.yml config

start:
	docker compose --env-file srcs/.env -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml stop

down: stop
	docker compose -f srcs/docker-compose.yml down --volumes
	docker image prune -f

re: fclean all

.PHONY: all start stop down
