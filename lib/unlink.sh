#!/bin/sh

SCRIPT_DIR="$(dirname "$0")"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONFS_DIR="$REPO_ROOT/confs"

if [ ! -d "$CONFS_DIR" ]; then
    echo "Error: Configuration directory not found: $CONFS_DIR"
    exit 1
fi

# Find all files in confs directory and remove corresponding symlinks
find "$CONFS_DIR" -type f | while read -r source_file; do
    # Get relative path from confs directory
    relative_path="${source_file#$CONFS_DIR/}"
    
    # Skip special files
    case "$relative_path" in
        *.example|*/.gitkeep)
            continue
            ;;
    esac
    
    # Corresponding destination path in home directory
    dest="$HOME/$relative_path"
    
    if [ -L "$dest" ]; then
        # Verify it points to our source file
        current_target=$(readlink "$dest")
        if [ "$current_target" = "$source_file" ]; then
            echo "remove link $(basename "$dest")"
            unlink "$dest"
        fi
    fi
done

echo "Symbolic links removal completed"
