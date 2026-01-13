.PHONY: install
install: 
	@if [ -h ~/.bash_common ]; then \
		echo "Softlink ~/.bash_common exists. Already stowed?"; \
		exit 1; \
	fi
	@if [ -f ~/.bash_common ]; then \
		mv ~/.bash_common ~/.bash_common.bak; \
		echo "Existing ~/.bash_common backed up as ~/.bash_common.bak"; \
	fi
	stow --target $(HOME) --verbose .
	# append only if not already present
	grep -qxF '[ -f ~/.bash_common ] && source ~/.bash_common' ~/.bashrc || \
		echo '[ -f ~/.bash_common ] && source ~/.bash_common' >> ~/.bashrc

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
