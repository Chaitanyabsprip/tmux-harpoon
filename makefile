INSTALL_PATH?=/usr/bin/harpoon

install: ./harpoon
	@install -m 0555 -C ./harpoon $(INSTALL_PATH)

uninstall:
	@rm $(INSTALL_PATH)
