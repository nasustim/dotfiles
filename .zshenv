# common settings
if [ -f ~/.zsh_os_common ] ; then
	. ~/.zsh_os_common
fi
# common settings
if [ -f ~/.zsh_common ] ; then
	. ~/.zsh_common
fi

# overridable
if [ -f ~/.zshrc ] ; then
	. ~/.zshrc
fi
