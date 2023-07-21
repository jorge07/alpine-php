REPO:=jorge07/alpine-php
DOCKER_RUN:=docker run --rm -v $(PWD):/app ${REPO}:${VERSION}
DOCKER_RUN_DEV:=$(DOCKER_RUN)-dev
ARCHS?=linux/amd64

build:
	docker buildx build --load --platform linux/amd64 -t $(REPO):${VERSION} --target main -f ${VERSION}/Dockerfile ${VERSION}/
	docker buildx build --load --platform linux/amd64 -t $(REPO):${VERSION}-dev --target dev -f ${VERSION}/Dockerfile ${VERSION}/

run-detached:
	docker run --name php${VERSION} -d -v $(PWD):/app $(REPO):${VERSION}
	docker run --name php${VERSION}-dev -d -v $(PWD):/app $(REPO):${VERSION}-dev

test-main:
	$(DOCKER_RUN) php -v
	$(DOCKER_RUN) sh -c "php -v | grep ${VERSION}"
	$(DOCKER_RUN) sh -c "php -v | grep OPcache"
	$(DOCKER_RUN) sh -c "php test/test.php | grep Iyo"
	$(DOCKER_RUN) sh -c "echo \"<?php echo ini_get('memory_limit');\" | php | grep 256M"

test-dev:
	$(DOCKER_RUN_DEV) sh -c "php -v | grep Xdebug"
	$(DOCKER_RUN_DEV) composer --version
	$(DOCKER_RUN_DEV) sh -c "php test/test.php | grep Iyo"
	$(DOCKER_RUN_DEV) sh -c "echo \"<?php echo ini_get('memory_limit');\" | php | grep 1G"

release: build
	echo "Releasing: ${REPO}:${SEMVER}"
	echo "Releasing: ${REPO}:${SEMVER}-dev"
	echo "Releasing: ${REPO}:${VERSION}"
	echo "Releasing: ${REPO}:${VERSION}-dev"
	$(eval export SEMVER=$(shell docker run --rm -v $(PWD):/app ${REPO}:${VERSION} php -r "echo phpversion();"))
	docker buildx build --platform $(ARCHS) --push -t $(REPO):${VERSION} --target main -f ${VERSION}/Dockerfile ${VERSION}/
	docker buildx build --platform $(ARCHS) --push -t $(REPO):${VERSION}-dev --target dev -f ${VERSION}/Dockerfile ${VERSION}/
	docker buildx build --platform $(ARCHS) --push -t $(REPO):${SEMVER} --target main -f ${VERSION}/Dockerfile ${VERSION}/
	docker buildx build --platform $(ARCHS) --push -t $(REPO):${SEMVER}-dev --target dev -f ${VERSION}/Dockerfile ${VERSION}/

test-all: test-all
	VERSION=8.2 make build
	VERSION=8.1 make build
	VERSION=8.0 make build
	VERSION=8.2 make test-main
	VERSION=8.1 make test-main
	VERSION=8.0 make test-main
	VERSION=8.2 make test-dev
	VERSION=8.1 make test-dev
	VERSION=8.0 make test-dev
