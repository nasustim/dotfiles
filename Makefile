.PHONY: all vim tmux git zsh clean

PWD = $(shell pwd)

all: vim tmux git zsh

vim:
	ln -fsv "${PWD}/vim/.vimrc" "${HOME}/.vimrc"

tmux:
	ln -fsv "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

git:
	ln -fsv "${PWD}/git/.gitignore_global" "${HOME}/.gitignore_global"

zsh:
	ln -fsv "${PWD}/zsh/.zshenv" "${HOME}/.zshenv"
	ln -fsv "${PWD}/zsh/.zshrc" "${HOME}/.zshrc"

clean:
	unlink "${HOME}/.zshrc"
	unlink "${HOME}/.zshenv"
	unlink "${HOME}/.vimrc"
	unlink "${HOME}/.tmux.conf"
	unlink "${HOME}/.gitignore_global"