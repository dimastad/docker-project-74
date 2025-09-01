# Help command
help:
	@echo "Available commands:"
	@echo ""
	@echo "CI/CD Commands:"
	@echo "  ci             - Run continuous integration pipeline (tests with Docker Compose)"
	@echo ""
	@echo "Docker Commands:"
	@echo "  docker-up      - Start application with Docker Compose"
	@echo "  docker-down    - Stop Docker Compose services"
	@echo "  docker-test    - Run tests in Docker container"
	@echo "  docker-setup   - Setup dependencies in Docker container"
	@echo "  docker-logs    - Show application logs"
	@echo "  docker-restart - Restart application container"
	@echo "  docker-clean   - Clean up Docker resources"
	@echo "  docker-status  - Show container status"
	@echo "  docker-build-production - Build production Docker image"
	@echo ""
	@echo "Development Commands:"
	@echo "  setup          - Setup project dependencies and run migrations"
	@echo "  dev            - Start development mode"
	@echo "  test           - Run tests locally"
	@echo "  build          - Build frontend assets"
	@echo "  lint           - Run ESLint"
	@echo "  lint-fix       - Run ESLint with auto-fix"

# CI/CD commands
ci:
	docker-compose -f docker-compose.yml build app
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# Docker Compose commands
docker-up:
	docker-compose up

docker-down:
	docker-compose down

docker-test:
	docker-compose -f docker-compose.yml build app
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-setup:
	docker-compose run --rm app make setup

docker-logs:
	docker-compose logs -f app

docker-restart:
	docker-compose restart app

docker-clean:
	docker-compose down --volumes --remove-orphans

docker-status:
	docker-compose ps

docker-build-production:
	docker-compose -f docker-compose.yml build app

# Development commands
setup:
	cd app && make setup

dev:
	cd app && make dev

test:
	cd app && make test

build:
	cd app && make build

lint:
	cd app && make lint

lint-fix:
	cd app && make lint-fix
