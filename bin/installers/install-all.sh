#!/bin/bash

cd `dirname $0`

if [ "$(uname)" = "Linux" ]; then
  echo "Linux"
  . ./ubuntu.sh
elif [ "$(uname)" = "Darwin"]; then
  echo "macOS"
else echo "macOSかLinuxで実行してね."
fi

. ./homebrew.sh
. ./asdf.sh

for f in ./asdf/*.sh; do . $f; done

