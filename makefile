INSTALL_PATH=$(HOME)/.local/bin/harpoon

install: ./harpoon
	@install -C ./harpoon $(INSTALL_PATH)

uninstall:
	@rm $(INSTALL_PATH)
