#!/bin/bash

if [ "$(uname)" = "Linux" ]; then
  echo "Linux"
  . ./ubuntu.sh
elif [ "$(uname)" = "Darwin"]; then
  echo "macOS"
else echo "macOSかLinuxで実行してね."
fi

. ./homebrew.sh

for f in ./asdf/*.sh; do . $f; done

