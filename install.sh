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

# Spacemacs
ln $PWD/spacemacs/.spacemacs $HOME/.spacemacs

# URXVT
ln $PWD/urxvt/.Xdefaults $HOME/.Xdefaults
