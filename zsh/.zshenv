## execution priority
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
if type "anyenv" > /dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# any paths
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export GOPATH="$HOME/go"
## nodejs
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
## rust bunary
export PATH="$PATH:$HOME/.cargo/bin"
## golang binary
export PATH="$PATH:$GOPATH/bin"