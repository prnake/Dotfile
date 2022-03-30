sudo apt update
sudo apt install zsh subversion neofetch vim git prettyping exa -y
sudo chsh -s $(which zsh) $(whoami)
cp .zshrc ~/
cp .tmux.conf ~/
cp .*.zsh ~/
printf "\n[settings]\napi_key = $WAKA_TIME_API_KEY\n" > ~/.wakatime.cfg
