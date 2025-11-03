#!/bin/bash
# Minimal backup of essential configs to ~/Desktop/learningCoding/configurations

# --- Safe working directory ---
cd ~ || exit

# --- Backup destination ---
BACKUP_DIR="$HOME/Desktop/learningCoding/configurations"
mkdir -p "$BACKUP_DIR"

echo "Cleaning old backups..."
# List of essential configs to backup
ESSENTIAL_CONFIGS=(
  bash fish zsh starship tmux
  foot hypr uwsm
  btop caelestia fastfetch spicetify
  code-flags.conf monitors.xml
  nvim
  vscode
)

for config in "${ESSENTIAL_CONFIGS[@]}"; do
    if [ -e "$BACKUP_DIR/$config" ]; then
        rm -rf "$BACKUP_DIR/$config"
        echo "Removed old backup: $config"
    fi
done

# --- Helper function to copy contents without double directories ---
copy_contents() {
    local src="$1"
    local dest="$2"

    if [ -e "$src" ]; then
        # Create destination directory
        mkdir -p "$dest"
        
        # Check if source is a symlink
        if [ -L "$src" ]; then
            # If it's a symlink, copy the actual target contents
            local target=$(readlink -f "$src")
            echo "Copying symlink target: $src -> $target"
            if [ -d "$target" ]; then
                find "$target" -mindepth 1 -maxdepth 1 -exec cp -r {} "$dest/" \;
            else
                cp "$target" "$dest/"
            fi
        elif [ -d "$src" ]; then
            # Regular directory - copy contents
            find "$src" -mindepth 1 -maxdepth 1 -exec cp -r {} "$dest/" \;
            echo "Copied contents: $src -> $dest"
        else
            cp "$src" "$dest/"
            echo "Copied file: $src -> $dest"
        fi
    else
        echo "Skipped (not found): $src"
    fi
}

# --- Helper function for single files ---
copy_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        echo "Copied: $src -> $dest"
    else
        echo "Skipped (not found): $src"
    fi
}

echo "Copying essential configs to backup folder..."

# --- Shell configs ---
mkdir -p "$BACKUP_DIR/bash"
copy_file "$HOME/.bashrc" "$BACKUP_DIR/bash/.bashrc"
copy_contents "$HOME/.config/bash" "$BACKUP_DIR/bash"

mkdir -p "$BACKUP_DIR/fish"
copy_contents "$HOME/.config/fish" "$BACKUP_DIR/fish"

mkdir -p "$BACKUP_DIR/zsh"
copy_file "$HOME/.zshrc" "$BACKUP_DIR/zsh/.zshrc"
copy_file "$HOME/.config/zsh/alias.zsh" "$BACKUP_DIR/zsh/alias.zsh"
copy_file "$HOME/.config/zsh/greet.zsh" "$BACKUP_DIR/zsh/greet.zsh"

mkdir -p "$BACKUP_DIR/starship"
copy_file "$HOME/.config/starship.toml" "$BACKUP_DIR/starship/starship.toml"

# --- TMUX config ---
mkdir -p "$BACKUP_DIR/tmux"
copy_file "$HOME/.config/tmux/tmux.conf" "$BACKUP_DIR/tmux/tmux.conf"

# --- Window manager / terminals ---
mkdir -p "$BACKUP_DIR/foot"
copy_contents "$HOME/.config/foot" "$BACKUP_DIR/foot"

mkdir -p "$BACKUP_DIR/hypr"
copy_contents "$HOME/.config/hypr" "$BACKUP_DIR/hypr"

mkdir -p "$BACKUP_DIR/uwsm"
copy_contents "$HOME/.config/uwsm" "$BACKUP_DIR/uwsm"

# --- Utilities ---
mkdir -p "$BACKUP_DIR/btop"
copy_contents "$HOME/.config/btop" "$BACKUP_DIR/btop"

mkdir -p "$BACKUP_DIR/caelestia"
copy_contents "$HOME/.config/caelestia" "$BACKUP_DIR/caelestia"

mkdir -p "$BACKUP_DIR/fastfetch"
copy_contents "$HOME/.config/fastfetch" "$BACKUP_DIR/fastfetch"

mkdir -p "$BACKUP_DIR/spicetify"
copy_contents "$HOME/.config/spicetify" "$BACKUP_DIR/spicetify"

# --- System configs ---
copy_file "$HOME/.config/code-flags.conf" "$BACKUP_DIR/code-flags.conf"
copy_file "$HOME/.config/monitors.xml" "$BACKUP_DIR/monitors.xml"

# --- Editors ---
mkdir -p "$BACKUP_DIR/nvim"
copy_contents "$HOME/.config/nvim" "$BACKUP_DIR/nvim"

# --- VSCode (minimal backup) ---
mkdir -p "$BACKUP_DIR/vscode"
copy_file "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/vscode/settings.json"
copy_file "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/vscode/keybindings.json"
copy_contents "$HOME/.config/Code/User/snippets" "$BACKUP_DIR/vscode/snippets"

# Export installed extensions if code CLI exists
if command -v code >/dev/null 2>&1; then
    code --list-extensions > "$BACKUP_DIR/vscode/extensions.txt"
    echo "Exported VSCode extensions"
fi

echo "Minimal backup completed successfully in $BACKUP_DIR"
echo ""
echo "Backup structure:"
tree "$BACKUP_DIR" -L 2
