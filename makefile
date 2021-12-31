REPO:=jorge07/alpine-php
DOCKER_RUN:=docker run --rm -v $(PWD):/app ${REPO}:${VERSION}
DOCKER_RUN_DEV:=$(DOCKER_RUN)-dev
ARCHS:=linux/386
PUSH:=
build:
	docker buildx build --platform $(ARCHS) $(PUSH) -t $(REPO):${VERSION} --target main -f ${VERSION}/Dockerfile ${VERSION}/
	docker buildx build --platform $(ARCHS) $(PUSH) -t $(REPO):${VERSION}-dev --target dev -f ${VERSION}/Dockerfile ${VERSION}/
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
	$(eval export SEMVER=$(shell docker run --rm -v $(PWD):/app ${REPO}:${VERSION} php -r "echo phpversion();"))
	docker tag ${REPO}:${VERSION} ${REPO}:${SEMVER}
	docker tag ${REPO}:${VERSION}-dev ${REPO}:${SEMVER}-dev
	echo "Releasing: ${REPO}:${SEMVER}"
	echo "Releasing: ${REPO}:${SEMVER}-dev"
	echo "Releasing: ${REPO}:${VERSION}"
	echo "Releasing: ${REPO}:${VERSION}-dev"
	docker push ${REPO}:${VERSION}
	docker push ${REPO}:${SEMVER}
	docker push ${REPO}:${VERSION}-dev
	docker push ${REPO}:${SEMVER}-dev
test-all: test-all
	VERSION=8.1 make build
	VERSION=8.0 make build
	VERSION=7.4 make build
	VERSION=7.3 make build
	VERSION=7.2 make build
	VERSION=7.1 make build
	VERSION=8.1 make test-main
	VERSION=8.0 make test-main
	VERSION=7.4 make test-main
	VERSION=7.3 make test-main
	VERSION=7.2 make test-main
	VERSION=7.1 make test-main
	VERSION=8.1 make test-dev
	VERSION=8.0 make test-dev
	VERSION=7.4 make test-dev
	VERSION=7.3 make test-dev
	VERSION=7.2 make test-dev
	VERSION=7.1 make test-dev
