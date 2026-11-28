.PHONY: help install run makemigrations migrate test shell build up down logs docker-test docker-shell

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-16s %s\n", $$1, $$2}'

# --- Local (uv, SQLite) ---
install: ## Install dependencies
	uv sync

run: ## Run the dev server locally
	uv run python manage.py runserver

makemigrations: ## Create migrations
	uv run python manage.py makemigrations

migrate: ## Apply migrations
	uv run python manage.py migrate

test: ## Run tests locally
	uv run python manage.py test

shell: ## Open Django shell
	uv run python manage.py shell

# --- Docker (Postgres) ---
build: ## Build images
	docker compose build

up: ## Start db + api in the background
	docker compose up -d

down: ## Stop containers
	docker compose down

logs: ## Follow api logs
	docker compose logs -f api

docker-test: ## Run tests inside the api container
	docker compose run --rm api python manage.py test

docker-shell: ## Open Django shell inside the api container
	docker compose run --rm api python manage.py shell


# --- Production (VM) ---
PROD = docker compose -f docker-compose.yaml -f docker-compose.prod.yaml

prod-up: ## Build and start the production stack
	$(PROD) up -d --build

prod-down: ## Stop the production stack
	$(PROD) down

prod-logs: ## Follow production api logs
	$(PROD) logs -f api

deploy: ## Pull latest code and rebuild/restart production
	git pull
	$(PROD) up -d --build