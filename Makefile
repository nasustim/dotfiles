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
	unlink "${HOME}/.zsh_os_common"
	echo "clean conf files"

common:
	# vim
	ln -fsv "${PWD}/.vimrc" "${HOME}/.vimrc"

private:
	echo "OS: ${OS}"
	make common
	ln -fsv "${PWD}/.zshenv" "${HOME}/.zshenv"
	ln -fsv "${PWD}/.zsh_common" "${HOME}/.zsh_common"
	ln -fsv "${CONF_PATH}/.zshrc" "${HOME}/.zshrc"

work:
	echo "OS: ${OS}"
	make common
	ln -fsv "${PWD}/work/.zshenv" "${HOME}/.zshenv"
	ln -fsv "${PWD}/.zsh_common" "${HOME}/.zsh_common"
	ln -fsv "${CONF_PATH}/.zshrc" "${HOME}/.zsh_os_common"
	ln -fsv "${PWD}/work/.zshrc" "${HOME}/.zshrc"