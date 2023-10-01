#!/usr/bin/env bash

## PREPARE INSTALLATIONS ##
# Repositories for: git, wslu
sudo apt-add-repository ppa:git-core/ppa
sudo add-apt-repository ppa:wslutilities/wslu
# gh
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# gping
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
# speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash

sudo apt-get update

# Get/update git
sudo apt-get install git

# ZSH
# # Install Oh my ZSH
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# # Install OMZ plugins
# git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
# git clone https://github.com/oldratlee/hacker-quotes.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/hacker-quotes
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# Install packages
sudo apt install bat
sudo apt install exa
sudo apt install fd-find
sudo apt install ffmpeg
sudo apt install fzf
sudo apt install gh
sudo apt install gifsicle
sudo apt install gping
sudo apt install httpie
sudo apt install lua5.3
curl https://getmic.ro | bash   # micro
sudo apt install neofetch
sudo apt install speedtest
# sh -c "$(curl -fsSL https://starship.rs/install.sh)"  # starship
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && sudo chmod a+rx /usr/local/bin/youtube-dl  # youtube-dl
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash   # zoxide

# # Prepare bat
# mkdir -p ~/.local/bin
# ln -s /usr/bin/batcat ~/.local/bin/bat

sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev		# Necessary components to compile for Python

# Install NPM modules when able to
# npm i -g gatsby-cli nodemon npm-check

# Prepare data and symlinks
cp gitconfig ~/.gitconfig
# ln -svf ~/.dotfiles/zsh/zshrc ~/.zshrc
# ln -svf ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
# Fish config
ln -svf ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -svf ~/.dotfiles/fish/fish_variables ~/.config/fish/fish_variables
ln -svf ~/.dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
ln -svf ~/.dotfiles/fish/functions/ ~/.config/fish
ln -svf ~/.dotfiles/fish/completions/ ~/.config/fish
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
# code command
sudo ln -svf /mnt/c/Users/Danny/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code /usr/local/bin/code
