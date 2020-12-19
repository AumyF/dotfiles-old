# Set apt source
sudo sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install zsh

chsh -s $(which zsh)
