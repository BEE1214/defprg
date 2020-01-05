#!/bin/bash

# No arguments
if [[ $# -gt 0 ]]; then
    echo "Can't enter arguments"
    return 1
fi
cd ~/Downloads
# Check for linux distribution lsb_release -i for distributor id 
. /etc/os-release
DISTRO=$NAME

echo $DISTRO
# Debian/Ubuntu based
if [[ $DISTRO == "elementary OS" ] || [ $DISTRO == "Ubuntu" ] [ $DISTRO == "Debian" ]]; then
    sudo apt update && yes Y | sudo apt ugrade
    # ------------------------ Firefox ------------------------------ #
    yes Y | sudo apt install firefox chromium-browser snapd gimp stacer htop krusader keepassxc calibre flameshot vlc
    # ----------------------- Mailspring ---------------------------- #
    yes Y | sudo snap install mailspring
    # ------------------------  Rambox ------------------------------ #
    yes Y | sudo snap install rambox
    # ------------------------- VS Code ----------------------------- #
    yes Y | sudo snap install code --classic
    # ------------------------- Spotify ----------------------------- #
    yes Y | sudo snap install spotify
    # -------------------------- Tusk ------------------------------- #
    yes Y | sudo snap install tusk
    # ------------------------ Ulauncher ---------------------------- #
    wget https://github.com/Ulauncher/Ulauncher/releases/download/5.5.0/ulauncher_5.5.0_all.deb && yes Y | sudo apt install ./ulauncher_5.5.0_all.deb
    # ------------------------- Dropbox ----------------------------- #
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb && yes Y | sudo apt install ./dropbox_2019.02.14_amd64.deb
# Arch based
elif [[ $DISTRO == "Arch Linux" ] || [ $DISTRO == "Manjaro" ]];then
    yes Y | sudo pacman -Syu
    # -------------------------- Snap ------------------------------- #
    if [[ pacman -S git == 1 ]]; then
        yes Y | sudo pacman -S git
    fi
    yes Y | sudo pacman -S snapd yay && sudo systemctl enable --now snapd.socket
    # ------------------------ Firefox ------------------------------ #
    yes Y | yay -S firefox chromium rambox-bin gimp htop keepassxc calibre flameshot openoffice vlc
    # ----------------------- Mailspring ---------------------------- #
    yes Y | sudo snap install mailspring spotify tusk code --classic
    # ------------------------ Ulauncher ---------------------------- #
    git clone https://aur.archlinux.org/ulauncher.git && cd ulauncher && makepkg -is 
    # ------------------------- Dropbox ----------------------------- #
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    # ---------------------- Syncthing GTK -------------------------- #
    # wget https://github.com/syncthing/syncthing/releases/download/v1.3.2/syncthing-linux-amd64-v1.3.2.tar.gz | tar xzf -
    cd ~/Downloads

    # cd ~/Downloads
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si

fi

