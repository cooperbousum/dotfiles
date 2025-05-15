!#/usr/bin/bash

echo -e "\e[31mInstalling yay...\e[0m"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

echo -e "\e[31mInstalling Hyprland...\e[0m"
sudo pacman -S hyprland

echo -e "\e[31mInstalling Hyprland ecosystem dependencies...\e[0m"
yay -S aquamarine hyprlang hyprcursor hyprutils hyprgraphics

echo -e "\e[31mInstalling must-have software...\e[0m"
yay -S mako kitty neovim btop tlp xorg-server hyprpolkitagent qt5-wayland qt6-wayland hyprpicker hypridle hyprlock hyprsysteminfo hyprland-qt-support hyprland-qt-support

echo -e "\e[31mInstalling audio software...\e[0m"
yay -S pipewire wireplumber pipewire-jack easyeffects

echo -e "\e[31mInstalling Zsh...\e[0m"
yay -S zsh
chsh -s $(which zsh)
echo -e "\e[31m$($SHELL --version) installed\e[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\e[31mInstalling brew...\e[0m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo -e "\e[31mInstalling misc dotfiles from cooperbousum/dotfiles using chezmoi...\e[0m"
yay -S chezmoi
chezmoi init --apply https://github.com/cooperbousum/dotfiles.git
