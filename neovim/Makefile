info:
	@echo "Moved to [NvChad-Config](https://github.com/josedelinux/nvchad-config)"

.PHONY: install
install: install-nvchad
	@if [ -f ~/.config/nvim/lua/custom/chadrc.lua ]; then \
		echo "Softlink ~/.config/nvim/lua/custom/chadrc.lua exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.config/nvim/lua/custom/chadrc.lua ]; then \
		mv ~/.config/nvim/lua/custom/chadrc.lua ~/.config/nvim/lua/custom/chadrc.lua.bak; \
		echo "Existing ~/.config/nvim/lua/custom/chadrc.lua backed up as ~/.config/nvim/lua/custom/chadrc.lua.bak"; \
	fi
	stow --target $(HOME) --verbose --no-folding .
	@echo "nvim installation complete." 
	@echo "Run :MasonInstallAll command after lazy.nvim finishes downloading plugins."

.PHONY: install-nvchad
install-nvchad:
	@if [ ! -f ~/.config/nvim/lua/core/init.lua ]; then \
		git clone https://github.com/NvChad/starter ~/.config/nvim; \
		echo "NvChad installed successfully."; \
	else \
		echo "NvChad already installed. Skipping cloning step."; \
	fi

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .

