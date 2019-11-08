# init prompt
export PS1="\[\e[0;32m\][\u@\h\[\e[0m\] \[\e[0;35m\]\w\[\e[0m\]\[\e[0;32m\]]\$\[\e[0m\] "

# applications prefix
alias vscode="open -a \"/Applications/Visual Studio Code.app\""

# terminal coloring
export LSCOLORS=cxfxcxdxbxegedabagacad

# for useful
alias lla="ls -la"
alias ll="ls -l"
alias la="ls -a"
alias df="df -h"
alias rm="rm -i"
alias ls="ls -G"
alias grep="grep -G"

# Buint-in Apache in Macintosh
alias apache="sudo /usr/sbin/apachectl"

# export PATHs to Development Environment
## local
export PATH="/usr/local/bin:$PATH"
## TeX
export PATH="/Library/TeX/texbin:$PATH"
## Node.js
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
## Rust
export PATH="$PATH:/Applications/microchip/xc8/v1.44/bin:$HOME/.cargo/bin"
## Golang
export GOPATH="/Users/mitsu/go"
export PATH="$PATH:$GOPATH/bin"

## TeX
export BIBINPUTS="$BIBINPUTS:$HOME/Library/texmf/jbibtex/bib"
export BSTINPUTS="$BSTINPUTS:$HOME/Library/texmf/jbibtex/bst" 
 
export BIBINPUTS="$BIBINPUTS:$HOME/Documents/bib-master-thesis"
