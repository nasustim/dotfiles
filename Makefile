.PHONY: all vim tmux git zsh misc clean claude

PWD = $(shell pwd)

all: vim tmux git zsh misc claude

vim:
	sh vim/setup.sh

tmux:
	sh tmux/setup.sh

git:
	sh git/setup.sh

zsh:
	sh zsh/setup.sh

misc:
	sh misc/setup.sh

claude:
	sh claude/setup.sh

clean:
	unlink "${HOME}/.zshrc"
	unlink "${HOME}/.zshenv"
	unlink "${HOME}/.vimrc"
	unlink "${HOME}/.tmux.conf"
	unlink "${HOME}/.gitignore_global"
	unlink "${HOME}/.cargo/env"
	unlink "${HOME}/.config/claude/settings.json"
	unlink "${HOME}/.config/claude/CLAUDE.md"