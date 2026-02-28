## setup prompt stype
setopt prompt_subst

# カレントディレクトリ名を表示（git管理下で=を含む場合は=より前のみ）
function __prompt_dirname() {
  local dirname="${PWD##*/}"
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    if [[ "$dirname" == *"="* ]]; then
      echo "${dirname%%=*}"
    else
      echo "$dirname"
    fi
  else
    echo "$dirname"
  fi
}

PROMPT='%F{green}[%n@%m%f %F{blue}$(__prompt_dirname)%f%F{green}]%f$(__git_ps1 "(%s)") '

# terminal settings
export LSCOLORS=cxfxcxdxbxegedabagacad

## setup git-prompt
## ref: https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d#pencil-zshrc-%E3%81%AB%E8%A8%AD%E5%AE%9A%E8%BF%BD%E8%A8%98
if [ ! -d "$HOME/.zsh" ]; then
  mkdir -p "$HOME/.zsh"
fi
if [ ! -f "$HOME/.zsh/git-prompt.sh" ]; then
  curl -o "$HOME/.zsh/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
if [ ! -f "$HOME/.zsh/git-completion.bash" ]; then
  curl -o "$HOME/.zsh/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
if [ ! -f "$HOME/.zsh/_git" ]; then
  curl -o "$HOME/.zsh/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

## aliases
alias lla="ls -la"
alias ll="ls -l"
alias la="ls -a"
alias df="df -h"
alias rm="rm -i"
alias ls="ls -G"
alias grep="grep -G"
alias reload="source ~/.zshrc"

# git
if type "git" > /dev/null 2>&1; then
  alias "git-cp"="git cherry-pick"
fi

# mise
if type "mise" > /dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # call buint-in apache
  alias apache="sudo /usr/sbin/apachectl"

  # Visual Studio Code
  export PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # load zcompletion of homebrew packages
  fpath=(/usr/local/share/zsh/site-functions $fpath)
  autoload -U compinit
  compinit

  # open iOS Simulator
  alias ios="open -a Simulator"

  # homebrew
  alias "brew-bundle"="brew bundle dump --global --force"
  alias "brew-cleanup"="brew bundle cleanup --global --force"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# golang
if type "go" > /dev/null 2>&1; then
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin
fi

# nodejs
if type "node" > /dev/null 2>&1; then
  ### refer: https://zenn.dev/mizchi/articles/experimental-node-typescript
  ### ToDo: remove it when execute TypeScript feature become generally available
  alias nodets="node --experimental-strip-types --experimental-transform-types --experimental-detect-module --no-warnings=ExperimentalWarning"
fi

# ruby
if type "ruby" > /dev/null 2>&1; then
  export GEM_HOME=$HOME/.gem
  export PATH=$GEM_HOME/bin:$PATH
fi

# gloud
if type "gcloud" > /dev/null 2>&1; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# flutter (+ dart)
if type "flutter" > /dev/null 2>&1; then
  ## [Completion]
  ## Completion scripts setup. Remove the following line to uninstall
  [[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && . "$HOME/.dart-cli-completion/zsh-config.zsh" || true
  ## [/Completion]

  export PATH="$PATH":"$HOME/.pub-cache/bin"
fi

# java
if [ -d "/Applications/Android\ Studio.app/Contents/jbr/Contents/Home" ]; then
  export JAVA_HOME="/Applications/Android\ Studio.app/Contents/jbr/Contents/Home"
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi

# bun completions
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# .gitignore utility using GitHub API
# Usage:
#   gi <template>  # append file list to .gitignore with the specified template
#   gi             # list available templates
function gi() {
  template="$1"
  if [ -z "$template" ]; then
    gh api gitignore/templates --jq '.[]'
  else
    result="$(gh api "gitignore/templates/$template" --jq '.source')"
    if [ $? -ne 0 ]; then
      echo "Template '$template' not found."
      return 1
    fi
    echo "$result" >> .gitignore
  fi
}
