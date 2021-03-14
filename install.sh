#!/usr/bin/env bash

# Install Oh my ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install OMZ plugins
git clone https://github.com/oldratlee/hacker-quotes.git ~/.oh-my-zsh/custom/plugins/hacker-quotes
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install homebrew if necessary
which -s brew >/dev/null 2>&1
if [[ $? != 0 ]] ; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	brew update
fi

# Install brew packages (and node gets installed with it)
cd ~/.dotfiles
brew bundle

# Install MacOS apps from cask & App Store when prompted
read -p "Do you want to install MacOS apps from cask & the App Store? ([y]/n) " -n 1
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
	brew bundle --file Caskfile
fi

# Install nvm if necessary
command -v nvm >/dev/null 2>&1
if [[ $? != 0 ]] ; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install node
	nvm use node
fi

# Install NPM packages
npm i -g @vue/cli
npm i -g alfred-vscode
npm i -g fast-cli
npm i -g gatsby-cli
npm i -g gulp-cli
npm i -g nodemon
npm i -g npm-check
npm i -g surge
npm i -g tldr
npm i -g trash-cli
npm i -g vercel

# Restore mackup settings
mackup restore

# Link dotfiles
ln -svf ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -svf ~/.dotfiles/mackup.cfg ~/.mackup.cfg