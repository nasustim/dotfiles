#!/bin/sh

SCRIPT_DIR="$(dirname "$0")"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LINKS_CONFIG="$SCRIPT_DIR/links.yml"

if [ ! -f "$LINKS_CONFIG" ]; then
    echo "Error: Links configuration file not found: $LINKS_CONFIG"
    exit 1
fi

# Check if yq is installed
if ! command -v yq >/dev/null 2>&1; then
    echo "Error: yq is required but not installed"
    echo "Install with: brew install yq"
    exit 1
fi

# preparation
if [ ! -f "$REPO_ROOT/confs/.config/git/config_alt" ]; then
    echo "config_alt is not copied yet. so automatically copying it."
    cp "$REPO_ROOT/confs/.config/git/config_alt.example" "$REPO_ROOT/confs/.config/git/config_alt"
fi

# Parse links from YAML and create symbolic links
yq eval '.links[] | .source + ":" + .destination' "$LINKS_CONFIG" | while IFS=: read -r source dest; do
    # Resolve absolute paths
    abs_source="$REPO_ROOT/$source"
    abs_dest="$HOME/$dest"
    
    # Check if source exists
    if [ ! -e "$abs_source" ]; then
        echo "Warning: Source file does not exist: $abs_source"
        continue
    fi
    
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
