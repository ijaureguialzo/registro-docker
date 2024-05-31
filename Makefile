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
	@echo start / stop / restart
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

_start-command:
	@docker compose up -d --remove-orphans

start: _header _start-command _urls

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
