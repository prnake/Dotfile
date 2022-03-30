#! /bin/sh

# Baisc
alias aliases="$VISUAL ~/.aliases.zsh"

# fix alias in command `watch`
# see, https://unix.stackexchange.com/a/25329
alias watch="/usr/bin/watch "

# GDB
alias gdb-peda="gdb -ex init-peda"
alias gdb-pwndbg="gdb -ex init-pwndbg"
alias gdb-gef="gdb -ex init-gef"

# Django
alias pm-mm="python manage.py makemigrations"
alias pm-r="python manage.py runserver"
alias pm-m="python manage.py migrate"
alias pm='python manage.py'

# Git
alias gs='git status -sb'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'

# Shell
alias c=clear
alias f=file
alias ct='ccat'
alias pc='proxychains4 -q'
alias dry='TERM=xterm dry'
alias dose='docker-compose'
alias kose='kompose'
alias dm='docker-machine'
alias or='optirun'
alias zshrc="$VISUAL ~/.zshrc"
alias vimrc="$VISUAL ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/"
alias ipad="ip addr | grep inet && hostname -i"
alias cdp="cd ~/playground" # change to the playground
alias cdd="cd ~/Downloads" # change to the Downloads

alias h="htop"
alias v="vim"
alias vi="vim"
alias cp='cp -riv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

alias ps='procs'
alias cpu='procs --sortd cpu'
alias mem='procs --sortd mem'

alias t='tmux attach -t $(tmux list-sessions -F "#{session_name}" | fzf) || tmux new-session'
alias wget='wget --content-disposition'

alias ps='procs'
alias cpu='procs --sortd cpu'
alias mem='procs --sortd mem'

# Docker
alias d='sudo docker'
alias dc='sudo docker-compose'
alias dcu='sudo docker-compose pull && sudo docker-compose up -d'
alias dexec='sudo docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti'

# Onedrive
alias one="onedrive --synchronize"
alias one-d="onedrive --monitor --verbose"
# only backup, never delete remotely
alias oned='onedrive --synchronize --confdir="~/.config/onedriveEdu" --upload-only --no-remote-delete'

alias p="pwd" # shorter
alias tmux="tmux -2" # fix the problem with vim
alias y="yay"
alias tmuxrc="vim ~/.tmux.conf"
alias destory="/bin/rm"
alias pwq='pwd | tr -d "\n" |xclip -selection c && pwd '
alias cdt='cd /tmp'


# ctf usage
alias xb64d='xsel -ob 2>/dev/null | base64 -d'
alias xb64="xsel -ob 2>/dev/null | base64"

alias qemu="qemu-system-x86_64"

if [ -x "$(command -v exa)" ]; then
  alias l='exa --sort=changed --icons -la --git --git-ignore --ignore-glob=".DS_Store|__MACOSX|__pycache__"'
  alias la='exa --group-directories-first --icons -la'
  alias ll='exa --group-directories-first --icons -la --color-scale --time-style=long-iso --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX|__pycache__" -T -L2'
  alias ll3='exa --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L3'
  alias ll4='exa --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L4'
  alias tree='exa --group-directories-first -T --icons'
fi

if [ -x "$(command -v prettyping)" ]; then
  alias ping='prettyping --nolegend'
fi

