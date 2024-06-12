INSTALL_PATH?=/usr/bin/harpoon

install: ./harpoon
	@install -m 0555 -C ./harpoon $(INSTALL_PATH)

uninstall:
	@rm $(INSTALL_PATH)

test: docker
	@docker run -h harpoon-test --name harpoon-test harpoon-test

docker: test/Dockerfile harpoon test/driver.sh --clean
	@docker build -t harpoon-test -f test/Dockerfile .

--clean:
	@docker ps -a --format '{{.Image}}' | grep -w "harpoon-test" \
		| xargs -I {} docker rm {} >/dev/null 2>&1 || :;
	@docker images -a --format '{{.Repository}}' | grep -w "harpoon-test" \
		| xargs -I {} docker rmi {} >/dev/null 2>&1 || :;

