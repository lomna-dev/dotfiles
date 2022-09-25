mkdir $HOME/.config

# Awesome
mkdir $HOME/.config/awesome
mkdir $HOME/.config/awesome/custom-widget
ln $PWD/awesome/rc.lua $HOME/.config/awesome/rc.lua
ln $PWD/awesome/custom-widget/battery.lua $HOME/.config/awesome/custom-widget/battery.lua

# Fish
mkdir $HOME/.config/fish
mkdir $HOME/.config/fish/functions
ln $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln $PWD/fish/fish_variables $HOME/.config/fish/fish_variables
ln $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
ln $PWD/fish/functions/fish_right_prompt.fish $HOME/.config/fish/functions/fish_right_prompt.fish

# Konsole
cp -r $PWD/konsole $HOME/.local/share
 
# Spacemacs
ln $PWD/spacemacs/.spacemacs $HOME/.spacemacs

#TMUX
mkdir $HOME/.config/tmux
ln $PWD/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

# URXVT
ln $PWD/urxvt/.Xdefaults $HOME/.Xdefaults
