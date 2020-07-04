#!/bin/bash

if !(type "asdf" > /dev/null 2>&1);then
  echo "asdfを入れましょう."
  exit
fi

asdf plugin add java
asdf list all java | rg 'adoptopenjdk-\d+\.\d+\.\d+\+\d+\.\d+$'
echo "AdoptOpenJDKの最新バージョンを入れてね."
