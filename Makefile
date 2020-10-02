.RECIPEPREFIX +=
.ONESHELL:
SHELL:=/bin/bash

# optionally load env vars from .env
# include .env

##
## ----------------------------------------------------------------------------
##   Test docker with SSH and systemd
## ----------------------------------------------------------------------------
##

port?=2022
name?=test-me

build: ## Docker build
    docker build -t $(name) .

run: ## Docker run
    docker run -d --privileged --rm --name $(name) -p $(port):22 -v /sys/fs/cgroup:/sys/fs/cgroup:ro $(name)

stop: ## Docker stop
    docker stop $(name) -t 1

exec-bash: ## Docker exec into bash
    docker exec -it $(name) bash

start-ssh: ## Run 'systemctl start ssh' in container
    docker exec $(name) systemctl start ssh

ssh: ## SSH into container
    ssh -i key root@localhost -p2022

help:
    @grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) \
        | sed -e 's/^.*Makefile://g' \
        | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' \
        | sed -e 's/\[32m##/[33m/'
    @echo

.DEFAULT_GOAL := help
