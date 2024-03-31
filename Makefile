# Makefile for Docker Compose commands

# Define your Docker Compose configuration file (if it's not named docker-compose.yml)
COMPOSE_FILE := docker-compose.yml

# Define the Docker Compose command with the common options
COMPOSE := docker-compose --env-file .env -f $(COMPOSE_FILE)
RUN := ${COMPOSE} run --rm web

# CPU Based settings

FMT_BOLD = \033[1m
FMT_BLUE = \033[36m
FMT_END = \033[0m

# Apple Silicon machines will have arm64 cpu type
CPU_TYPE := $(shell arch -arm64 uname -m 2> /dev/null || uname -m)

# Common commands
.PHONY: install run stop shell status console db-setup attach clean list setup

install:
	$(COMPOSE) build
	${RUN} bin/setup

setup: ## Run setup script
	${RUN} bin/setup

clean:
	${COMPOSE} down -v

run:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) down

shell:
	$(COMPOSE) run web bash  # Replace 'web' with the actual service name

console:
	$(COMPOSE) logs

db-setup:
	$(COMPOSE) run web rake db:setup  # Replace 'web' with the actual service name

# Attach to the application container
attach:
	docker attach $$(docker-compose ps -q web)

list:
	$(COMPOSE) ps -a
