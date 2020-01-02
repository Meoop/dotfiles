# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ..='cd ..'
alias c='clear'

alias la='ls -a'
alias lla='ls -al'

alias svim='sudo vim'

# kubectl aliases 
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias dnfu='sudo dnf update'
    alias dnfi='sudo dnf install'
    alias dnfg='sudo dnf upgrade'
    alias dnfr='sudo dnf remove'
    alias dnfc='sudo dnf clean all'
fi

