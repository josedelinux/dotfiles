.PHONY: install
install: 
	@if [ -h ~/.config/starship.toml ]; then \
		echo "Softlink ~/.config/starship.toml exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.config/starship.toml ]; then \
		mv ~/.config/starship.toml ~/.config/starship.toml.bak; \
		echo "Existing ~/.config/starship.toml backed up as ~/.config/starship.toml.bak"; \
	fi
	stow --target $(HOME) --verbose .

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .

