#!/bin/sh

SCRIPT_DIR="$(dirname "$0")"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFS_DIR="$REPO_ROOT/confs"

ln -fsv "$REPO_ROOT/.mise.toml" "$CONFS_DIR/.config/mise/config.toml"

if [ ! -d "$CONFS_DIR" ]; then
    echo "Error: Configuration directory not found: $CONFS_DIR"
    exit 1
fi

## download git-prompt
if [ ! -d "$CONFS_DIR/.zsh" ]; then
    mkdir -p "$CONFS_DIR/.zsh"
fi
curl -o "$CONFS_DIR/.zsh/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o "$CONFS_DIR/.zsh/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o "$CONFS_DIR/.zsh/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# preparation
if [ ! -f "$CONFS_DIR/.config/git/config_alt" ]; then
    echo "config_alt is not copied yet. so automatically copying it."
    cp "$CONFS_DIR/.config/git/config_alt.example" "$CONFS_DIR/.config/git/config_alt"
fi

# Find all files in confs directory and create symbolic links
find "$CONFS_DIR" -type f | while read -r abs_source; do
    # Get relative path from confs directory
    relative_path="${abs_source#$CONFS_DIR/}"
    
    # Skip special files
    case "$relative_path" in
        *.example|*/.gitkeep)
            echo "Skipping: $relative_path"
            continue
            ;;
    esac
    
    # Destination path in home directory
    abs_dest="$HOME/$relative_path"
    
    # Create destination directory if it doesn't exist
    dest_dir=$(dirname "$abs_dest")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
        echo "Created directory: $dest_dir"
    fi
    
    # Check if destination already exists
    if [ -L "$abs_dest" ]; then
        # If it's already a symlink, check if it points to the correct location
        current_target=$(readlink "$abs_dest")
        if [ "$current_target" = "$abs_source" ]; then
            echo "Link already exists and is correct: $abs_dest -> $abs_source"
            continue
        else
            echo "Removing incorrect symlink: $abs_dest -> $current_target"
            rm "$abs_dest"
        fi
    elif [ -e "$abs_dest" ]; then
        echo "Warning: Destination exists but is not a symlink: $abs_dest"
        echo "Please remove or backup this file manually"
        continue
    fi
    
    # Create the symbolic link
    ln -fsv "$abs_source" "$abs_dest"
    echo "Created symlink: $abs_dest -> $abs_source"
done

echo "Symbolic links setup completed"
