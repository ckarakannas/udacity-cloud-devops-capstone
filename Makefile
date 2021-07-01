setup:
	python3 -m venv ~/.cex-api
	# source ~/.cex-api/bin/activate

install-dev:
	pip install --upgrade pip && \
		pip install -r requirements/Development.txt

install:
	pip install --upgrade pip && \
		pip install -r requirements.txt

lint-docker-hadolint:
	docker run --rm -i hadolint/hadolint < Dockerfile
	find . -type f -name "*.py" | xargs pylint --disable=R,C,W0613

lint:
	hadolint Dockerfile
	find . -type f -name "*.py" | xargs pylint --disable=R,C,W0613

test:
	newman run postman/CEX-API-Collection-Tests.postman_collection.json \
		-e postman/Local.postman_environment.json \
		-d postman/test_data.csv
