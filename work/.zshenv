# common settings
if [ -f ~/.zsh_common ] ; then
	. ~/.zsh_common
	. ~/.zsh_os_common
fi

# overridable
if [ -f ~/.zshrc ] ; then
	. ~/.zshrc
fi
