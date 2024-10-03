#!/usr/bin/env bash
set -eo pipefail

source ./scripts/common.sh

# Verify yay is installed
which yay >/dev/null 2>/dev/null || error_exit "yay is not installed, please download from https://github.com/Jguer/yay"

# Install pacman packages
print_padded_title "pacman - Sync Packages"
[ -f pkglist.txt ] || error_exit "No pkglist.txt is found"
sudo pacman -S --needed --noconfirm - < pkglist.txt

print_padded_title "yay - Sync Packages"
[ -f pkglist_aur.txt ] || error_exit "No pkglist_aur.txt is found"
yay -S --needed --noconfirm - < pkglist_aur.txt
