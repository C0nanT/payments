# Database migrations
SERVICE ?= wallet
DB_PORT ?= 5444
DB_URL ?= postgres://payments_user:payments_password@localhost:$(DB_PORT)/$(SERVICE)?sslmode=disable
MIGRATE := migrate -path db/$(SERVICE)/migrations -database $(DB_URL)

.PHONY: migrate-up migrate-down migrate-version migrate-new

migrate-up:
	@$(MIGRATE) up

migrate-down:
	@$(MIGRATE) down 1

migrate-version:
	@$(MIGRATE) version

migrate-new:
	@test -n "$(name)" || (echo "usage: make migrate-new name=add_something" && exit 1)
	migrate create -ext sql -dir db/$(SERVICE)/migrations -seq $(name)
