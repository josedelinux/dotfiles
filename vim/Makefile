.PHONY: install
install: 
	@if [ -h ~/.vimrc ]; then \
		echo "Softlink ~/.vimrc exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.vimrc ]; then \
		mv ~/.vimrc ~/.vimrc.bak; \
		echo "Existing ~/.vimrc backed up as ~/.vimrc.bak"; \
	fi
	stow --target $(HOME) --verbose .

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
