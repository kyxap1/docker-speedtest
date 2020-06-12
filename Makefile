SHELL=/bin/bash -e

.PHONY: pull validate build up up-debug logs down purge

all: validate build up

# docker-compose related commands
pull:
	@git pull --ff
validate:
	@docker-compose config --quiet
build:
	@docker-compose build
up:
	@docker-compose up -d --force-recreate
up-debug:
	@docker-compose up --force-recreate
logs:
	@docker-compose logs --follow
down:
	@docker-compose down
purge:
	@docker-compose down --volumes
