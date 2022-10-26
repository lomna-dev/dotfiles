## PATH
if status --is-login
	source "/home/anmol/emsdk/emsdk_env.fish" # emscripten compiler
	set -x PATH $PATH $HOME/.cargo/bin # Rust
	set -x PATH $PATH /sbin
end


## Alias 
alias em="emacsclient -nw -c -a 'nvim'"

#If the shell is interactive run neofetch
if status --is-interactive
   awk '(NR==13){exit} {print "\033[34m" "\033[1m" substr($0,2)}' $HOME/.zshrc
end
