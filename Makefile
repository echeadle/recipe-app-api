build:
	docker compose -f docker-compose.yml up --build -d --remove-orphans

up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

show_logs:
	docker compose -f docker-compose.yml logs

migrate:
	docker compose -f docker-compose.yml run --rm api python3 manage.py migrate

makemigrations:
	docker compose -f docker-compose.yml run --rm api python3 manage.py makemigrations

collectstatic:
	docker compose -f docker-compose.yml run --rm api python3 manage.py collectstatic --no-input --clear

superuser:
	docker compose -f docker-compose.yml run --rm app sh -c "python manage.py createsuperuser"

down-v:
	docker compose -f docker-compose.yml down -v

volume:
	docker volume inspect authors-src_local_postgres_data

authors-db:
	docker compose -f docker-compose.yml exec postgres psql --username=alphaogilo --dbname=authors-live

flake8:
	docker compose -f docker-compose.yml run --rm app sh -c "flake8"

black-check:
	docker compose -f docker-compose.yml exec api black --check --exclude=migrations .

black-diff:
	docker compose -f docker-compose.yml exec api black --diff --exclude=migrations .

black:
	docker compose -f docker-compose.yml exec api black --exclude=migrations .

isort-check:
	docker compose -f docker-compose.yml exec api isort . --check-only --skip env --skip migrations

isort-diff:
	docker compose -f docker-compose.yml exec api isort . --diff --skip env --skip migrations

isort:
	docker compose -f docker-compose.yml exec api isort . --skip env --skip migrations	

test:
	docker compose -f docker-compose.yml run --rm app sh -c "python manage.py test"




