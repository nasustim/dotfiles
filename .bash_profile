if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"