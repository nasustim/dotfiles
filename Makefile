.PHONY: all vim tmux git zsh misc clean claude

PWD = $(shell pwd)

all: vim tmux git zsh misc claude

vim:
	cd $(PWD) && . lib/link_utils.sh && setup_module vim

tmux:
	cd $(PWD) && . lib/link_utils.sh && setup_module tmux

git:
	cd $(PWD) && . lib/link_utils.sh && setup_module git

zsh:
	cd $(PWD) && . lib/link_utils.sh && setup_module zsh

misc:
	cd $(PWD) && . lib/link_utils.sh && setup_module misc

claude:
	cd $(PWD) && . lib/link_utils.sh && setup_module claude

clean:
	sh lib/clean.sh