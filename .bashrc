#format prompt
export PS1="\[\e[0;32m\][\u@\h\[\e[0m\] \[\e[0;35m\]\w\[\e[0m\]\[\e[0;32m\]]\$\[\e[0m\] "

#applications
alias vscode="open -a \"/Applications/Visual Studio Code.app\""
alias sublime="open -a \"/Applications/Sublime Text.app\""
alias atom="open -a \"/Applications/Atom.app\""

#coloring
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls="ls -G"
alias grep="grep -G"

#useful
alias lla="ls -la"
alias ll="ls -l"
alias la="ls -a"
alias df="df -h"
alias rm="rm -i"

alias gca="git checkout"
alias gcm="git commit -am"
alias gpo="git push origin"
alias gmg="git merge"
alias gpl="git pull"

alias apache="sudo /usr/sbin/apachectl"

export PATH="/Library/TeX/texbin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

export PATH="$PATH:/Applications/microchip/xc8/v1.44/bin:$HOME/.cargo/bin"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
