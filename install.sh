# Copy dotfiles to home dir
cp -r ./dotfiles ~/dotfiles

# Stow every dotfile
cd ~/dotfiles
stow *