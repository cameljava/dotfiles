#!/bin/bash

BACKUP_DIR="$HOME/kgit/dotfiles/manualBackups/vscodes/vscode/"

# Backup settings
cp "$HOME/Library/Application Support/Code/User/settings.json" "$BACKUP_DIR/settings.json"

# Backup keybindings
# cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$BACKUP_DIR/keybindings.json"

# Backup snippets
cp -r "$HOME/Library/Application Support/Code/User/snippets" "$BACKUP_DIR/snippets"

BACKUP_DIR="$HOME/kgit/dotfiles/manualBackups/vscodes/cursor"

# Backup settings
cp "$HOME/Library/Application Support/Cursor/User/settings.json" "$BACKUP_DIR/settings.json"

# Backup keybindings
cp "$HOME/Library/Application Support/Cursor/User/keybindings.json" "$BACKUP_DIR/keybindings.json"

# Backup snippets
cp -r "$HOME/Library/Application Support/Cursor/User/snippets" "$BACKUP_DIR/snippets"
