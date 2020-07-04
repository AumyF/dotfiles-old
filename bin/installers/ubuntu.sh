#!/bin/bash

# ミラーリポジトリの設定
echo "★ Setting apt sources..."
sudo sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

# update
sudo apt update && sudo apt upgrade -y

# zsh, build-essentialインストール

sudo apt install zsh build-essential

# デフォルトシェルをzshに

chsh -s $(which zsh)

# zinitのインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
