#!/usr/bin/env bash

# =============================================================================
# EndeavourOS + Hyprland Bootstrap
# Tailored for a software development workstation.
#
# Run after a fresh EndeavourOS (No Desktop Environment) installation.
# =============================================================================

set -e

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

# =============================================================================
# Base Development Tools
# =============================================================================
echo "==> Installing development tools..."

sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    neovim \
    zsh \
    tmux \
    openssh \
    curl \
    wget \
    unzip \
    zip \
    p7zip \
    tar \
    rsync \
    jq \
    ripgrep \
    fd \
    fzf \
    eza \
    bat \
    less \
    tree \
    fastfetch \
    btop \
    htop \
    yazi \
    zoxide

# =============================================================================
# Programming Languages
# =============================================================================
echo "==> Installing languages..."

sudo pacman -S --needed --noconfirm \
    nodejs \
    npm \
    pnpm \
    go \
    python \
    python-pip

# =============================================================================
# Hyprland Environment
# =============================================================================
echo "==> Installing Hyprland..."

sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    waybar \
    fuzzel \
    mako \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    wl-clipboard \
    grim \
    slurp \
    brightnessctl \
    playerctl \
    pamixer \
    polkit-kde-agent

# =============================================================================
# GTK Integration
# =============================================================================
echo "==> Installing GTK support..."

sudo pacman -S --needed --noconfirm \
    gtk3 \
    gtk4 \
    nwg-look \
    adwaita-icon-theme \
    papirus-icon-theme \
    gnome-keyring \
    seahorse

# =============================================================================
# File Management
# =============================================================================
echo "==> Installing file management..."

sudo pacman -S --needed --noconfirm \
    nautilus \
    file-roller \
    gvfs \
    gvfs-mtp \
    gvfs-afc \
    ffmpegthumbnailer \
    poppler-glib

# =============================================================================
# Audio
# =============================================================================
echo "==> Installing PipeWire..."

sudo pacman -S --needed --noconfirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-jack \
    wireplumber

# =============================================================================
# Networking
# =============================================================================
echo "==> Installing networking..."

sudo pacman -S --needed --noconfirm \
    networkmanager \
    network-manager-applet

# =============================================================================
# Fonts
# =============================================================================
echo "==> Installing fonts..."

sudo pacman -S --needed --noconfirm \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    ttf-jetbrains-mono-nerd

# =============================================================================
# Display Manager
# =============================================================================
echo "==> Installing SDDM..."

sudo pacman -S --needed --noconfirm \
    sddm \
    qt6-svg

# =============================================================================
# Enable Services
# =============================================================================
echo "==> Enabling services..."

sudo systemctl enable NetworkManager
sudo systemctl enable sddm

# =============================================================================
# Install yay
# =============================================================================
echo "==> Installing yay..."

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# =============================================================================
# AUR Packages
# =============================================================================
echo "==> Installing AUR packages..."

yay -S --needed \
    brave-origin-nightly \
    visual-studio-code-bin

# =============================================================================
# Default Shell
# =============================================================================
echo "==> Setting Zsh as default shell..."

chsh -s /usr/bin/zsh

# =============================================================================
# Finish
# =============================================================================
echo ""
echo "==============================================================="
echo "Installation complete."
echo ""
echo "Recommended next steps:"
echo "  1. Reboot"
echo "  2. Restore your dotfiles"
echo "  3. Restore SDDM Sugar Candy theme"
echo "  4. Restore GRUB Win-TMUX Dual Boot theme"
echo "  5. Restore Brave bookmarks/history/profile if desired"
echo "  6. Restore SSH keys and Git config"
echo "  7. Restore wallpapers"
echo "==============================================================="
