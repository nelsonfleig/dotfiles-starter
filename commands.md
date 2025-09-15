## 1. Install OMZ

`
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
`

## 2. Install Powerlevel10k

`
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
`

if you mess up:

`p10k configure`

## 3. Install a dotfile manager (Chezmoi)

`
brew install chezmoi
`

## 4. 
