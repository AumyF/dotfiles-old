#!/bin/bash

echo "★ Install asdf"

if [ "$(uname)" = "Linux" ]; then
  echo "Linux"
  sudo apt install curl git
elif [ "$(uname)" = "Darwin"]; then
  echo "macOS"
  brew install coreutils curl git
else echo "macOSかLinuxで実行してね."
fi
