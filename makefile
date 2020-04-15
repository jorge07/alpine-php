REPO:=jorge07/alpine-php
DOCKER_RUN:=docker run --rm -v $(PWD):/app ${REPO}:${VERSION}
DOCKER_RUN_DEV:=$(DOCKER_RUN)-dev
build:
	docker build -t $(REPO):${VERSION} --target main -f ${VERSION}/Dockerfile ${VERSION}/
	docker build -t $(REPO):${VERSION}-dev --target dev -f ${VERSION}/Dockerfile ${VERSION}/
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
