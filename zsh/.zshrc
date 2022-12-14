#       (((( 
#          )))) 
#       _ .---. 
#      ( |`---'| 
#       \|     | 
#       : .___, : 
#        `-----'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anmol/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# If is login shell
if [[ -o login ]]; then
    echo "Welcome"
fi

# Aliases
alias em="emacsclient -nw -c -a 'nvim'"
alias ls="ls --color=auto"

# If is interactive
if [[ -o interactive ]]; then
    awk '(NR==8){exit} {print "\033[34m" "\033[1m" substr($0,2)}' $HOME/.zshrc
    PS1="%B%n@%m%k %F{cyan}%(4~|...|)%3~%F{white} ζ %b"
fi

export CLICOLOR=1

# Syntax Highlighting, Source this at the end of file
source $HOME/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
