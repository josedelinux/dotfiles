.PHONY: install
install: 
	@if [ -h ~/.zshrc ]; then \
		echo "Softlink ~/.zshrc exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.zshrc ]; then \
		mv ~/.zshrc ~/.zshrc.bak; \
		echo "Existing ~/.zshrc backed up as ~/.zshrc.bak"; \
	fi
	stow --target $(HOME) --verbose .

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
