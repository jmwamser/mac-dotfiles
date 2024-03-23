#!/bin/sh

echo "Setting up your Mac..."

# # Check for Oh My Zsh and install if we don't have it
# if test ! $(which omz); then
#   /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
# fi

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
