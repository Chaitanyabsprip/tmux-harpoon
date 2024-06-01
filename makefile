INSTALL_PATH=$(HOME)/.local/bin/harpoon

install: ./tharp
	@install -C ./tharp $(INSTALL_PATH)

uninstall:
	@rm $(INSTALL_PATH)
