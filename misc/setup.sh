#!/bin/sh

TYPE="misc"

if [ -L "${HOME}/.cargo/env" ]; then
  echo "skip link .cargo/env"
else
  echo "add symbolic link .cargo/env"
  ln -fsv "${PWD}/${TYPE}/.cargo/env" "${HOME}/.cargo/env"
fi