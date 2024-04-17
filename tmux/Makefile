.PHONY: install
install: install-tpm
	@if [ -f ~/.tmux.conf ]; then \
		mv ~/.tmux.conf ~/.tmux.conf.bak; \
		echo "Existing ~/.tmux.conf backed up as ~/.tmux.conf.bak"; \
	fi
	stow --target $(HOME) --verbose .
	@echo "Plugin installation complete. Press prefix + I (capital i) in tmux to fetch the plugin."

.PHONY: install-tpm
install-tpm: 
	@if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
		echo "TPM installed successfully."; \
	else \
		echo "TPM already installed. Skipping cloning step."; \
	fi

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
