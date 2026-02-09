#!/usr/bin/env bash

DIR=$(dirname "$0")

detect_package_manager() {
    if command -v apt &>/dev/null; then
        echo "apt"
    elif command -v brew &>/dev/null; then
        echo "brew"
    else
        echo "none"
    fi
}

install_packages() {
    local pkg_manager=$(detect_package_manager)

    if [ "$pkg_manager" = "none" ]; then
        echo "No apt or brew found, skipping package installation"
        return 0
    fi

    if [ "$pkg_manager" = "apt" ]; then
        sudo apt update
        sudo apt install zsh subversion neofetch vim git asciinema tmux jq -y
    fi

    if [ "$pkg_manager" = "apt" ] || [ "$pkg_manager" = "brew" ]; then
        brew install zoxide atuin eza
    fi
}

install_packages

# bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

cp $DIR/.zshrc ~
cp $DIR/.gitconfig ~/
cp $DIR/.*.zsh ~/
cp $DIR/.*.conf ~/

touch ~/.hushlogin

# printf "\n[settings]\napi_key = $WAKA_TIME_API_KEY\n" > ~/.wakatime.cfg
# mkdir -p ~/.ssh &&
#       echo -e $SSH_PUBLIC_KEY > ~/.ssh/id_ed25519.pub &&
#       chmod 644 ~/.ssh/id_ed25519.pub &&
#       echo -e $SSH_PRIVATE_KEY > ~/.ssh/id_ed25519 &&
#       chmod 600 ~/.ssh/id_ed25519

# curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && $NEZHA


# sudo chsh -s $(which zsh) $(whoami)
# zsh
