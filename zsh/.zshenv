## prioritize /usr/local
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

# any paths
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export GOPATH="$HOME/go"
## nodejs
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
## rust bunary
export PATH="$PATH:$HOME/.cargo/bin"
## golang binary
export PATH="$PATH:$GOPATH/bin"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"  # priorize *env runtime then system version
eval "$(anyenv init -)"