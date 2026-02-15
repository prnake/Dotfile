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
alias cdw="cd /workspace"
alias cds="cd /srv"
alias cdt="cd /tmp"


alias h="htop"
alias v="vim"
alias vi="vim"
alias cp='cp -riv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

alias t='tmux attach -t $(tmux list-sessions -F "#{session_name}" | fzf) || tmux new-session'
alias wget='wget --content-disposition'

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

alias hh="atuin search -i"

# ctf usage
alias xb64d='xsel -ob 2>/dev/null | base64 -d'
alias xb64="xsel -ob 2>/dev/null | base64"

alias qemu="qemu-system-x86_64"

if [ -x "$(command -v eza)" ]; then
  alias l='eza --sort=changed --icons -la --git --git-ignore --ignore-glob=".DS_Store|__MACOSX|__pycache__"'
  alias la='eza --group-directories-first --icons -la'
  alias ll='eza --group-directories-first --icons -la --color-scale --time-style=long-iso --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX|__pycache__" -T -L2'
  alias ll3='eza --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L3'
  alias ll4='eza --group-directories-first --icons -la --git --git-ignore --ignore-glob=".git|.DS_Store|__MACOSX" -T -L4'
  alias ls="eza"
  alias tree='eza --group-directories-first -T --icons'
fi

# macos
alias ssh-proxy="ssh -o 'ProxyCommand=ncat --proxy-type socks5 --proxy 127.0.0.1:6153 %h %p'"
alias ssh-proxy-clash="ssh -o 'ProxyCommand=ncat --proxy-type socks5 --proxy 127.0.0.1:7890 %h %p'"
alias ytt='yutto -d ~/Movies/yutto/ -c "`cat ~/Movies/yutto/.sessdata`" -n 16 --vcodec="av1:copy"'
alias pam="sudo sed -i ".bak" '2s/^/auth       sufficient     pam_tid.so\'$'\n/g' /etc/pam.d/sudo"
alias up="brew update && brew upgrade && brew cu -a -y && brew cleanup && mas upgrade" 