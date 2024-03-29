awk '(NR==8){exit} {print "\033[34m" "\033[1m" substr($0,2)}' $HOME/.zshrc

COLOR_OFF="\[\e[0m\]"
COLOR_RED="\[\e[1;31m\]"
COLOR_GREEN="\[\e[1;32m\]"
COLOR_PURPLE="\[\e[1;35m\]"

CHECK_MARK="$COLOR_GREEN\342\234\223"
UNCHECK_MARK="$COLOR_RED\342\234\227"

if [ "$PS1" != "" ]
then
	PS1="\n\$(if [[ \$? == 0 ]]; then echo '$CHECK_MARK'; else echo '$UNCHECK_MARK'; fi) $COLOR_PURPLE\u@$COLOR_PURPLE\h$COLOR_PURPLE $COLOR_GREEN\w ॐ ⇢ $COLOR_OFF"
	setenv ()  { export $1="$2"; }
	unsetenv ()  { unset $*; }
fi

export CLICOLOR=1
