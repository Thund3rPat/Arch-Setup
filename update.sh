#!/bin/bash

echo "Copy dotfiles to this repo!"

cp -r ~/.config/bspwm/ config/
cp -r ~/.config/kitty/ config/
cp -r ~/.config/picom/ config/
cp -r ~/.config/polybar/ config/
cp -r ~/.config/sxhkd/ config/

cp ~/.zshrc config/

echo "Finished!"
