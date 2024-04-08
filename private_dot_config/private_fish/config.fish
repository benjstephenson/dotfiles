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

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

thefuck --alias | source
starship init fish | source

source ~/.asdf/asdf.fish


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/bste/.ghcup/bin $PATH # ghcup-env
