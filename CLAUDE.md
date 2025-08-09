# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

This is a dotfiles repository that manages shell configurations and development environment setup:

- `make` or `make all` - Install all dotfiles configurations (creates all symbolic links)
- `make clean` - Remove all symbolic links created by the setup

## Repository Architecture

This is a centralized dotfiles repository with the following structure:

- **Centralized Link Management**: Uses YAML configuration (`lib/links.yml`) to define all symbolic links
- **Shell Script Automation**: `lib/link.sh` and `lib/unlink.sh` handle all linking/unlinking operations
- **XDG Base Directory Compliance**: Most configurations follow XDG standards in `.config/` directories
- **Simple Makefile**: Minimal orchestration with just `all` and `clean` targets

### Directory Organization

- `confs/vim/` - Vim configuration (.vimrc)
- `confs/.config/tmux/` - Tmux configuration following XDG standards
- `confs/.config/git/` - Git configuration including ignore patterns and multiple git identities
- `confs/zsh/` - Zsh configuration with git prompt and completion integration
- `confs/.config/mise/` - Mise version manager configuration (replaces asdf)
- `confs/claude/` - Claude Code settings and configuration
- `lib/` - Centralized linking scripts and YAML configuration

### Configuration Management

All configurations are managed through `lib/links.yml` which defines:
1. Source file locations in the `confs/` directory
2. Target destinations in the home directory
3. Automatic creation of necessary parent directories

The linking system:
- Creates symbolic links from repository files to home directory locations
- Supports XDG Base Directory structure (`.config/`, etc.)
- Handles complex directory structures automatically

### Git Configuration Notes

The git setup includes multiple identity configurations:
- `config` - Primary git configuration
- `config_alt` - Alternative git identity configuration  
- `config_alt.example` - Template for alternative configuration
- `ignore` - Global gitignore patterns (replaces `.gitignore_global`)

### Claude Code Integration

The repository includes Claude Code configuration files in `confs/claude/.claude/`:
- `settings.json` - Permissions and environment settings
- `CLAUDE.md` - Core development principles (implement without breaking tests/linters)