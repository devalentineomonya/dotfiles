# dotfiles Repository

![dotfiles Banner](https://placehold.co/1200x400/111827/FFFFFF?text=Productivity+Optimized+dotfiles)

This repository contains my personalized configuration files for development tools, shell environments, and system utilities. Designed for cross-platform compatibility with a focus on developer productivity.

## 🚀 Features

- **Cross-Platform Support**: Works on Windows (WSL), macOS, and Linux
- **Neovim Lua Configuration**: Modern IDE-like editor setup
- **Zsh & Bash Environments**: Optimized shell experience
- **Development Utilities**: Scripts for common development tasks
- **Version Controlled**: Easy to track changes and updates

## 🛠️ Tech Stack & Tools

### Shell & Terminal

![Zsh](https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=gnu-bash&logoColor=white)
![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Fish](https://img.shields.io/badge/Shell-Fish-4EAA25?logo=fish&logoColor=white)
![Foot](https://img.shields.io/badge/Terminal-Foot-4EAA25?logo=terminal&logoColor=white)
![Tmux](https://img.shields.io/badge/Terminal_Multiplexer-Tmux-1BB91F?logo=tmux&logoColor=white)
![Starship](https://img.shields.io/badge/Prompt-Starship-DD0B78?logo=starship&logoColor=white)

### Editors & IDEs

![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white)
![VSCode](https://img.shields.io/badge/Editor-VSCode-007ACC?logo=visual-studio-code&logoColor=white)

### System & Desktop

![Hyprland](https://img.shields.io/badge/Window_Manager-Hyprland-4B32C3?logo=hyprland&logoColor=white)
![GTK](https://img.shields.io/badge/Theme-GTK-4B32C3?logo=gtk&logoColor=white)
![Btop](https://img.shields.io/badge/Monitor-Btop-00FF00?logo=btop&logoColor=white)

### Development Tools

![EditorConfig](https://img.shields.io/badge/Standard-EditorConfig-FEFEFE?logo=editorconfig&logoColor=black)
![Spicetify](https://img.shields.io/badge/Music-Spicetify-1DB954?logo=spotify&logoColor=white)

### Version Control

![Git](https://img.shields.io/badge/VCS-Git-F05032?logo=git&logoColor=white)

## 📁 Repository Structure

```bash
dotfiles/
├── .config/
│   ├── bash/            # Bash configuration
│   ├── btop/            # System monitor config
│   ├── fish/            # Fish shell configuration
│   ├── foot/            # Foot terminal config
│   ├── gtk-2.0/         # GTK2 theme settings
│   ├── gtk-3.0/         # GTK3 theme settings
│   ├── gtk-4.0/         # GTK4 theme settings
│   ├── hypr/            # Hyprland window manager
│   ├── nvim/            # Neovim configuration
│   ├── scripts/         # Utility scripts
│   ├── spicetify/       # Spotify customization
│   ├── tmux/            # Tmux configuration
│   ├── vscode/          # VSCode settings & keybindings
│   └── zsh/             # Zsh configuration
├── README.md            # This documentation
└── install.sh           # Automated installation script
```

## ⚙️ Installation

### Automated Installation (Recommended)

1. **Clone the repository**:

   ```bash
   git clone https://github.com/devalentineomonya/dotfiles.git ~/.local/share/dotfiles
   ```

2. **Run installation script**:

   ```bash
   cd ~/.local/share/dotfiles
   chmod +x install.sh
   ./install.sh
   ```

3. **Follow the prompts** to install required packages and set up configurations.

### Manual Installation

If you prefer manual setup:

```bash
# Clone to local share
sudo git clone https://github.com/devalentineomonya/dotfiles.git ~/.local/share/dotfiles

# Create symlinks manually
ln -sf ~/.local/share/dotfiles/.config/bash ~/.config/bash
ln -sf ~/.local/share/dotfiles/.config/zsh ~/.config/zsh
ln -sf ~/.local/share/dotfiles/.config/nvim ~/.config/nvim
# ... add other configs as needed
```

## 🔄 Update & Sync

To update your configurations with the latest changes:

```bash
cd ~/.local/share/dotfiles
git pull origin main

# Re-run installation to apply updates
./install.sh

# Reload shell configuration
source ~/.zshrc   # or source ~/.bashrc
```

## 🎨 Customization

### Personalizing Configurations

1. **User-specific settings**:
   - Shell: Edit shell configs in respective directories
   - Aliases: Modify shell alias files
   - Functions: Add custom shell functions

2. **Neovim customization**:
   - User configs: `nvim/lua/user/`
   - Plugin settings: `nvim/lua/plugins/`

3. **Add new scripts**:
   Place custom scripts in `scripts/` directory

### Environment-Specific Settings

The installation script automatically detects your system and installs appropriate packages.

## 🤝 Contributing

Contributions are welcome! Follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a pull request

Please ensure your changes:

- Follow existing coding style
- Include relevant documentation updates
- Are tested on at least one platform

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Maintained by [Valentine Omonya](https://github.com/devalentineomonya)**  
[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/devalentineomonya)
[![Twitter](https://img.shields.io/badge/Twitter-Follow-1DA1F2?logo=twitter)](https://x.com/devalentine_)
[![Website](https://img.shields.io/badge/Website-Portfolio-FF7139?logo=react)](https://valentinee.dev)

