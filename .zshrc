export ZSH="$HOME/.oh-my-zsh"
export DOT="$HOME/.dotfiles"

source $DOT/zsh/config
source $DOT/zsh/plugins
source $ZSH/oh-my-zsh.sh

# pnpm
export PNPM_HOME="/home/danny/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end