
down:
	docker-compose down

up:
	docker-compose up -d

pull:
	docker-compose pull

restart:
	docker-compose down && docker-compose pull && docker-compose up -d

