set fish_greeting ""

# set -gx TERM xterm-256color

# theme
# set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

if type -q eza
  alias ll "eza -l -g --icons"
  alias ls "eza"
end

alias g git
alias k kubectl
command -qv nvim && alias vim nvim


set -gx EDITOR nvim

eval (/opt/homebrew/bin/brew shellenv)

fish_add_path -g ~/bin
fish_add_path -g ~/.local/share/nvim/mason/bin
fish_add_path -g ~/.local/bin

# NodeJS
fish_add_path -g node_modules/.bin

# Go
set -g GOPATH $HOME/go
fish_add_path $GOPATH/bin

# Coursier
set -g CSPATH /Users/bste/Library/Application Support/Coursier/bin/
fish_add_path CSPATH

fish_add_path -g /Users/bste/.dotnet/tools
fish_add_path -g /Users/bste/.luarocks/bin
fish_add_path -g /Users/bste/.cargo/bin

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

thefuck --alias | source
starship init fish | source

source ~/.asdf/asdf.fish

zoxide init fish | source

pyenv init - | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/bste/.ghcup/bin $PATH # ghcup-env
