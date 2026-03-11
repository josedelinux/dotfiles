.PHONY: install
install:
	@if [ -h ~/.wezterm.lua ]; then \
		echo "Softlink ~/.wezterm.lua exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.wezterm.lua ]; then \
		mv ~/.wezterm.lua ~/.wezterm.lua.bak; \
		echo "Existing ~/.wezterm.lua backed up as ~/.wezterm.lua.bak"; \
	fi
	stow --target $(HOME) --verbose .

	@echo "Wezterm dotfile installation complete."

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
