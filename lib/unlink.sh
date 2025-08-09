#!/bin/sh

LINKS_CONFIG="$(dirname "$0")/links.yml"

if [ ! -f "$LINKS_CONFIG" ]; then
    echo "Error: Links configuration file not found: $LINKS_CONFIG"
    exit 1
fi

# Check if yq is installed and working
if ! command -v yq >/dev/null 2>&1 || ! yq --version >/dev/null 2>&1; then
    echo "Error: yq is required but not installed or not working"
    echo "Install with: brew install yq"
    exit 1
fi

yq -r '.links[] | .destination' "$LINKS_CONFIG" | while read -r destination; do
  dest="$HOME/$destination"
  if [ -L "$dest" ]; then
      echo "remove link $(basename "$dest")"
      unlink "$dest"
  fi
done

echo "Symbolic links removal completed"
