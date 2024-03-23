#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$('$(brew --prefix)'/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$($(brew --prefix)/bin/brew shellenv)"
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Create a projects directories
mkdir $HOME/Projects

# Create Code subdirectories
mkdir $HOME/Projects/jwamser
mkdir $HOME/Projects/RedPandaCoding
