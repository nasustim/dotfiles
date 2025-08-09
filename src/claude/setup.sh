#!/bin/sh

if [ -L "${HOME}/.claude/CLAUDE.md" ]; then
  echo "skip link .claude"
else
  echo "add symbolic link .claude"
  ln -fsv "${PWD}/claude/.claude/CLAUDE.md" "${HOME}/.claude/CLAUDE.md"
fi

if [ -L "${HOME}/.claude/settings.json" ]; then
  echo "skip link .claude"
else
  echo "add symbolic link .claude"
  ln -fsv "${PWD}/claude/.claude/settings.json" "${HOME}/.claude/settings.json"
fi