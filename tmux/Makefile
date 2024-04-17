.PHONY: install
install: install-tpm
	stow --target $(HOME) --verbose .
	@echo "Plugin installation complete. Press prefix + I (capital i) in tmux to fetch the plugin."

install-tpm: 
		if [ ! -d ~/.tmux/plugins/tpm ]; then \
			git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
			echo "TPM installed successfully."; \
		else \
			echo "TPM already installed. Skipping cloning step."; \
		fi

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
