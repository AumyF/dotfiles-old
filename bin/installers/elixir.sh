#!/bin/bash

if !(type "asdf" > /dev/null 2>&1);then
  echo "asdfを入れてくれ."
  exit
fi

echo "★ Install requirements of asdf-elixir plugin..."

if [ "$(uname)" = "Linux" ]; then
  echo "Linux"
  sudo apt install build-essential autoconf libncurses5-dev libssh-dev unixodbc-dev
elif [ "$(uname)" = "Darwin"]; then
  echo "macOS"
else echo "macOSかLinuxで実行してね."
fi


echo "★ Install asdf-erlang and asdf-elixir..."
asdf plugin add erlang
asdf plugin add elixir


echo "★ Install latest stable version of Node..."
asdf install erlang latest && asdf global erlang $(asdf latest erlang)
asdf install elixir latest && asdf global elixir $(asdf latest elixir)
