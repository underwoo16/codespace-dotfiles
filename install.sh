#!/bin/bash

create_symlinks() {
  # Get the directory in which this script lives.
  script_dir=$(dirname "$(readlink -f "$0")")

  # Get a list of all files in this directory that start with a dot.
  files=$(find -maxdepth 1 -type f -name ".*")

  # Create a symbolic link to each file in the home directory.
  for file in $files; do
      name=$(basename $file)
      echo "Creating symlink to $name in home directory."
      rm -rf ~/$name
      ln -s $script_dir/$name ~/$name
  done
  
  # the above loop only does files, manually symlink starship config
  ln -s $script_dir/.config/starship.toml ~/.config/starship.toml
}

create_symlinks

# install homebrew
eval $($HOMEBREW_PREFIX/bin/brew shellenv)

# git clone https://github.com/Homebrew/brew homebrew
# eval "$(homebrew/bin/brew shellenv)"
# brew update --force --quiet
# chmod -R go-w "$(brew --prefix)/share/zsh"

# install shell extensions
brew install starship
brew install zsh-syntax-highlighting
