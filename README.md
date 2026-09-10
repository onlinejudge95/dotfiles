# dotfiles

This directory contains the dotfiles for my system

## Pre-Requisites

- `git`
- `stow`

We can install both of the above using `sudo apt install git stow` command

## Installation

- Checkout the repo in your system at the home directory

## Configurations

- Kitty `stow --target ~/.config/kitty/ kitty`
- Git `stow git`
- ZShell `stow zsh`
- OhMyPosh Theme `stow --target ~/.config/ohmyposh/ ohmyposh`
- Nvim `stow --target ~/.config/nvim/lua/custom/ nvim`
