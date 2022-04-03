#!/usr/bin/env bash

DIR=$(dirname "$0")
sudo apt update
sudo apt install zsh subversion neofetch vim git prettyping asciinema tmux -y
brew install exa
cp $DIR/.zshrc ~
cp $DIR/.gitconfig ~/
cp $DIR/.*.zsh ~/
cp $DIR/.*.conf ~/
printf "\n[settings]\napi_key = $WAKA_TIME_API_KEY\n" > ~/.wakatime.cfg
sudo chsh -s $(which zsh) $(whoami) 
zsh
