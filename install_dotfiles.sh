#!/bin/bash

echo "Move dotfiles!"
cp -r config/bspwm/ ~/.config/
cp -r config/kitty/ ~/.config/
cp -r config/picom/ ~/.config/
cp -r config/polybar/ ~/.config/
cp -r config/sxhkd/ ~/.config/

cp config/.zshrc ~/
cp config/.xinitrc ~/
cp config/wp.png ~/.config/

echo "Finished! Enjoy your new system!"
