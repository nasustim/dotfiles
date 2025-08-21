# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

This is a dotfiles repository that manages shell configurations and development environment setup:

- `make` or `make all` - Install all dotfiles configurations (creates all symbolic links)
- `make clean` - Remove all symbolic links created by the setup

## Repository Architecture

This is a centralized dotfiles repository with the following structure:

- **Automatic Link Management**: Automatically discovers and links all configuration files in `confs/` directory
- **Shell Script Automation**: `lib/link.sh` and `lib/unlink.sh` handle all linking/unlinking operations automatically
- **XDG Base Directory Compliance**: Most configurations follow XDG standards in `.config/` directories
- **Simple Makefile**: Minimal orchestration with just `all` and `clean` targets

### Directory Organization

- `confs/vim/` - Vim configuration (.vimrc)
- `confs/.config/tmux/` - Tmux configuration following XDG standards
- `confs/.config/git/` - Git configuration including ignore patterns and multiple git identities
- `confs/zsh/` - Zsh configuration with git prompt and completion integration
- `confs/.config/mise/` - Mise version manager configuration (replaces asdf)
- `confs/claude/` - Claude Code settings and configuration
- `lib/` - Automatic linking scripts

### Configuration Management

All configurations are managed automatically by discovering files in the `confs/` directory:
1. All files in `confs/` are automatically discovered and linked
2. Directory structure is preserved when creating symlinks in home directory  
3. Special files like `.gitkeep` and `.example` files are automatically skipped
4. Parent directories are created automatically as needed

The linking system:
- Automatically creates symbolic links from all files in `confs/` to corresponding locations in home directory
- Supports XDG Base Directory structure (`.config/`, etc.)
- Handles complex directory structures automatically
- No manual configuration required - just add files to `confs/` directory

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
- When context7 MCP is available, use context7 for library specification research