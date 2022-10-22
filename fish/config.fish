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
	$HOME/Documents/pfetch/pfetch
end
