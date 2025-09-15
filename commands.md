# Codespaces and Dotfiles

## Warm up questions

- How many actively mantain their dotfiles?
- How many use dotfiles in a codespace?

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

git remote add origin git@github.com:$GITHUB_USERNAME/dotfiles.git # replace with your own github username
git branch -M main
git push -u origin main

## 6. Add dotfiles repository to codespace configuration

Settings -> Codespaces -> Auto install dotfiles

## 7. Install Neovim config

`
npx degit nelsonfleig/dotfiles/dot_config/nvim-rover dot_config/nvim
`
