#!/bin/bash

echo "Install needed dependencies"

function install() {
    yay -S --noconfirm --sudoloop $@
}

yay -R --confirm xdg-desktop-portal-wlr

# Install tools
install git github-cli chezmoi

install \
    # required dependencies
    hyprland-git polkit-kde-agent dunst grimblast rofi rofi-emoji \
    wl-clipboard wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git \
    xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord \
    imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git \
    # themes
    catppuccin-gtk-theme-mocha catppuccin-cursors-mocha catppuccin-mocha-grub-theme-git nwg-look-bin \
    # fonts
    otf-aurulend-nerd otf-cascadia-code-nerd otf-firamono-nerd ttf-jetbrains-mono-nerd \
    # apps
    cava pavucontrol ranger zsh starship neovim viewnior noise-suppression-for-voice \
    # graphic file manager
    thunar thunar-archive-plugin file-roller

# Regenerate font cache
fc-cache -rv

# Copy theme
#rsync -avxHAXP --exclude '.git*' . ~/
cp -rT . ~/

# Clone GTK theme
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git ~/Downloads/Gruvbox-GTK-Theme
cp -r ~/Downloads/Gruvbox-GTK-Theme/themes/Gruvbox-Dark-BL/gtk-4.0/* ~/.config/gtk-4.0/
