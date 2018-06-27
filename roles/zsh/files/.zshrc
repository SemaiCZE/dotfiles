# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _expand _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 # limit to 1 error
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

#autoload -Uz compinit
autoload -U +X compinit
autoload -U +X bashcompinit
compinit
bashcompinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_ignore_all_dups # Do not write events to history that are duplicates of previous events
# ===== Completion 
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt complete_in_word # Allow completion from within a word/phrase

setopt auto_cd
setopt mark_dirs

unsetopt menu_complete # do not autoselect the first completion entry

setopt extended_history
setopt hist_ignore_space
setopt hist_verify
setopt interactivecomments
#setopt share_history

# ===== Correction
setopt correct # spelling correction for commands
#setopt correctall # spelling correction for arguments
bindkey -e
# End of lines configured by zsh-newuser-install

# man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%b%F{yellow}%m%u%c%f"
zstyle ':vcs_info:git*' actionformats "%b%F{yellow}%m%u%c(%a)%f"
#PROMPT="%(!.%F{red}.%F{green})%n%F{red}@%F{cyan}%m%f:%F{yellow}%2~%F{green}%(?..%F{red})%#%f "
PROMPT="%(!.%F{red}.%F{green})%n%F{red}@%F{cyan}%m%f:%F{yellow}%(4~.<</%2~.%~)%F{green}%(?..%F{red})%#%f "
#PROMPT="%(!.%F{red}.%F{green})%n%F{red}@%F{cyan}%m%f:%F{yellow}%40<\<\<<%~%F{green}%(?..%F{red})%#%f "
RPROMPT='%F{cyan}${vcs_info_msg_0_}%f %* %F{green}%(?..%F{red})%?%f'

case "${TERM}" in
  cons25*|linux) # plain BSD/Linux console
    bindkey '\e[H'    beginning-of-line   # home
    bindkey '\e[F'    end-of-line         # end
    bindkey '\e[5~'   delete-char         # delete
    bindkey '[D'      emacs-backward-word # esc left
    bindkey '[C'      emacs-forward-word  # esc right
    ;;
  *rxvt*) # rxvt derivatives
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    # workaround for screen + urxvt
    bindkey '\e[7~'   beginning-of-line   # home
    bindkey '\e[8~'   end-of-line         # end
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    ;;
  *xterm*) # xterm derivatives
    bindkey '\e[H'    beginning-of-line   # home
    bindkey '\e[F'    end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\e[1;5C' forward-word        # ctrl right
    bindkey '\e[1;5D' backward-word       # ctrl left
    # workaround for screen + xterm
    bindkey '\e[1~'   beginning-of-line   # home
    bindkey '\e[4~'   end-of-line         # end
    ;;
  screen)
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    bindkey '^[[1;5C' forward-word        # ctrl right
    bindkey '^[[1;5D' backward-word       # ctrl left
    ;;
esac

#bindkey '\e[1~'   beginning-of-line  # Linux console
#bindkey '\e[H'    beginning-of-line  # xterm
#bindkey '\eOH'    beginning-of-line  # gnome-terminal
#bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
#bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
#bindkey '\e[4~'   end-of-line        # Linux console
#bindkey '\e[F'    end-of-line        # xterm
#bindkey '\eOF'    end-of-line        # gnome-terminal
#bindkey '\e[5C'   forward-word
#bindkey '\e[5D'   backward-word
#bindkey '\e[1;5C' forward-word
#bindkey '\e[1;5D' backward-word
#bindkey '\e\e[C'  forward-word
#bindkey '\e\e[D'  backward-word

alias vi='vim'
alias vim='vim'
alias la='ls -al'
alias ls='ls --color=auto'
alias ssr='ssh -l root'
alias logs='sudo journalctl -e'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#alias mc='mc --nosubshell'
alias srcgrep='grep -inIEr --color=ALWAYS'

# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Create a directory and change into it
mkcd() {
	mkdir -p "$@"
	cd "$@"
}

# systemlevel
start() { sudo systemctl start "$1"; }
stop() { sudo systemctl stop "$1"; }
restart() { sudo systemctl restart "$1"; }
status() { sudo systemctl status "$1"; }
enabled() { sudo systemctl enable "$1"; listd; }
disabled() { sudo systemctl disable "$1"; listd; }

Start() { sudo systemctl start "$1"; sudo systemctl status "$1"; }
Stop() { sudo systemctl stop "$1"; sudo systemctl status "$1"; }
Restart() { sudo systemctl restart "$1"; sudo systemctl status "$1"; }


if [[ $+MC_SID = 1 ]] ; then
	# inside Midnight Commander? Just give us a basic prompt
	#PROMPT=">%(#/#/) "
	RPROMPT=""
fi

export PATH=$PATH:/home/petr/bin
export SAL_USE_VCLPLUGIN=gtk
export RES_OPTIONS=edns0
#export SUDO_PROMPT=$'\e[31mSUDO\e[m password for \e[34m%p\e[m: '

setopt autopushd

# Set some environment variables
LC_TIME=cs_CZ.utf8
LC_MEASUREMENT=cs_CZ.utf8
LC_PAPER=cs_CZ.utf8

# Android stuff
export USE_CCACHE=1
export WITH_SU=true

# ZSH extensions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# bind ctrl+space to accept current suggestion
#bindkey '^ ' autosuggest-accept
bindkey '^ ' autosuggest-execute

#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
#
#
source ~/.zshrc.local

