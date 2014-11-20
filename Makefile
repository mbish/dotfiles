install: stow/bin/stow
	cp stow/bin/stow /usr/bin/local

stow/bin/stow: stow/Makefile
	cd stow && make bin/stow

stow/Makefile: stow/Makefile.in
	cd stow && chmod 744 ./configure && ./configure

stow/Makefile.in: stow/configure
	cd stow && automake --add-missing


stow/configure: stow/configure.ac
	cd stow && autoconf configure.ac > configure

stow/configure.ac:
	git submodule update --init --recursive

.PHONY: keybindings
keybindings:
	xmodmap X/.Xmodmap
