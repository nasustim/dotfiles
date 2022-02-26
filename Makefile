.PHONY: all vim tmux git zsh misc clean

PWD = $(shell pwd)

all: vim tmux git zsh misc

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

clean:
	unlink "${HOME}/.zshrc"
	unlink "${HOME}/.zshenv"
	unlink "${HOME}/.vimrc"
	unlink "${HOME}/.tmux.conf"
	unlink "${HOME}/.gitignore_global"
	unlink "${HOME}/.cargo/env"