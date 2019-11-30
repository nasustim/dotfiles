# init prompt
PROMPT="%F{green}[%n@%m%f %F{blue}%~%f%F{green}]$%f "

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
## Node.js
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
## Rust
export PATH="$PATH:$HOME/.cargo/bin"
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
## Golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
## TeX
export PATH="/Library/TeX/texbin:$PATH"
export BIBINPUTS="$BIBINPUTS:$HOME/Library/texmf/jbibtex/bib"
export BSTINPUTS="$BSTINPUTS:$HOME/Library/texmf/jbibtex/bst" 
### master thesis
export BIBINPUTS="$BIBINPUTS:$HOME/Documents/bib-master-thesis"
## Peripheral Interface Controller
export PATH="$PATH:/Applications/microchip/xc8/v1.44/bin"
## Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
## openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"