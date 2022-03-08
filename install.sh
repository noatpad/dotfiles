#!/usr/bin/env bash

# Prepare package installations
sudo apt-add-repository ppa:git-core/ppa	# Latest git
sudo add-apt-repository ppa:spvkgn/exa		# exa for Ubunty 20.04
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null		# gh
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -		# gping

sudo apt-get update

# Get/update git
sudo apt-get install git

# Install Oh my ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install OMZ plugins
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
git clone https://github.com/oldratlee/hacker-quotes.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/hacker-quotes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

# Install packages
sudo apt install exa
sudo apt install ffmpeg
sudo apt install gh
sudo apt install gping
sudo apt install httpie
curl https://getmic.ro | bash
sudo apt install neofetch
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
curl -sS https://webinstall.dev/zoxide | bash

sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev		# Necessary components to compile for Python

# Install NPM modules when able to
# npm i -g gatsby-cli nodemon npm-check

# Prepare data and symlinks
cp gitconfig ~/.gitconfig
ln -svf ~/.zshrc /mnt/c/Users/Danny/zsh/zshrc
