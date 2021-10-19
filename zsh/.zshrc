## setup git-prompt
## ref: https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d#pencil-zshrc-%E3%81%AB%E8%A8%AD%E5%AE%9A%E8%BF%BD%E8%A8%98
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
## setup prompt
setopt prompt_subst
PROMPT='%F{green}[%n@%m%f %F{blue}%c%f$(__git_ps1 "(%s)")%F{green}]$%f '

# get .gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# terminal settings
export LSCOLORS=cxfxcxdxbxegedabagacad
## aliases
alias lla="ls -la"
alias ll="ls -l"
alias la="ls -a"
alias df="df -h"
alias rm="rm -i"
alias ls="ls -G"
alias grep="grep -G"
alias reload="source ~/.zshrc"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # call buint-in apache
  alias apache="sudo /usr/sbin/apachectl"

  ## Visual Studio Code
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
