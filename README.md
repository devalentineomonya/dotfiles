# 🚀 dotfiles Repository

![dotfiles Banner](https://placehold.co/1200x400/111827/FFFFFF?text=Productivity+Optimized+dotfiles)

This repository contains my personalized configuration files for development tools, shell environments, and system utilities. Designed for cross-platform compatibility with a focus on developer productivity.

## ✨ Features

- **Cross-Platform Support**: Works on Windows (WSL), macOS, and Linux
- **Modern Neovim Setup**: Lua-based IDE-like editor configuration  
- **Multiple Shell Environments**: Zsh, Bash, and Fish with optimized workflows
- **Hyprland Desktop**: Tiling window manager configuration
- **Development Utilities**: Scripts for common development tasks
- **Automated Setup**: One-command installation and synchronization
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
![Fastfetch](https://img.shields.io/badge/System_Info-Fastfetch-00FF00?logo=terminal&logoColor=white)

### Development Tools

![Spicetify](https://img.shields.io/badge/Music-Spicetify-1DB954?logo=spotify&logoColor=white)
![UWSM](https://img.shields.io/badge/Workspace-UWSM-FF6B6B?logo=window-restore&logoColor=white)

### Version Control

![Git](https://img.shields.io/badge/VCS-Git-F05032?logo=git&logoColor=white)

## 📁 Repository Structure

```bash
configurations/
├── bash/                 # Bash shell configuration
│   └── .bashrc
├── fish/                 # Fish shell configuration
│   ├── config.fish
│   ├── functions/
│   └── conf.d/
├── zsh/                  # Zsh shell configuration
│   ├── .zshrc
│   ├── alias.zsh
│   └── greet.zsh
├── starship/             # Cross-shell prompt
│   └── starship.toml
├── tmux/                 # Terminal multiplexer
│   └── tmux.conf
├── foot/                 # Fast, lightweight terminal
│   └── foot.ini
├── hypr/                 # Hyprland window manager
│   ├── hyprland.conf
│   ├── hyprland/
│   └── scripts/
├── uwsm/                 # Universal workspace manager
│   ├── env/
│   └── env-hyprland/
├── btop/                 # Resource monitor
│   ├── btop.conf
│   └── themes/
├── fastfetch/            # System information tool
│   └── config.jsonc
├── caelestia/            # Personal theme and configs
│   ├── cli.json
│   ├── hypr-user.conf
│   ├── hypr-vars.conf
│   └── shell.json
├── spicetify/            # Spotify customization
│   ├── config-xpui.ini
│   ├── CustomApps/
│   ├── Extensions/
│   └── Themes/
├── nvim/                 # Neovim configuration
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
│       ├── core/         # Core Neovim settings
│       ├── lsp/          # LSP configuration
│       └── plugins/      # Plugin configurations
├── vscode/               # VSCode settings
│   ├── settings.json
│   ├── keybindings.json
│   ├── snippets/
│   └── extensions.txt
├── gtk-2.0/              # GTK2 theme settings
├── gtk-3.0/              # GTK3 theme settings
├── gtk-4.0/              # GTK4 theme settings
├── scripts/              # Utility scripts
│   ├── backup.sh
│   └── bulk-delete.sh
├── code-flags.conf       # VS Code flags
├── monitors.xml          # Display configuration
├── install.sh           # Automated installation script
└── README.md            # This documentation
```

## ⚡ Quick Installation

### Automated Installation (Recommended)

**One-command setup for all platforms:**

```bash
# Download and run the installer
curl -fsSL https://raw.githubusercontent.com/devalentineomonya/dotfiles/main/install.sh | bash
```

**Or manually:**

```bash
# Clone the repository
git clone https://github.com/devalentineomonya/dotfiles.git ~/.dotfiles

# Run installation
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

The installer will:
- 🖥️ Detect your operating system and package manager
- 📦 Install required dependencies
- 💾 Backup existing configurations
- 🔗 Create symbolic links to the new configs
- ⚙️ Set up shell environments and applications

### Platform-Specific Notes

**Windows:**
- Supports Chocolatey, Scoop, and Winget package managers
- Works with WSL2, Git Bash, or native Windows environments
- Automatically detects admin privileges

**macOS:**
- Uses Homebrew for package management
- Sets up proper shell environments

**Linux:**
- Supports Arch (pacman), Debian/Ubuntu (apt), RedHat (yum), and Alpine (apk)
- Handles sudo privileges automatically

## 🔧 Manual Installation

If you prefer manual setup or want specific components:

```bash
# Clone repository
git clone https://github.com/devalentineomonya/dotfiles.git ~/.dotfiles

# Create config directory
mkdir -p ~/.config

# Link specific configurations
ln -sf ~/.dotfiles/configurations/bash ~/.config/bash
ln -sf ~/.dotfiles/configurations/zsh ~/.config/zsh
ln -sf ~/.dotfiles/configurations/nvim ~/.config/nvim
ln -sf ~/.dotfiles/configurations/tmux ~/.config/tmux
ln -sf ~/.dotfiles/configurations/starship/starship.toml ~/.config/starship.toml

# Link shell configs
ln -sf ~/.dotfiles/configurations/bash/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/configurations/zsh/.zshrc ~/.zshrc
```

## 🔄 Update & Sync

To update your configurations with the latest changes:

```bash
# Navigate to dotfiles directory
cd ~/.dotfiles

# Pull latest changes
git pull origin main

# Re-run installation to apply updates
./install.sh

# Or manually reload configurations
source ~/.zshrc    # for Zsh users
source ~/.bashrc   # for Bash users
```

## 🎨 Customization

### Personalizing Configurations

Each configuration is modular and can be customized:

**Shell Customization:**
- Edit aliases: `~/.config/zsh/alias.zsh` or `~/.config/bash/.bashrc`
- Add custom functions in respective shell directories
- Modify prompt theme in `~/.config/starship/starship.toml`

**Neovim Customization:**
- Core settings: `~/.config/nvim/lua/core/`
- LSP configuration: `~/.config/nvim/lua/lsp/`
- Plugin settings: `~/.config/nvim/lua/plugins/`

**Hyprland Customization:**
- Main config: `~/.config/hypr/hyprland.conf`
- Keybinds and rules: `~/.config/hypr/hyprland/`
- User overrides: `~/.config/caelestia/hypr-user.conf`

### Adding New Scripts

Place custom scripts in the `scripts/` directory:

```bash
# Make script executable
chmod +x ~/.dotfiles/configurations/scripts/your-script.sh

# Link to local bin for easy access
ln -sf ~/.dotfiles/configurations/scripts/your-script.sh ~/.local/bin/your-script
```

## 🛠️ Backup & Restore

Use the included backup script to safeguard your configurations:

```bash
# Create backup of current configs
./configurations/scripts/backup.sh

# Backup will be saved to ~/Desktop/learningCoding/configurations/
```

## 🤝 Contributing

Contributions are welcome! Here's how to get started:

1. **Fork the repository**
2. **Create a feature branch:**
   ```bash
   git checkout -b feature/amazing-improvement
   ```
3. **Make your changes** following the existing code style
4. **Test on multiple platforms** if possible
5. **Commit your changes:**
   ```bash
   git commit -m 'Add amazing improvement'
   ```
6. **Push to the branch:**
   ```bash
   git push origin feature/amazing-improvement
   ```
7. **Open a Pull Request**

### Development Guidelines

- Follow existing directory structure and naming conventions
- Update documentation for new features
- Ensure cross-platform compatibility
- Test installation script changes thoroughly

## 🐛 Troubleshooting

### Common Issues

**Installation fails:**
- Ensure you have git installed
- Check your internet connection
- Run with `--help` flag for options: `./install.sh --help`

**Symlinks not working:**
- Verify permissions on target directories
- On Windows, ensure developer mode is enabled for symlinks

**Shell not loading configs:**
- Check if shell config files are properly linked
- Verify shell startup files are sourced correctly

### Getting Help

If you encounter issues:
1. Check the [GitHub Issues](https://github.com/devalentineomonya/dotfiles/issues) for existing solutions
2. Create a new issue with detailed description of your problem
3. Include your OS, shell, and any error messages

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the dotfiles community and various developer setups
- Thanks to all the open-source projects that make these configurations possible
- Contributors and testers who help improve these configurations

---

**Maintained by [Valentine Omonya](https://github.com/devalentineomonya)**  

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/devalentineomonya)
[![Twitter](https://img.shields.io/badge/Twitter-Follow-1DA1F2?logo=twitter)](https://x.com/devalentine_)
[![Website](https://img.shields.io/badge/Website-Portfolio-FF7139?logo=react)](https://valentinee.dev)

*"Productivity is never an accident. It is always the result of a commitment to excellence, intelligent planning, and focused effort."* - Paul J. Meyer
