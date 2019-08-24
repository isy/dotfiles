#!/bin/sh
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# コマンド存在確認用関数
function command_exists {
  command -v "$1" > /dev/null;
}

# Homebrew
printf "\e[34m%s\n\e[m" " ========== HOMEBREW =========="
if ! command_exists brew ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printf "\e[31m%s\n\e[m" " homebrew exists"
fi

# # Zsh
printf "\e[34m%s\n\e[m" " ========== ZSH =========="

brew install zsh

echo /usr/local/bin/zsh | sudo tee -a /etc/shells

ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc

touch ~/.zprofile

chsh -s /usr/local/bin/zsh

# Peco
printf "\e[34m%s\n\e[m" " ========== PECO =========="
brew install peco


## zplug
brew install zplug
echo ZPLUG_HOME=/usr/local/opt/zplug >> ~/.zprofile
source ~/.zprofile
source $ZPLUG_HOME/init.zsh

zplug install

source ~/.zshrc


# Git
printf "\e[34m%s\n\e[m" " ========== GIT =========="
brew install git

ln -s $SCRIPT_DIR/.gitconfig $HOME/.gitconfig


# jq
printf "\e[34m%s\n\e[m" " ========== JQ =========="
brew install jq