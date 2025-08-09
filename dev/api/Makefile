# Variables configurables
PROJECT_PATH := ../../../api
IMAGE_NAME := bloqueapologetico-api
DOCKER_HUB_USER := jrodriguez0293
TAG := latest

ARCH := $(shell uname -m)

.PHONY: all build push run

all: build push

build:
	@echo "Construyendo imagen Docker para api..."
	@echo "Detectando arquitectura..."
	@if [ "$(ARCH)" = "arm64" ] || [ "$(ARCH)" = "aarch64" ]; then \
		echo "Arquitectura ARM detectada → usando buildx con plataforma linux/amd64"; \
		docker buildx build --platform linux/amd64 -f Dockerfile -t $(IMAGE_NAME):$(TAG) $(PROJECT_PATH); \
	else \
		echo "Arquitectura x86 detectada → usando docker build normal"; \
		docker build -f Dockerfile -t $(IMAGE_NAME):$(TAG) $(PROJECT_PATH); \
	fi

push:
	@echo "Etiquetando imagen..."
	docker tag $(IMAGE_NAME):$(TAG) $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)
	@echo "Pusheando imagen a Docker Hub..."
	docker push $(DOCKER_HUB_USER)/$(IMAGE_NAME):$(TAG)

run:
	@echo "Ejecutando contenedor con .env..."
	docker run --rm -it --platform linux/amd64 --env-file ../.env --entrypoint /bin/sh $(IMAGE_NAME):$(TAG)