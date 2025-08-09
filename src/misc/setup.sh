#!/bin/sh

TYPE="misc"

if [ -L "${HOME}/.cargo/env" ]; then
  echo "skip link .cargo/env"
else
  echo "add symbolic link .cargo/env"
  mkdir "${HOME}/.cargo"
  ln -fsv "${PWD}/src/${TYPE}/.cargo/env" "${HOME}/.cargo/env"
fi

if [ -L "${HOME}/.asdfrc" ]; then
  echo "skip link .asdfrc"
else
  echo "add symbolic link .asdfrc"
  ln -fsv "${PWD}/src/${TYPE}/asdf/.asdfrc" "${HOME}/.asdfrc"
fi

ASDF_GOLANG_MOD_VERSION_ENABLED=true

