# affect branch name & status
function current-branch() {
  local branch_name st branch_status

  branch_name=`git branch --show-current 2> /dev/null`
  if [[ "$branch_name" == "master" || "$branch_name" == "main" ]]; then
    branch_name="M"
  elif [[ "$branch_name" == "develop" ]]; then
    branch_name="D"
  fi

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status=":%K{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status=":%K{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status=":%K{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status=":%K{yellow}!"
  else
    branch_status=":%K{white}"
  fi

  echo "${branch_status}$branch_name%k"
}
setopt prompt_subst
#PROMPT='%F{green}[%n@%m%f %F{blue}%c%f$(current-branch)%F{green}]$%f '
PROMPT='%F{green}[%n@%m%f %F{blue}%c%f%F{green}]$%f '

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
