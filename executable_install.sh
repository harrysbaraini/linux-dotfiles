#!/bin/bash

echo "Install needed dependencies"

function install() {
    yay -S --noconfirm --sudoloop $@
}

yay -R --confirm xdg-desktop-portal-wlr

# Install tools
install git github-cli chezmoi 1password slack-desktop spotify teams just zoom webex-bin bitwarden insomnia-bin obsidian

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

# Install dotfiles
chezmoi init https://github.com/harrysbaraini/linux-dotfiles.git
chezmoi apply -v
