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
alias ga.='git add .'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate'
alias gca='git commit --amend'
alias gpt='git push --tags'
alias gpat='git push && git push --tags'

# Shell
alias c=clear
alias f=file
alias ct='ccat'
alias pc='proxychains4 -q'
alias dry='TERM=xterm dry'
alias kose='kompose'
alias dm='docker-machine'
alias or='optirun'
alias zshrc="$VISUAL ~/.zshrc"
alias vimrc="$VISUAL ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/"
alias ipad="ip addr | grep inet && hostname -i"

# Python
alias py='python3'
alias pt='python3 test.py'
alias pp='python3 p.py'

proxy() {
  if nc -z 127.0.0.1 7890 2>/dev/null; then
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    echo "Proxy set: Clash"
  elif nc -z 127.0.0.1 6152 2>/dev/null; then
    export https_proxy=http://127.0.0.1:6152 http_proxy=http://127.0.0.1:6152 all_proxy=socks5://127.0.0.1:6153
    echo "Proxy set: Surge"
  else
    echo "No proxy detected"
  fi
}
alias noproxy='unset https_proxy http_proxy all_proxy'

# Editors & Open
alias o.='open .'
alias cr.='cursor .'
alias co.='code .'

# Claude
alias cc='claude --dangerously-skip-permissions'

# Navigation
alias cdw="cd /workspace"
alias cds="cd /srv"
alias cdt="cd /tmp"
alias cdd="cd ~/Downloads"
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

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
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dps='docker ps'
alias dexec='sudo docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti'

# Cargo
alias cr='cargo run --release'
alias cb='cargo build --release'

# npm/bun
alias nr='npm run'
alias nrb='npm run build'
alias nrd='npm run dev'
alias nrs='npm run start'
alias ni='npm install'
alias bi='bun install'
alias brb='bun run build'

# Onedrive
alias one="onedrive --synchronize"
alias one-d="onedrive --monitor --verbose"
alias oned='onedrive --synchronize --confdir="~/.config/onedriveEdu" --upload-only --no-remote-delete'

alias p="pwd"
alias tmux="tmux -2"
alias y="yay"
alias tmuxrc="vim ~/.tmux.conf"
alias destory="/bin/rm"

# Atuin
alias hh="atuin search -i"
alias hhd="atuin search -i --filter-mode directory"
alias hhg="atuin search -i --filter-mode global"
alias hhs="atuin search --search-mode fuzzy -i"
alias hst="atuin stats"
alias ht="atuin history last"

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
