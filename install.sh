mkdir $HOME/.config

# Awesome
mkdir $HOME/.config/awesome
mkdir $HOME/.config/awesome/custom-widget
ln -s $PWD/awesome/rc.lua $HOME/.config/awesome/rc.lua
ln -s $PWD/awesome/custom-widget/battery.lua $HOME/.config/awesome/custom-widget/battery.lua

# Emacs
mkdir $HOME/.emacs.d
cp $PWD/emacs/autogen-custom.el $HOME/.emacs.d/autogen-custom.el
ln -s $PWD/emacs/config.org $HOME/.emacs.d/config.org
ln -s $PWD/emacs/init.el $HOME/.emacs.d/init.el

# Fish
mkdir $HOME/.config/fish
mkdir $HOME/.config/fish/functions
ln -s $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -s $PWD/fish/fish_variables $HOME/.config/fish/fish_variables
ln -s $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
ln -s $PWD/fish/functions/fish_right_prompt.fish $HOME/.config/fish/functions/fish_right_prompt.fish

# Fonts
cp -r $PWD/fonts/VictorMono/VictorMono/ActuallyGoodOS $HOME/.local/share/fonts/
fc-cache

# Konsole
cp -r $PWD/konsole $HOME/.local/share
 
# Spacemacs
ln -s $PWD/spacemacs/.spacemacs $HOME/.spacemacs

# TMUX
mkdir $HOME/.config/tmux
ln -s $PWD/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

# URXVT
ln -s $PWD/urxvt/.Xdefaults $HOME/.Xdefaults

# ZSH
ln -s $PWD/zsh/.zshrc $HOME/.zshrc
ln -s $PWD/zsh/.zshenv $HOME/.zshenv 
