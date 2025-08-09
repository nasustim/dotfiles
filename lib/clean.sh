#!/bin/sh

# Load common linking utilities
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
. "${SCRIPT_DIR}/link_utils.sh"

echo "Removing all dotfiles links..."
remove_all_links

echo "Clean completed!"