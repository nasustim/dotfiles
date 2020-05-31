# terminalcoloring
export LSCOLORS=cxfxcxdxbxegedabagacad

# buint-in apache
alias apache="sudo /usr/sbin/apachectl"

## local
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"
## vscode setting
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export MONO_GAC_PREFIX="/usr/local"

# common settings
if [ -f ~/.zsh_common ] ; then
	. ~/.zsh_common
fi