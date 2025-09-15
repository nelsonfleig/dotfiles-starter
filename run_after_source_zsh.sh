#!/bin/zsh

if [ -n "${CODESPACES}" ]; then
  # change default shell to zsh
  sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
fi

source ~/.zshrc
