#!/usr/bin/env bash

# exit on error and print each command
set -euxo pipefail

# ~/.dotfiles ==> directory where this script is located
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[[ -e ~/.dotfiles ]] || ln -s "$DIR" ~/.dotfiles

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# Set default shell to zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# Reset and install OMZ
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    rm -rf $HOME/.oh-my-zsh
    ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Apply Chezmoi 
$HOME/.local/bin/chezmoi init --apply $GITHUB_USER/dotfiles-starter

