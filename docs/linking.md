# Linking Behavior

Non-obvious behaviors of `lib/link.sh`:

- `lib/link.sh` downloads `git-prompt.sh`, `git-completion.bash`, `_git` from github.com/git/git via curl on every run — requires network.
- `link.sh` auto-copies `config_alt.example` → `config_alt` if the latter is missing.
- `link.sh` symlinks both regular files and symlinks under `confs/` (enables the CLAUDE.md → AGENTS.md / copilot-instructions.md aliasing).
- If a destination exists as a non-symlink, `link.sh` warns and skips it — manual cleanup required.
