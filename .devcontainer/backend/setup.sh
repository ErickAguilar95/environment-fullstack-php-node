#!/bin/sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended || true
fi

plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "$plugin_dir" ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$plugin_dir"
fi
