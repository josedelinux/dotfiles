.PHONY: install
install:
	@if [ -h ~/.config/i3/config ]; then \
		echo "Softlink ~/.config/i3/config exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.config/i3/config ]; then \
		mv ~/.config/i3/config ~/.config/i3/config.bak; \
		echo "Existing ~/.config/i3/config backed up as ~/.config/i3/config.bak"; \
	fi
	stow --target $(HOME) --verbose .

.PHONY: uninstall
uninstall:
	stow --target $(HOME) --verbose --delete .
