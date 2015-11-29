# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Aliases
alias vi='vimx'
alias vim='vimx'
alias la='ls -al'

#export PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;31m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
export PS1="\[\e[00;32m\]\u\[\e[00;31m\]@\[\e[00;36m\]\h\[\e[00;37m\]:\[\e[00;33m\]\w\[\e[00;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\e[00;32m\]\\$\"; else echo \"\[\e[00;31m\]\\$\"; fi) \[\e[0m\]"

# JAVA
export JAVA_HOME="/usr/java/latest"
export JRE_HOME="/usr/java/latest"

# sets tty console to proper UTF-8 formating
if [[ $TERM = "linux" ]]; then
    unicode_start
fi
