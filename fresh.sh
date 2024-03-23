#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  ## M# Chip Setup
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  ## Intel Setup
  # (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> $HOME/.zprofile
  # eval "$(/usr/local/bin/brew shellenv)"
fi

# Create a projects directories
mkdir $HOME/Projects

# Create Code subdirectories
mkdir $HOME/Projects/jwamser
mkdir $HOME/Projects/RedPandaCoding
