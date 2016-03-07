# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 # limit to 1 error
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/petr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
# ===== Completion 
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt complete_in_word # Allow completion from within a word/phrase

unsetopt menu_complete # do not autoselect the first completion entry

# ===== Correction
setopt correct # spelling correction for commands
#setopt correctall # spelling correction for arguments
bindkey -e
# End of lines configured by zsh-newuser-install

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
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line
#bindkey "\e[3~" delete-char

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

alias vi='vimx'
alias vim='vimx'
alias la='ls -al'
alias ls='ls --color=auto'
alias ..="cd .."

export PATH=$PATH:/home/petr/bin

setopt autopushd

# Set some environment variables
LC_TIME=cs_CZ.utf8
LC_MEASUREMENT=cs_CZ.utf8
LC_PAPER=cs_CZ.utf8

source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/Documents/source/zsh-autosuggestions/autosuggestions.zsh
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
#
#
#source ~/Documents/source/zsh-history-substring-search/zsh-history-substring-search.zsh

