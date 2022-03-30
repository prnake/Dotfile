sudo apt update
sudo apt install zsh subversion neofetch vim git prettyping -y
sudo chsh -s $(which zsh) $(whoami)
printf "\n[settings]\napi_key = $WAKA_TIME_API_KEY\n" > ~/.wakatime.cfg
