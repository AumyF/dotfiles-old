#!/bin/bash

cd configs

for f in .??*; do
  ln -snfv $PWD/$f $HOME/$f
done
