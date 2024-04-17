.PHONY: install
install: 
	@if [ -h ~/.config/ripgrep/ripgrep.conf ]; then \
		echo "Softlink ~/.config/ripgrep/ripgrep.conf exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.config/ripgrep/ripgrep.conf ]; then \
		mv ~/.config/ripgrep/ripgrep.conf ~/.config/ripgrep/ripgrep.conf.bak; \
		echo "Existing ~/.config/ripgrep/ripgrep.conf backed up as ~/.config/ripgrep/ripgrep.conf.bak"; \
	fi
	stow --target $(HOME) --verbose .

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .

