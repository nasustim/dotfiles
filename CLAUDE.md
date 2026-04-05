# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

This is a dotfiles repository that manages shell configurations and development environment setup:

- `make` or `make all` - Install all dotfiles configurations (creates all symbolic links)
- `make clean` - Remove all symbolic links created by the setup

## Repository Architecture

`lib/link.sh` walks `confs/` and symlinks every file (and symlink) into `$HOME`, preserving the relative path. `*.example` and `.gitkeep` files are skipped. `lib/unlink.sh` reverses it.

Details:
- Repo layout: [docs/layout.md](docs/layout.md)
- `link.sh` behaviors: [docs/linking.md](docs/linking.md)

### Git Config

Multiple identities in `confs/.config/git/`: `config` (primary), `config_alt` (alternative, generated from `config_alt.example`), `ignore` (global gitignore).

### Claude Code Integration

Claude Code config lives in `confs/.claude/` (`settings.json`, `CLAUDE.md`, `agent-memory/`). When context7 MCP is available, use it for library documentation lookups.