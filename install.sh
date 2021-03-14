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

# Install brew packages (and node along with it)
cd ~/.dotfiles
brew tap "dart-lang/dart"
brew tap "homebrew/bundle"
brew tap "homebrew/cask"
brew tap "homebrew/core"
brew tap "homebrew/services"
brew tap "jhawthorn/fzy"
brew tap "kkevinm/itunes-discord-rp"
brew tap "mongodb/brew"

brew install "automake"
brew install "bat"
brew install "python@3.9"
brew install "glib"
brew install "cairo"
brew install "catimg"
brew install "coreutils"
brew install "exa"
brew install "gnutls"
brew install "harfbuzz"
brew install "libass"
brew install "ffmpeg"
brew install "fswatch"
brew install "fzf"
brew install "gh"
brew install "gifsicle"
brew install "git-lfs"
brew install "gnu-sed"
brew install "httpie"
brew install "imagemagick"
brew install "libimobiledevice"
brew install "ios-webkit-debug-proxy"
brew install "iproute2mac"
brew install "libdnet"
brew install "libksba"
brew install "libyaml"
brew install "lolcat"
brew install "mackup"
brew install "m-cli"
brew install "mas"
brew install "micro"
brew install "mono"
brew install "neofetch"
brew install "node"
brew install "pandoc"
brew install "pipes-sh"
brew install "pylibpcap"
brew install "python@3.8"
brew install "ruby"
brew install "ruby-build"
brew install "sl"
brew install "sphinx-doc"
brew install "starship"
brew install "swi-prolog"
brew install "thefuck"
brew install "youtube-dl"
brew install "zoxide"
brew install "zsh"
brew install "zsh-syntax-highlighting"
brew install "mongodb/brew/mongodb-community"

# Install MacOS apps from cask & App Store when prompted
read -p "Do you want to install MacOS apps from cask & the App Store? ([y]/n) " -n 1
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
	brew tap "homebrew/cask-fonts"

	brew install --cask "font-hack-nerd-font"
	brew install --cask "qlcolorcode"
	brew install --cask "qlstephen"
	brew install --cask "xquartz"
	
	brew install --cask "1password"
	brew install --cask "8bitdo-ultimate-software"
	brew install --cask "aerial"
	# brew install --cask "alfred"
	brew install --cask "appcleaner"
	brew install --cask "google-photos-backup-and-sync"
	brew install --cask "bartender"
	brew install --cask "bitwarden"
	# brew install --cask "boom-3d"
	brew install --cask "cheatsheet"
	brew install --cask "checkra1n"
	brew install --cask "discord"
	brew install --cask "dockey"
	brew install --cask "dolphin"
	brew install --cask "enjoyable"
	brew install --cask "etrecheckpro"
	# brew install --cask "fantastical"
	brew install --cask "firefox"
	brew install --cask "flux"
	brew install --cask "google-chrome"
	brew install --cask "iterm2"
	brew install --cask "itunesdiscordrp"
	brew install --cask "kap"
	brew install --cask "kdiff3"
	brew install --cask "keycastr"
	# brew install --cask "loopback"
	brew install --cask "love"
	brew install --cask "meteorologist"
	brew install --cask "minecraft"
	brew install --cask "mongodb-compass"
	brew install --cask "multimc"
	brew install --cask "notion"
	brew install --cask "nxengine"
	brew install --cask "obs"
	brew install --cask "obsidian"
	brew install --cask "openemu"
	brew install --cask "opentoonz"
	brew install --cask "parsec"
	# brew install --cask "path-finder"
	brew install --cask "postman"
	brew install --cask "securesafe"
	brew install --cask "sf-symbols"
	brew install --cask "slack"
	# brew install --cask "soulver"
	brew install --cask "steam"
	brew install --cask "streamlabs-obs"
	brew install --cask "surfshark"
	brew install --cask "trailer"
	brew install --cask "ubersicht"
	brew install --cask "visual-studio-code"
	brew install --cask "vlc"
	brew install --cask "wwdc"
	brew install --cask "zoom"
	
	# - Missing apps:
	# Audacity
	# BandagedBD
	# Clip Studio (and Clip Studio Paint)
	# CZUR Scanner
	# DaVinci Resolve
	# Desktop Goose
	# Drawpile
	# Feeds (or any RSS feed reader)
	# Filezilla
	# GameMaker Studio
	# Microsoft Office
	# Pureref
	# SanicBall
	# Sonic Robo Blast 2 Kart
	# Tayasui Sketches Pro
	
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
ln -svf ~/.dotfiles/mackup.cfg ~/.mackup.cfg
mackup restore

# Link and copy dotfiles
cp ~/.dotfiles/gitconfig ~/.gitconfig
ln -svf ~/.dotfiles/zsh/zshrc ~/.zshrc