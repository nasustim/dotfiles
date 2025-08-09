#!/bin/sh

# Common utilities for linking and unlinking dotfiles

# Get the root directory of the dotfiles repository
# This script can be sourced or executed, so we need to find the repo root
if [ -n "${BASH_SOURCE[0]}" ]; then
    # Bash
    CURRENT_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ -n "$0" ] && [ "$0" != "-bash" ] && [ "$0" != "-sh" ]; then
    # POSIX shell when executed
    CURRENT_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
else
    # Fallback: start from current working directory
    CURRENT_SCRIPT_DIR="$(pwd)"
fi

# Find the repository root by looking for links.yml
REPO_ROOT=""
SEARCH_DIR="$CURRENT_SCRIPT_DIR"
while [ "$SEARCH_DIR" != "/" ]; do
    if [ -f "$SEARCH_DIR/links.yml" ]; then
        REPO_ROOT="$SEARCH_DIR"
        break
    fi
    SEARCH_DIR="$(dirname "$SEARCH_DIR")"
done

if [ -z "$REPO_ROOT" ]; then
    echo "Error: Could not find dotfiles repository root (looking for links.yml)"
    echo "Current script dir: $CURRENT_SCRIPT_DIR"
    echo "Searched in: $(pwd)"
    exit 1
fi

LINKS_CONFIG="${REPO_ROOT}/links.yml"

# Function to create links for a specific module
# Usage: create_links <module_name>
create_links() {
    local module="$1"
    
    if [ -z "$module" ]; then
        echo "Error: Module name is required"
        return 1
    fi
    
    if [ ! -f "$LINKS_CONFIG" ]; then
        echo "Error: Links configuration file not found: $LINKS_CONFIG"
        return 1
    fi
    
    # Parse YAML and process links for the specified module
    _parse_yaml_links "$module" | while read -r source_file dest_file module_name; do
        if [ -n "$source_file" ] && [ -n "$dest_file" ] && [ -n "$module_name" ]; then
            # Expand variables in destination path
            dest_file=$(eval echo "$dest_file")
            full_source_path="${REPO_ROOT}/${source_file}"
            
            if [ -L "$dest_file" ]; then
                echo "skip link $(basename "$dest_file")"
            else
                echo "add symbolic link $(basename "$dest_file")"
                
                # Create destination directory if needed
                dest_dir=$(dirname "$dest_file")
                if [ ! -d "$dest_dir" ]; then
                    mkdir -p "$dest_dir"
                fi
                
                ln -fsv "$full_source_path" "$dest_file"
            fi
        fi
    done
}

# Function to remove links for a specific module
# Usage: remove_links <module_name>
remove_links() {
    local module="$1"
    
    if [ -z "$module" ]; then
        echo "Error: Module name is required"
        return 1
    fi
    
    if [ ! -f "$LINKS_CONFIG" ]; then
        echo "Error: Links configuration file not found: $LINKS_CONFIG"
        return 1
    fi
    
    # Parse YAML and remove links for the specified module
    _parse_yaml_links "$module" | while read -r source_file dest_file module_name; do
        if [ -n "$source_file" ] && [ -n "$dest_file" ] && [ -n "$module_name" ]; then
            # Expand variables in destination path
            dest_file=$(eval echo "$dest_file")
            
            if [ -L "$dest_file" ]; then
                echo "remove link $(basename "$dest_file")"
                unlink "$dest_file"
            else
                echo "skip remove $(basename "$dest_file") (not a link)"
            fi
        fi
    done
}

# Function to remove all links
# Usage: remove_all_links
remove_all_links() {
    if [ ! -f "$LINKS_CONFIG" ]; then
        echo "Error: Links configuration file not found: $LINKS_CONFIG"
        return 1
    fi
    
    # Parse YAML and remove all links
    _parse_yaml_links "" | while read -r source_file dest_file module_name; do
        if [ -n "$source_file" ] && [ -n "$dest_file" ] && [ -n "$module_name" ]; then
            # Expand variables in destination path
            dest_file=$(eval echo "$dest_file")
            
            if [ -L "$dest_file" ]; then
                echo "remove link $(basename "$dest_file")"
                unlink "$dest_file"
            fi
        fi
    done
}

# Function to list all links for a module
# Usage: list_links <module_name>
list_links() {
    local module="$1"
    
    if [ -z "$module" ]; then
        echo "Error: Module name is required"
        return 1
    fi
    
    if [ ! -f "$LINKS_CONFIG" ]; then
        echo "Error: Links configuration file not found: $LINKS_CONFIG"
        return 1
    fi
    
    echo "Links for module: $module"
    echo "================================"
    
    # Parse YAML and list links for the specified module
    _parse_yaml_links "$module" | while read -r source_file dest_file module_name; do
        if [ -n "$source_file" ] && [ -n "$dest_file" ] && [ -n "$module_name" ]; then
            dest_file=$(eval echo "$dest_file")
            echo "  $source_file -> $dest_file"
        fi
    done
}

# Internal function to parse YAML links
# Usage: _parse_yaml_links <module_filter>
# If module_filter is empty, returns all links
_parse_yaml_links() {
    local module_filter="$1"
    
    # Simple YAML parser for our specific format
    # Extracts source, destination, and module for each link entry
    awk -v module_filter="$module_filter" '
    BEGIN { in_links = 0; source = ""; dest = ""; module = "" }
    
    # Start of links section
    /^links:/ { in_links = 1; next }
    
    # Skip comments and empty lines
    /^[[:space:]]*#/ || /^[[:space:]]*$/ { next }
    
    # If we are in links section
    in_links {
        # New link entry (starts with "  - ")
        if (/^[[:space:]]*-[[:space:]]*source:/) {
            # Output previous entry if it was complete and matches filter
            if (source != "" && dest != "" && module != "" && (module_filter == "" || module == module_filter)) {
                print source " " dest " " module
            }
            # Reset for new entry
            source = ""; dest = ""; module = ""
            # Extract source from current line
            sub(/^[[:space:]]*-[[:space:]]*source:[[:space:]]*/, "")
            source = $0
        }
        # Source field (if not on the same line as -)
        else if (/^[[:space:]]*source:[[:space:]]*/) {
            sub(/^[[:space:]]*source:[[:space:]]*/, "")
            source = $0
        }
        # Destination field
        else if (/^[[:space:]]*destination:[[:space:]]*/) {
            sub(/^[[:space:]]*destination:[[:space:]]*/, "")
            dest = $0
        }
        # Module field
        else if (/^[[:space:]]*module:[[:space:]]*/) {
            sub(/^[[:space:]]*module:[[:space:]]*/, "")
            module = $0
        }
        # End of links section (next top-level key)
        else if (/^[^[:space:]]/) {
            in_links = 0
        }
    }
    
    END {
        # Output the last entry if it was complete and matches filter
        if (source != "" && dest != "" && module != "" && (module_filter == "" || module == module_filter)) {
            print source " " dest " " module
        }
    }
    ' "$LINKS_CONFIG"
}

# Module-specific setup functions with special handling

# Git module setup - creates .gitconfig_alt from example if needed
setup_git() {
    # Create .gitconfig_alt from example if it doesn't exist
    if [ ! -e "${REPO_ROOT}/src/git/.gitconfig_alt" ]; then
        cp "${REPO_ROOT}/src/git/.gitconfig_alt.example" "${REPO_ROOT}/src/git/.gitconfig_alt"
        echo "make git/.gitconfig_alt. edit it!"
    fi
    
    # Create links for git module
    create_links "git"
}

# Zsh module setup - downloads git completion files
setup_zsh() {
    local zsh_dir="${REPO_ROOT}/src/zsh/.zsh"
    
    # Download git-prompt completion files
    echo "Downloading git completion files..."
    curl -o "${zsh_dir}/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    curl -o "${zsh_dir}/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    curl -o "${zsh_dir}/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
    
    # Create links for zsh module
    create_links "zsh"
}

# Misc module setup - sets environment variables
setup_misc() {
    # Create links for misc module
    create_links "misc"
    
    # Set environment variables
    export ASDF_GOLANG_MOD_VERSION_ENABLED=true
}

# Generic module setup for modules without special requirements
setup_module() {
    local module="$1"
    
    if [ -z "$module" ]; then
        echo "Error: Module name is required"
        return 1
    fi
    
    case "$module" in
        git)
            setup_git
            ;;
        zsh)
            setup_zsh
            ;;
        misc)
            setup_misc
            ;;
        vim|tmux|claude)
            create_links "$module"
            ;;
        *)
            echo "Error: Unknown module: $module"
            return 1
            ;;
    esac
}