# My Arch Linux Setup
This Repository contains my dotfiles and everything else that has to do with my arch linux setup.

+ OS: [Arch Linux](https://www.archlinux.org/)
+ WM: [bspwm](https://github.com/baskerville/bspwm)
+ Shell: [zsh](https://www.zsh.org/)
+ Bar: [Polybar](https://github.com/polybar/polybar)
+ Compositor: [Picom](https://github.com/yshui/picom)
+ Terminal: [kitty](https://github.com/kovidgoyal/kitty)
+ Launcher: [j4-dmenu-desktop](https://github.com/enkore/j4-dmenu-desktop)


[Arch Installation Guide](https://github.com/Thund3rPat/Arch-Setup/blob/master/arch_step_by_step.md)

## Install packages
Login as User:
```su thunderpat```

Install git:
```
sudo pacman -S git
```
Before running install_deps.sh, please edit it accordingly(driver etc):
```./install_deps.sh```


Set Keymap for X:
```localectl set-x11-keymap de pc105 nodeadkeys```
Sometimes this operation fails, so you need to start X first and try again.

## Zsh + ohmyzsh + spaceship
```
yay -S --needed zsh zsh-completions powerline-fonts lsd curl
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

## Dotfiles
Run:
```
./install_dotfiles.sh
```
