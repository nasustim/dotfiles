export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$PATH"

# any paths
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export GOPATH="$HOME/go"
## nodejs
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
## rust binary
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
## golang binary
export PATH="$PATH:$GOPATH/bin"
