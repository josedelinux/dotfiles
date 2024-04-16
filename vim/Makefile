.PHONY: install
install: 
	stow --target $(HOME) --ignore "^[mM]akefile" --verbose .

.PHONY: uninstall
uninstall: 
	stow --target $(HOME) --verbose --delete .
