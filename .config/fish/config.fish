# Ctrl+L to clear the terminal
bind \cl "clear; commandline -f repaint"

# Ctrl+D to logout or exit
bind \cd delete-or-exit

# set fish_greeting "Fish!"
set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end


set -gx HISTTIMEFORMAT "%F %T "

set RED '\033[0;31m'
set YELLOW '\033[0;33m'
set GREEN '\033[0;32m'
set BLUE '\033[0;36m'
set NC '\033[0m' # No Color

if test -f ~/.bash_aliases
    source ~/.bash_aliases
end

if test -f .prompt.fish
    source .prompt.fish
    build_prompt

    if not functions -q fish_prompt
        function fish_prompt
            build_prompt
            commandline -f repaint
        end
    end
end
