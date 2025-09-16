# Codespaces and Dotfiles

## 0. Backup your .zshrc

`
cd && mv .zshrc .zshrc_bkp
`

## 1. Install OMZ

`
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
`

## 2. Install Powerlevel10k

`
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
`

if you mess up:

`
p10k configure
`

Update theme in OMZ

`
ZSH_THEME="powerlevel10k/powerlevel10k"
`

`
source $HOME/.zshrc
`

## 3. Install a dotfile manager (Chezmoi)

`
brew install chezmoi
`

`
chezmoi init
`

## 4. Add configuration files

```
chezmoi add $HOME/.zshrc
chezmoi add $HOME/.p10k
```

## 5. Add repo to chezmoi

Create a public repository

`chezmoi cd`

```sh
git remote add origin git@github.com:$GITHUB_USERNAME/dotfiles.git # replace with your own github username
git branch -M main
git push -u origin main
```

## 6. Add setup.sh script

```sh
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
$HOME/.local/bin/chezmoi init --apply $GITHUB_USER/dotfiles # NOTE: update with repo name
```

## 7. Add dotfiles repository to codespace configuration

Settings -> Codespaces -> Auto install dotfiles

## 8. Install Neovim config

`
npx degit nelsonfleig/dotfiles/dot_config/nvim-rover dot_config/nvim
`

## 9. Install a Neovim plugin

`colorscheme.lua`

```lua
return {
  { 
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
```
