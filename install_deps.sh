# This script installs all dependencies needed for Thund3rPat Rice.
# Using at own risk!

echo "Installing all dependencies!!"
sudo pacman -S --needed git
wait

echo "Install yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
wait
rm -rf yay


echo "Install X11 and drivers"
yay -S --needed xorg-server xorg-xinit xf86-video-intel xf86-input-synaptics
wait

echo "Install bspwm, sxhkd, j4-dmenu-desktop"
yay -S --needed bspwm sxhkd dmenu j4-dmenu-desktop
wait

echo "Install polybar, picom and fonts"
yay -S --needed polybar picom-tryone-git nerd-fonts-complete
wait

echo "Install other useful things"
yay -S --needed alsa-utils pulseaudio firefox flashplugin icedtea-web kitty betterlockscreen code
wait

echo "Finished"
