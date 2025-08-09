#!/bin/sh

LINKS_CONFIG="$(dirname "$0")/links.yml"

if [ ! -f "$LINKS_CONFIG" ]; then
    echo "Error: Links configuration file not found: $LINKS_CONFIG"
    return 1
fi

yq -r '.links[] | .destination' "$LINKS_CONFIG" | while read -r destination; do
  dest="$HOME/$destination"
  if [ -L "$dest" ]; then
      echo "remove link $(basename "$dest")"
      unlink "$dest"
  fi
done

echo "Symbolic links removal completed"
