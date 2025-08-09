# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

This is a dotfiles repository that manages shell configurations and development environment setup:

- `make` - Install all dotfiles configurations (runs all setup scripts)
- `make vim` - Install vim configuration only
- `make tmux` - Install tmux configuration only  
- `make git` - Install git configuration only
- `make zsh` - Install zsh configuration only
- `make misc` - Install miscellaneous configurations (cargo, asdf)
- `make claude` - Install Claude Code configurations only
- `make clean` - Remove all symbolic links created by setup scripts

## Repository Architecture

This is a modular dotfiles repository with the following structure:

- **Modular Setup**: Each tool/application has its own directory with a `setup.sh` script
- **Symbolic Linking**: Setup scripts create symbolic links from the repo to home directory locations
- **Makefile Orchestration**: The root Makefile coordinates running individual setup scripts
- **Safe Installation**: Setup scripts check for existing links before creating new ones

### Directory Organization

- `confs/vim/` - Vim configuration and setup
- `confs/tmux/` - Tmux configuration and setup  
- `confs/git/` - Git configuration including global gitignore and formal/personal configs
- `confs/zsh/` - Zsh configuration with git prompt integration
- `confs/misc/` - Miscellaneous configs (Cargo, asdf version manager)
- `confs/claude/` - Claude Code settings and configuration

### Setup Script Pattern

All setup scripts follow a consistent pattern:
1. Check if symbolic link already exists
2. Create symbolic link if it doesn't exist
3. Handle special cases (like downloading git completion scripts for zsh)

### Git Configuration Notes

The git setup includes both personal and formal configurations:
- `.gitconfig_formal.example` is copied to `.gitconfig_formal` if it doesn't exist
- Users need to edit `.gitconfig_formal` for their formal git identity

### Claude Code Integration

The repository includes Claude Code configuration files in `confs/claude/.claude/`:
- `settings.json` - Permissions and environment settings
- `CLAUDE.md` - Core development principles (implement without breaking tests/linters)