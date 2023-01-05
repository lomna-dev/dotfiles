source $HOME/emsdk/emsdk_env.sh > /dev/null 2>&1 # Emscripten
source $HOME/.cargo/env > /dev/null 2>&1 # Rust
export PATH=$PATH:/sbin # For some reason /sbin is many times not included in PATH
