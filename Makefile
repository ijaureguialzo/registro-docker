#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------------------------
	@echo password
	@echo start / stop / restart
	@echo start-traefik
	@echo gc
	@echo logs / stats
	@echo clean
	@echo ------------------------------------------

_header:
	@echo ---------------
	@echo Registro Docker
	@echo ---------------

_urls: _header
	${info }
	@echo ----------------------------------------------
	@echo [Registro Docker] https://registro-docker.test
	@echo ----------------------------------------------

_touch_file:
	@docker compose run --rm htpasswd touch htpasswd

password: _touch_file
	@docker compose run --rm htpasswd clave-registro.sh
	@docker compose restart registry

_start-command: _touch_file
	@docker compose up -d --remove-orphans https-portal

start: _header _start-command _urls

_start-command-traefik: _touch_file
	@docker compose -f docker-compose.yml -f docker-compose.traefik.yml up -d ui

start-traefik: _header _start-command-traefik _urls

stop:
	@docker compose stop

restart: stop start

gc:
	@docker compose exec registry registry garbage-collect config.yml

logs:
	@docker compose logs https-portal

stats:
	@docker stats

clean:
	@docker compose down -v --remove-orphans
