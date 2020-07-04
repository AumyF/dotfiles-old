#!/bin/bash

if !(type "asdf" > /dev/null 2>&1);then
  echo "asdfを入れてくれ."
  exit
fi


echo "★ Install requirements for asdf-node plugin..."

if [ "$(uname)" = "Linux" ]; then
  echo "Linux (Debian/Ubuntu)"
  sudo apt install dirmngr gpg curl
elif [ "$(uname)" = "Darwin"]; then
  echo "macOS"
  brew install gpg coreutils
else echo "Do run on macOS or Linux."
fi

echo "★ Install asdf-node plugin..."
asdf plugin add nodejs

echo "★ Import GPG keys..."
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

echo "★ Install latest stable version of Node..."
asdf install nodejs latest && asdf global nodejs $(asdf list nodejs)
