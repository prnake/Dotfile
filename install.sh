#!/usr/bin/env bash

DIR=$(dirname "$0")
sudo apt update
sudo apt install zsh subversion neofetch vim git asciinema tmux -y
brew install exa
cp $DIR/.zshrc ~
cp $DIR/.gitconfig ~/
cp $DIR/.*.zsh ~/
cp $DIR/.*.conf ~/

printf "\n[settings]\napi_key = $WAKA_TIME_API_KEY\n" > ~/.wakatime.cfg
mkdir -p ~/.ssh &&
      echo -e $SSH_PUBLIC_KEY > ~/.ssh/id_ed25519.pub &&
      chmod 644 ~/.ssh/id_ed25519.pub &&
      echo -e $SSH_PRIVATE_KEY > ~/.ssh/id_ed25519 &&
      chmod 600 ~/.ssh/id_ed25519

curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh install_agent $NEZHA

sudo chsh -s $(which zsh) $(whoami) 
zsh
