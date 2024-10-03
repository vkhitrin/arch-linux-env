.DEFAULT: help
.PHONY: install-directories fetch-dotfiles

help:
	@grep -F -h "##" $(MAKEFILE_LIST) | sed -e 's/\(\:.*\#\#\)/\:\ /' | grep -F -v grep -F | sed -e 's/\\$$//' | sed -e 's/##//'

install-directories: ##Installs directories
	@./scripts/00-create-directories.sh

install-packages: ##Installs pacman packages
	@./scripts/01-install-packages.sh

fetch-dotfiles: ##Fetch dotfiles
	@./scripts/02-fetch-dotfiles.sh

installs-python-packages: ##Installs python packages
	@./scripts/03-install-python-packages.sh

install-tmux-tpm: ##Restores configuration
	@./scripts/04-install-tmux-tpm.sh

install-k8s-plugins: ##Installs Kubernetes related plugins
	@./scripts/05-install-k8s-plugins.sh

dump-pacman-packages: ##Dumps pacman packages into a file
	@./scripts/99-dump-pacman-packages.sh > ./pkglist.txt

dump-yay-aur-packages: ##Dumps yay AUR packages into a file
	@./scripts/99-dump-yay-aur-packages.sh > ./pkglist_aur.txt
