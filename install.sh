#!/bin/bash

# ============================================================
# 🎨 Greeting Function
# ============================================================
show_greeting() {
    # Set dark color (ANSI escape code)
    echo -ne '\x1b[38;5;16m'
    echo ''
    echo ' ██████╗██████╗ ██╗  ██╗██╗  ██╗██████╗ ██████╗'
    echo '██╔════╝██╔══██╗██║  ██║██║ ██╔╝╚════██╗██╔══██╗'
    echo '██║     ██████╔╝███████║█████╔╝  █████╔╝██████╔╝'
    echo '██║     ██╔══██╗╚════██║██╔═██╗  ╚═══██╗██╔══██╗'
    echo '╚██████╗██║  ██║     ██║██║  ██╗██████╔╝██║  ██║'
    echo ' ╚═════╝╚═╝  ╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝'
    echo ''
    echo '───────────────────────────────────────────────────────'
    echo '            D O T F I L E S   I N S T A L L E R'
    echo '───────────────────────────────────────────────────────'
    # Reset color
    echo -ne '\x1b[0m'
}

# ============================================================
# 🎯 Configuration
# ============================================================
DOTFILES_DIR="$HOME/.local/shared/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
REPO_URL="https://github.com/devalentineomonya/dotfiles.git"

# ============================================================
# 🎨 Colors and Styles
# ============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'
DIM='\033[2m'

# ============================================================
# 🔧 Utility Functions
# ============================================================
print_status() {
    echo -e "${BLUE}⟹${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_step() {
    echo -e "\n${PURPLE}▶${NC} ${BOLD}$1${NC}"
}

# ============================================================
# 🔍 System Detection
# ============================================================
detect_system() {
    print_step "Detecting System Environment"
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/arch-release ]; then
            SYSTEM="arch"
            PACKAGE_MANAGER="pacman"
        elif [ -f /etc/debian_version ]; then
            SYSTEM="debian"
            PACKAGE_MANAGER="apt"
        elif [ -f /etc/redhat-release ]; then
            SYSTEM="redhat"
            PACKAGE_MANAGER="yum"
        elif [ -f /etc/alpine-release ]; then
            SYSTEM="alpine"
            PACKAGE_MANAGER="apk"
        else
            SYSTEM="linux"
            PACKAGE_MANAGER="unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        SYSTEM="macos"
        PACKAGE_MANAGER="brew"
    elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
        SYSTEM="windows"
        # Detect Windows package manager
        if command -v choco &> /dev/null; then
            PACKAGE_MANAGER="choco"
        elif command -v scoop &> /dev/null; then
            PACKAGE_MANAGER="scoop"
        elif command -v winget &> /dev/null; then
            PACKAGE_MANAGER="winget"
        else
            PACKAGE_MANAGER="unknown"
        fi
    else
        SYSTEM="unknown"
        PACKAGE_MANAGER="unknown"
    fi

    print_success "Detected: $SYSTEM ($PACKAGE_MANAGER)"
}

# ============================================================
# 🔐 Security Functions
# ============================================================
check_sudo() {
    if [[ "$SYSTEM" == "windows" ]]; then
        # On Windows, check if running as admin
        net session > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            print_success "Running with administrator privileges"
            return 0
        else
            print_warning "Not running as administrator (some installations may fail)"
            return 1
        fi
    elif [ "$EUID" -ne 0 ]; then
        print_warning "Elevated privileges required"
        sudo -v
        if [ $? -eq 0 ]; then
            print_success "Sudo access granted"
            return 0
        else
            print_error "Failed to get sudo access"
            return 1
        fi
    fi
    return 0
}

confirm_action() {
    local message=$1
    echo -e "${YELLOW}?${NC} $message (y/N)"
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# ============================================================
# 📦 Package Management
# ============================================================
install_package() {
    local package=$1
    local install_cmd=""
    
    case $PACKAGE_MANAGER in
        pacman)
            install_cmd="sudo pacman -S --noconfirm $package"
            ;;
        apt)
            install_cmd="sudo apt update && sudo apt install -y $package"
            ;;
        yum)
            install_cmd="sudo yum install -y $package"
            ;;
        apk)
            install_cmd="sudo apk add $package"
            ;;
        brew)
            install_cmd="brew install $package"
            ;;
        choco)
            install_cmd="choco install $package -y"
            ;;
        scoop)
            install_cmd="scoop install $package"
            ;;
        winget)
            install_cmd="winget install $package"
            ;;
        *)
            print_warning "Unknown package manager for $package"
            return 1
            ;;
    esac
    
    if command -v $package &> /dev/null; then
        print_success "$package already installed"
        return 0
    fi
    
    print_status "Installing $package..."
    if eval $install_cmd &> /dev/null; then
        print_success "Installed $package"
        return 0
    else
        print_error "Failed to install $package"
        return 1
    fi
}

install_required_packages() {
    print_step "Installing Required Packages"
    
    local base_packages="git curl wget"
    local recommended_packages="zsh fish neovim tmux"
    
    # Windows-specific package names
    if [[ "$SYSTEM" == "windows" ]]; then
        base_packages="git curl wget"
        recommended_packages=""
    fi
    
    for pkg in $base_packages; do
        install_package "$pkg"
    done
    
    if confirm_action "Install recommended packages (zsh, fish, neovim, tmux)?"; then
        for pkg in $recommended_packages; do
            install_package "$pkg"
        done
    fi
}

# ============================================================
# 📁 Dotfiles Management
# ============================================================
backup_existing() {
    print_step "Backing Up Existing Configurations"
    
    mkdir -p "$BACKUP_DIR"
    local configs=(
        "$HOME/.bashrc"
        "$HOME/.zshrc"
        "$HOME/.config/nvim"
        "$HOME/.config/tmux"
        "$HOME/.config/zsh"
        "$HOME/.config/fish"
        "$HOME/.config/hypr"
        "$HOME/.config/foot"
        "$HOME/.config/btop"
        "$HOME/.config/fastfetch"
        "$HOME/.config/spicetify"
        "$HOME/.config/caelestia"
        "$HOME/.config/uwsm"
        "$HOME/.config/starship.toml"
        "$HOME/.config/code-flags.conf"
        "$HOME/.config/monitors.xml"
    )
    
    for config in "${configs[@]}"; do
        if [ -e "$config" ]; then
            print_status "Backing up $config"
            cp -r "$config" "$BACKUP_DIR/" 2>/dev/null && \
            print_success "Backed up $config" || \
            print_warning "Could not backup $config"
        fi
    done
    
    print_success "Backups saved to $BACKUP_DIR"
}

setup_dotfiles_repo() {
    print_step "Setting Up Dotfiles Repository"
    
    # Check if we're already in a dotfiles directory
    if [[ "$(pwd)" == *"dotfiles"* ]] && [ -f "install.sh" ]; then
        DOTFILES_DIR="$(pwd)"
        print_success "Using current directory as dotfiles: $DOTFILES_DIR"
        return 0
    fi
    
    # Check if dotfiles exist in default location
    if [ -d "$DOTFILES_DIR" ]; then
        print_success "Dotfiles found at $DOTFILES_DIR"
        return 0
    fi
    
    # Ask user for dotfiles location
    echo -e "${YELLOW}?${NC} Dotfiles directory not found. Where are your dotfiles?"
    echo "1) Clone from GitHub"
    echo "2) Use custom path"
    echo "3) Exit"
    
    read -r choice
    case $choice in
        1)
            print_status "Cloning from $REPO_URL..."
            if git clone "$REPO_URL" "$DOTFILES_DIR"; then
                print_success "Repository cloned successfully"
                return 0
            else
                print_error "Failed to clone repository"
                return 1
            fi
            ;;
        2)
            echo -e "${YELLOW}?${NC} Enter the path to your dotfiles:"
            read -r custom_path
            if [ -d "$custom_path" ]; then
                DOTFILES_DIR="$custom_path"
                print_success "Using custom dotfiles path: $DOTFILES_DIR"
                return 0
            else
                print_error "Directory not found: $custom_path"
                return 1
            fi
            ;;
        3)
            print_error "Installation cancelled"
            exit 1
            ;;
        *)
            print_error "Invalid choice"
            return 1
            ;;
    esac
}

create_symlinks() {
    print_step "Creating Configuration Symlinks"
    
    # Check if we're using the correct structure
    if [ -d "$DOTFILES_DIR/configurations" ]; then
        local config_dir="$DOTFILES_DIR/configurations"
    elif [ -d "$DOTFILES_DIR/.config" ]; then
        local config_dir="$DOTFILES_DIR/.config"
    else
        local config_dir="$DOTFILES_DIR"
    fi
    
    if [ ! -d "$config_dir" ]; then
        print_error "Config directory not found in $config_dir"
        return 1
    fi
    
    mkdir -p "$HOME/.config"
    
    # List of config directories to link
    local configs=("bash" "fish" "zsh" "nvim" "tmux" "hypr" "foot" "btop" 
                   "fastfetch" "spicetify" "caelestia" "uwsm" "starship" "vscode")
    
    for config in "${configs[@]}"; do
        local source_path="$config_dir/$config"
        local target_path="$HOME/.config/$config"
        
        if [ -e "$source_path" ]; then
            if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
                print_warning "Backing up existing $config"
                mv "$target_path" "$target_path.backup.$(date +%s)"
            fi
            
            print_status "Linking $config"
            # Remove existing symlink or directory
            rm -rf "$target_path"
            ln -sf "$source_path" "$target_path" && \
            print_success "Linked $config" || \
            print_error "Failed to link $config"
        else
            print_warning "Config not found: $config"
        fi
    done
    
    # Handle single files
    if [ -f "$config_dir/code-flags.conf" ]; then
        ln -sf "$config_dir/code-flags.conf" "$HOME/.config/code-flags.conf"
    fi
    if [ -f "$config_dir/monitors.xml" ]; then
        ln -sf "$config_dir/monitors.xml" "$HOME/.config/monitors.xml"
    fi
    
    # Handle shell config files
    if [ -f "$config_dir/bash/.bashrc" ]; then
        ln -sf "$config_dir/bash/.bashrc" "$HOME/.bashrc"
    fi
    if [ -f "$config_dir/zsh/.zshrc" ]; then
        ln -sf "$config_dir/zsh/.zshrc" "$HOME/.zshrc"
    fi
    
    print_success "All symlinks created"
}

# ============================================================
# 🔧 Post-Installation Setup
# ============================================================
setup_shell() {
    print_step "Setting Up Shell Environment"
    
    if command -v zsh &> /dev/null && [ -d "$HOME/.config/zsh" ]; then
        if confirm_action "Set ZSH as default shell?"; then
            if [[ "$SYSTEM" != "windows" ]]; then
                chsh -s $(which zsh)
                print_success "ZSH set as default shell"
            else
                print_warning "On Windows, you may need to set ZSH as default shell manually"
            fi
        fi
    fi
    
    if command -v fish &> /dev/null && [ -d "$HOME/.config/fish" ]; then
        print_success "Fish configuration linked"
    fi
}

setup_vscode() {
    if command -v code &> /dev/null || command -v code-insiders &> /dev/null; then
        print_step "Setting Up VSCode"
        
        # Determine VSCode config directory
        if [[ "$SYSTEM" == "windows" ]]; then
            local vscode_config="$APPDATA/Code/User"
        else
            local vscode_config="$HOME/.config/Code/User"
        fi
        
        mkdir -p "$vscode_config"
        
        # Link settings if they exist in our dotfiles
        if [ -f "$HOME/.config/vscode/settings.json" ]; then
            ln -sf "$HOME/.config/vscode/settings.json" "$vscode_config/settings.json"
        fi
        if [ -f "$HOME/.config/vscode/keybindings.json" ]; then
            ln -sf "$HOME/.config/vscode/keybindings.json" "$vscode_config/keybindings.json"
        fi
        if [ -d "$HOME/.config/vscode/snippets" ]; then
            ln -sf "$HOME/.config/vscode/snippets" "$vscode_config/snippets"
        fi
        
        # Install extensions if extensions file exists
        if [ -f "$HOME/.config/vscode/extensions.txt" ]; then
            if confirm_action "Install VSCode extensions from list?"; then
                local code_cmd="code"
                if command -v code-insiders &> /dev/null; then
                    code_cmd="code-insiders"
                fi
                
                while IFS= read -r extension; do
                    if [ -n "$extension" ] && [[ ! "$extension" =~ ^# ]]; then
                        $code_cmd --install-extension "$extension" --force
                    fi
                done < "$HOME/.config/vscode/extensions.txt"
            fi
        fi
        
        print_success "VSCode configured"
    fi
}

setup_windows_specific() {
    if [[ "$SYSTEM" == "windows" ]]; then
        print_step "Setting Up Windows Specific Configurations"
        
        # Install Windows terminal if available
        if command -v wt &> /dev/null; then
            print_status "Windows Terminal detected"
        fi
        
        # Setup WSL integration if WSL is available
        if command -v wsl &> /dev/null; then
            if confirm_action "Set up WSL integration for dotfiles?"; then
                print_status "WSL integration can be configured manually"
            fi
        fi
    fi
}

# ============================================================
# 🚀 Main Installation Process
# ============================================================
main() {
    clear
    show_greeting
    
    print_step "Starting Dotfiles Installation"
    
    # System detection
    detect_system
    
    # Security check (skip on Windows if not admin)
    if [[ "$SYSTEM" != "windows" ]]; then
        check_sudo || {
            print_error "Sudo access required for installation"
            exit 1
        }
    else
        check_sudo
    fi
    
    # Setup dotfiles repository
    setup_dotfiles_repo || {
        print_error "Failed to setup dotfiles repository"
        exit 1
    }
    
    # Backup existing configs
    backup_existing
    
    # Install packages
    install_required_packages
    
    # Create symlinks
    create_symlinks
    
    # Additional setup
    setup_shell
    setup_vscode
    setup_windows_specific
    
    # Final message
    echo -e "\n${GREEN}${BOLD}✨ Installation Complete!${NC}"
    echo -e "${CYAN}Your dotfiles have been successfully installed.${NC}"
    echo -e "${YELLOW}Backups saved to: $BACKUP_DIR${NC}"
    echo -e "\n${BOLD}Next steps:${NC}"
    
    if [[ "$SYSTEM" == "windows" ]]; then
        echo -e "  • Restart your terminal or PowerShell"
        echo -e "  • Check individual configs in ${GREEN}~/.config/${NC}"
        echo -e "  • Consider installing Windows Terminal from Microsoft Store"
    else
        echo -e "  • Restart your terminal or run: ${GREEN}source ~/.zshrc${NC}"
        echo -e "  • Check individual configs in ${GREEN}~/.config/${NC}"
    fi
    
    echo -e "  • Customize settings to your preference"
    echo -e "\n${DIM}Happy coding! 🚀${NC}"
}

# ============================================================
# 🎯 Script Entry Point
# ============================================================
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Check if running with --help or -h
    if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
        echo -e "${BOLD}Dotfiles Installer${NC}"
        echo "Usage: $0 [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  -h, --help     Show this help message"
        echo "  --manual       Manual installation mode"
        echo ""
        echo "This script will:"
        echo "  1. Detect your system and package manager"
        echo "  2. Backup existing configurations"
        echo "  3. Install required packages"
        echo "  4. Create symlinks to dotfiles"
        echo "  5. Setup shell environment and applications"
        exit 0
    fi
    
    if [[ "$1" == "--manual" ]]; then
        echo -e "${YELLOW}Manual installation mode${NC}"
        echo "Clone repository manually:"
        echo "  git clone $REPO_URL $DOTFILES_DIR"
        echo "Then create symlinks as needed."
        exit 0
    fi
    
    # Run main installation
    main "$@"
fi
