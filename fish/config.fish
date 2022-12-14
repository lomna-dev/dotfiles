## PATH
if status --is-login
   source "/home/anmol/emsdk/emsdk_env.fish" # emscripten compiler
   source $HOME/.cargo/env > /dev/null 2>&1 # Rust
end


## Alias 
alias em="emacsclient -nw -c -a 'nvim'"

#If the shell is interactive run neofetch
if status --is-interactive
   awk '(NR==8){exit} {print "\033[34m" "\033[1m" substr($0,2)}' $HOME/.zshrc
end
