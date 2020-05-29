lint:
	docker run --rm -i hadolint/hadolint hadolint --ignore DL3013 < Dockerfile
	pylint --disable=R,C,W1203 app/app.py

build:
	docker build . -t udacity-capstone:1.1

upload:
	./upload_docker.sh