.PHONY: all vim tmux git zsh misc clean claude

PWD = $(shell pwd)

all: vim tmux git zsh misc claude

vim:
	sh src/vim/setup.sh

tmux:
	sh src/tmux/setup.sh

git:
	sh src/git/setup.sh

zsh:
	sh src/zsh/setup.sh

misc:
	sh src/misc/setup.sh

claude:
	sh src/claude/setup.sh

clean:
	unlink "${HOME}/.zshrc"
	unlink "${HOME}/.zshenv"
	unlink "${HOME}/.vimrc"
	unlink "${HOME}/.tmux.conf"
	unlink "${HOME}/.gitignore_global"
	unlink "${HOME}/.cargo/env"
	unlink "${HOME}/.claude/settings.json"
	unlink "${HOME}/.claude/CLAUDE.md"