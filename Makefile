start-venv:
	python3 -m venv backend/venv
	backend/venv/bin/pip install -r backend/requirements.txt

db-start:
	docker compose -f backend/docker-compose.yml up -d postgres

db-drop:
	docker compose -f backend/docker-compose.yml rm -sf postgres
	docker volume rm -f test_api_data
	docker volume rm -f backend_data

clean-up:
	docker system prune
	docker volume prune
	docker volume rm $(docker volume ls -qf dangling=true)

migrate:
	backend/venv/bin/python3 backend/src/manage.py makemigrations
	backend/venv/bin/python3 backend/src/manage.py migrate

build: start-venv db-start migrate
