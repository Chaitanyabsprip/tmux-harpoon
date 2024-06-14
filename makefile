.PHONY: test

INSTALL_PATH?=/usr/bin/harpoon
IMAGE_NAME=harpoon-test

install: ./harpoon
	@install -m 0555 -C ./harpoon $(INSTALL_PATH)

uninstall:
	@rm $(INSTALL_PATH)

test: | test/.ran-build-docker
	@docker run -h $(IMAGE_NAME) --name $(IMAGE_NAME) $(IMAGE_NAME)
	@docker rm $(IMAGE_NAME) >/dev/null

test/.ran-build-docker: test/Dockerfile harpoon test/driver.sh
	@$(MAKE) -- --clean >/dev/null
	@docker build -t $(IMAGE_NAME) -f test/Dockerfile .
	@touch $@

--clean:
	@docker ps -a --format '{{.Image}}' | grep -w "$(IMAGE_NAME)" \
		| xargs -I {} docker rm {} >/dev/null 2>&1 || :;
	@docker images -a --format '{{.Repository}}' | grep -w "$(IMAGE_NAME)" \
		| xargs -I {} docker rmi {} >/dev/null 2>&1 || :;
