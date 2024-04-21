## setup prompt stype
setopt prompt_subst
PROMPT='%F{green}[%n@%m%f %F{blue}%c%f%F{green}]%f$(__git_ps1 "(%s)") '

# terminal settings
export LSCOLORS=cxfxcxdxbxegedabagacad

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

# get .gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

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

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
if type "anyenv" > /dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # call buint-in apache
  alias apache="sudo /usr/sbin/apachectl"

  # Visual Studio Code
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

# asdf
if type "asdf" > /dev/null 2>&1; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
  export ASDF_GOLANG_MOD_VERSION_ENABLED=true
  . ~/.asdf/plugins/java/set-java-home.zsh

  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin
fi

# mise
if type "mise" > /dev/null 2>&1; then
  eval "$(mise activate zsh)"
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi

# flutter
if [ -d "$HOME/.pub-cache/bin" ]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"
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

# dart
if type "dart" > /dev/null 2>&1; then
  ## [Completion]
  ## Completion scripts setup. Remove the following line to uninstall
  [[ -f /Users/mitsuhiro.hibino/.dart-cli-completion/zsh-config.zsh ]] && . /Users/mitsuhiro.hibino/.dart-cli-completion/zsh-config.zsh || true
  ## [/Completion]
fi
