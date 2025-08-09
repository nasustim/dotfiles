# nasustim/dotfiles Repository Instructions

**ALWAYS follow these instructions first and only fallback to additional search and context gathering if the information here is incomplete or found to be in error.**

## Repository Overview

This is a dotfiles repository that manages shell configurations and development environment setup through centralized symbolic link management. The system uses YAML configuration files and shell scripts to create symbolic links from the repository to the user's home directory.

## Quick Start - Essential Commands

**Bootstrap and install dotfiles (VALIDATED - takes < 0.5 seconds):**
```bash
cd /path/to/dotfiles
make
```

**Remove all dotfiles symlinks (VALIDATED - takes < 0.03 seconds):**
```bash
make clean
```

## Prerequisites and Dependencies

**Required tools (install before proceeding):**
- `yq` - YAML processor (usually available via package managers)
  - Ubuntu/Debian: `apt-get install yq`
  - macOS: `brew install yq`
  - Or check if already installed: `which yq`

**System requirements:**
- Unix-like system (Linux, macOS, WSL)
- Standard shell utilities (bash/sh, ln, mkdir, readlink)

## Core Workflow - How the System Works

**Installation process:**
1. Run `make` → executes `lib/link.sh`
2. Script reads `lib/links.yml` configuration
3. Creates symbolic links from `confs/` directory to home directory
4. Automatically creates parent directories as needed (e.g., `.config/git/`)

**Configuration management:**
- All symlink definitions in `lib/links.yml`
- Source files in `confs/` directory tree
- Follows XDG Base Directory specification where applicable

## Repository Structure

```
├── .github/workflows/     # CI/CD workflows (test.yml, test-workflows.yml)
├── confs/                 # Configuration files to be symlinked
│   ├── .config/git/       # Git configuration (config, ignore, config_alt, config_alt.example)
│   ├── .config/mise/      # Mise version manager configuration (replaces asdf)
│   ├── .config/tmux/      # Tmux configuration following XDG standards
│   ├── claude/.claude/    # Claude Code configuration (settings.json)
│   ├── vim/               # Vim configuration (.vimrc)
│   └── zsh/               # Zsh configuration (.zshenv, .zshrc) with git prompt integration
├── lib/                   # Core scripts and configuration
│   ├── links.yml          # YAML configuration defining all symlinks
│   ├── link.sh           # Script to create symlinks
│   └── unlink.sh         # Script to remove symlinks
├── Makefile              # Simple build targets (all, clean)
├── CLAUDE.md             # Claude Code specific guidance and development principles
└── README.md             # Basic installation instructions
```

## Validation and Testing

**ALWAYS validate your changes with these commands:**

**1. Test basic functionality:**
```bash
# Clean existing setup
make clean

# Install fresh
make

# Verify symlinks created correctly
ls -la ~/.vimrc ~/.zshrc ~/.config/git/ ~/.claude/ ~/.config/mise/
```

**2. Validate shell scripts:**
```bash
# Run shellcheck on all shell scripts (VALIDATED - no errors)
shellcheck lib/*.sh
```

**3. Validate YAML configuration:**
```bash
# Validate YAML syntax (VALIDATED - no errors)
yq eval '.' lib/links.yml > /dev/null && echo "YAML valid" || echo "YAML invalid"
```

**4. Test CI workflow locally:**
```bash
# Validate GitHub workflow YAML
yq eval '.' .github/workflows/test.yml > /dev/null
yq eval '.' .github/workflows/test-workflows.yml > /dev/null
```

## Expected Warnings and Normal Behavior

**These warnings are NORMAL and expected:**
```
Warning: Source file does not exist: /path/to/dotfiles/confs/.config/tmux/tmux.conf
Warning: Source file does not exist: /path/to/dotfiles/confs/zsh/.zsh
```

**Why these occur:**
- `tmux.conf`: File exists as `.tmux.conf` but links.yml references `tmux.conf` (path mismatch)
- `.zsh`: Directory referenced in links.yml but not present in repository

**These warnings do NOT break functionality** - other configurations install correctly.

## Configuration Details

**Managed configurations:**
- **Vim**: Basic editor settings (line numbers, syntax highlighting, smart indent)
- **Git**: Multiple identity configurations with project-specific includes
- **Zsh**: Shell environment with homebrew integration, git prompt, and completions
- **Claude**: Claude Code integration with permissions and environment settings
- **Mise**: Version manager for Node.js and development tools (replaces asdf)
- **Tmux**: Terminal multiplexer configuration following XDG standards

**Git configuration features:**
- `config` - Primary git identity configuration
- `config_alt` - Alternative git identity for specific projects
- `config_alt.example` - Template for alternative configuration setup
- `ignore` - Global gitignore patterns (replaces `.gitignore_global`)

**Claude Code integration:**
- `confs/claude/.claude/settings.json` - Permissions and environment settings
- `CLAUDE.md` - Development principles and repository-specific guidance
- Core principle: Implement changes without breaking existing tests or linters

## Common Development Tasks

**Adding new configuration files:**
1. Add file to appropriate location in `confs/` directory
2. Update `lib/links.yml` with source and destination paths
3. Test with `make clean && make`
4. Validate symlink created correctly

**Modifying existing configurations:**
1. Edit files directly in `confs/` directory
2. Changes are immediately available (symlinks point to repository files)
3. No need to re-run `make` unless changing link structure

**Repository maintenance:**
```bash
# Check for broken symlinks
find ~ -type l -exec test ! -e {} \; -print 2>/dev/null | grep -E "\.(vimrc|zshrc|config)" || echo "No broken dotfile symlinks"

# View current symlink status
ls -la ~/.vimrc ~/.zshrc ~/.config/git/config ~/.claude/settings.json
```

## Claude Code Integration

**Repository includes specialized Claude Code support:**

**Configuration files:**
- `confs/claude/.claude/settings.json` - Claude Code permissions and environment settings
- `CLAUDE.md` - Repository-specific guidance for Claude Code development

**Development principles for Claude Code:**
- Implement changes without breaking existing tests or linters
- Use centralized link management system for all configurations
- Follow XDG Base Directory standards where applicable
- Maintain compatibility with the minimal, fast-executing setup (< 2 seconds total)

**Claude-specific configurations managed:**
- Permissions for file system access
- Environment settings for development workflow
- Integration with the symbolic link management system

**When working with Claude Code:**
1. Reference `CLAUDE.md` for repository-specific development guidance
2. Ensure changes align with the centralized configuration management approach
3. Test all changes with the standard `make clean && make` workflow
4. Validate that symbolic links are created correctly for Claude configurations

## CI/CD Pipeline

**GitHub Actions workflows:**
- **test.yml**: Runs basic `make` installation on macOS
- **test-workflows.yml**: Validates workflow syntax with actionlint

**Pipeline timing:**
- Setup: < 0.5 seconds
- No long-running builds or tests
- No complex compilation steps

**Before committing changes:**
```bash
# Validate all components
shellcheck lib/*.sh
yq eval '.' lib/links.yml > /dev/null
make clean && make
```

## Troubleshooting

**"yq not found" error:**
```bash
# Install yq
sudo apt-get install yq  # Ubuntu/Debian
brew install yq          # macOS
```

**"Permission denied" during linking:**
- Check file permissions on source files in `confs/`
- Ensure parent directories can be created in home directory

**Symlinks not working:**
- Verify source files exist in `confs/` directory
- Check `lib/links.yml` syntax with `yq eval '.' lib/links.yml`
- Run `make clean && make` to refresh all links

**Configuration not taking effect:**
- Remember symlinks point to repository files
- Changes to files in `confs/` are immediately active
- Restart affected applications (shell, vim, etc.) to pick up changes

## Manual Validation Scenarios

**After making changes, ALWAYS test:**

1. **Basic functionality test:**
   ```bash
   # Start fresh
   make clean && make
   
   # Verify key symlinks exist and point correctly
   file ~/.vimrc ~/.zshrc ~/.config/git/config
   ```

2. **Configuration integration test:**
   ```bash
   # Test vim loads configuration
   vim --version
   
   # Test git uses configuration
   git config --global --list | grep user.name
   
   # Test zsh configuration loads
   zsh -c 'echo $PATH' | grep -q brew || echo "Homebrew path not configured"
   ```

This is a lightweight, fast-executing system with no complex build processes or long-running commands. Total setup and validation time should be under 2 seconds.