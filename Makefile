db-prepare:
	docker compose run --rm api bin/rails db:prepare

up:
	docker compose up -d

down:
	docker compose down

test:
	docker compose run --rm api bin/rails test
