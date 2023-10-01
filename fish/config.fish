if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Environment variables
set -gx PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin ~/.local/bin
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Abbreviations
abbr -a -- bat 'batcat'

abbr -a -- el 'e --long --icons --header'
abbr -a -- et 'e --tree'

abbr -a -- g 'git'
abbr -a -- ga 'git add'
abbr -a -- gb 'git branch'
abbr -a -- gc 'git commit'
abbr -a -- gc! 'git commit -v --amend'
abbr -a -- gca 'git commit -a'
abbr -a -- gca! 'git commit -v -a --amend'
abbr -a -- gcm 'git commit -m'
abbr -a -- gcam 'git commit -a -m'
abbr -a -- gcn! 'git commit -v --no-edit --amend'
abbr -a -- gcan! 'git commit -v -a --no-edit --amend'
abbr -a -- gco 'git checkout'
abbr -a -- gf 'git fetch'
abbr -a -- gl 'git pull'
abbr -a -- glr 'git pull --rebase'
abbr -a -- gp 'git push'
abbr -a -- gp! 'git push --force'
abbr -a -- gpd 'git push --dry-run'
abbr -a -- gm 'git merge'
abbr -a -- gr 'git reset'
abbr -a -- grh 'git reset --hard'
abbr -a -- grs 'git restore'
abbr -a -- gs 'git status'
abbr -a -- gst 'git stash'
abbr -a -- gstd 'git stash drop'
abbr -a -- gstp 'git stash pop'

# Event functions
function e_after_cd --on-variable PWD --description "Exa after changing directory"
  if status --is-interactive
    e
  end
end

# Prep tools
zoxide init fish | source
# starship init fish | source
source ~/.asdf/asdf.fish

# pnpm
set -gx PNPM_HOME "/home/danny/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Say hello to fish
function fish_greeting
  echo Hello, fish!
  e
end
