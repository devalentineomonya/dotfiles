
#!/bin/bash
# Safe backup of important configs to ~/Desktop/learningCoding/configurations
# Copies actual files/directories, leaving other files untouched

# --- Safe working directory ---
cd ~ || exit

# --- Backup destination ---
BACKUP_DIR="$HOME/Desktop/learningCoding/configurations"
mkdir -p "$BACKUP_DIR"

echo "Cleaning old backups..."
# List of items to refresh (only these will be removed)
TARGETS=(
  bash fish zsh starship.toml tmux
  foot hypr uwsm
  btop caelestia fastfetch spicetify
  code-flags.conf monitors.xml
  nvim gtk-2.0 gtk-3.0 gtk-4.0
  vscode
)

for t in "${TARGETS[@]}"; do
    if [ -e "$BACKUP_DIR/$t" ]; then
        rm -rf "$BACKUP_DIR/$t"
        echo "Removed old backup: $t"
    fi
done

# --- Helper function to copy config safely ---
copy() {
    local src="$1"
    local dest="$2"

    if [ -e "$src" ]; then
        # rsync with -aL: archive mode + dereference symlinks
        rsync -aL "$src" "$dest"
        echo "Copied: $src -> $dest"
    else
        echo "Skipped (not found): $src"
    fi
}

echo "Copying configs to backup folder..."

# --- Shell configs ---
copy "$HOME/.config/bash" "$BACKUP_DIR/bash"
copy "$HOME/.config/fish" "$BACKUP_DIR/fish"
copy "$HOME/.config/zsh" "$BACKUP_DIR/zsh"
copy "$HOME/.config/starship.toml" "$BACKUP_DIR/starship.toml"
copy "$HOME/.config/tmux" "$BACKUP_DIR/tmux"

# --- Window manager / terminals ---
copy "$HOME/.config/foot" "$BACKUP_DIR/foot"
copy "$HOME/.config/hypr" "$BACKUP_DIR/hypr"
copy "$HOME/.config/uwsm" "$BACKUP_DIR/uwsm"

# --- Utilities ---
copy "$HOME/.config/btop" "$BACKUP_DIR/btop"
copy "$HOME/.config/caelestia" "$BACKUP_DIR/caelestia"
copy "$HOME/.config/fastfetch" "$BACKUP_DIR/fastfetch"
copy "$HOME/.config/spicetify" "$BACKUP_DIR/spicetify"
copy "$HOME/.config/code-flags.conf" "$BACKUP_DIR/code-flags.conf"
copy "$HOME/.config/monitors.xml" "$BACKUP_DIR/monitors.xml"

# --- Editors ---
copy "$HOME/.config/nvim" "$BACKUP_DIR/nvim"

# --- GTK themes ---
copy "$HOME/.config/gtk-2.0" "$BACKUP_DIR/gtk-2.0"
copy "$HOME/.config/gtk-3.0" "$BACKUP_DIR/gtk-3.0"
copy "$HOME/.config/gtk-4.0" "$BACKUP_DIR/gtk-4.0"

# --- Minimal VSCode backup ---
mkdir -p "$BACKUP_DIR/vscode"
copy "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/vscode/settings.json"
copy "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/vscode/keybindings.json"
copy "$HOME/.config/Code/User/snippets" "$BACKUP_DIR/vscode/snippets"

# Export installed extensions if code CLI exists
if command -v code >/dev/null 2>&1; then
    code --list-extensions > "$BACKUP_DIR/vscode/extensions.txt"
fi

echo "Backup completed successfully in $BACKUP_DIR"
