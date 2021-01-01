PWD = $(shell pwd)
CONF_PATH = ""

ifeq  ($(shell uname),Darwin)
	CONF_PATH = ${PWD}/macos
else
	CONF_PATH = ${PWD}/linux
endif

.PHONY: clean common private work
clean:
	unlink "${HOME}/.zlogin"
	unlink "${HOME}/.zlogout"
	unlink "${HOME}/.zsh_common"
	unlink "${HOME}/.zshrc"
	unlink "${HOME}/.vimrc"
	unlink "${HOME}/.tmux.conf"
	unlink "${HOME}/.gitignore_global"
	echo "clean conf files"

	echo "clean file for workspace"
	unlink "${HOME}/.zsh_os_common"

common:
	# vim
	ln -fsv "${PWD}/.vimrc" "${HOME}/.vimrc"
	# tmux
	ln -fsv "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
	# git
	ln -fsv "${PWD}/.gitignore_global" "${HOME}/.gitignore_global"

private:
	echo "OS: ${shell uname}"
	make common
	ln -fsv "${PWD}/.zlogin" "${HOME}/.zlogin"
	ln -fsv "${PWD}/.zsh_common" "${HOME}/.zsh_common"
	ln -fsv "${CONF_PATH}/.zshrc" "${HOME}/.zshrc"
	ln -fsv "${PWD}/.zlogout" "${HOME}/.zlogout"

work:
	echo "OS: ${shell uname}"
	make common
	ln -fsv "${PWD}/.zlogin" "${HOME}/.zlogin"
	ln -fsv "${PWD}/.zsh_common" "${HOME}/.zsh_common"
	ln -fsv "${CONF_PATH}/.zshrc" "${HOME}/.zsh_os_common"
	ln -fsv "${PWD}/work/.zshrc" "${HOME}/.zshrc"
	ln -fsv "${PWD}/.zlogout" "${HOME}/.zlogout"