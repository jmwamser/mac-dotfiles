#!/usr/bin/env zsh

export DIR=${0:a:h}

if ! command -v git >/dev/null 2>&1; then
    echo "Error: git is required."
    exit 1
fi

#echo "Setting up:"
echo "*************************************"
echo " _____        _    __ _ _            "
echo "|  __ \      | |  / _(_) |           "
echo "| |  | | ___ | |_| |_ _| | ___  ___  "
echo "| |  | |/ _ \| __|  _| | |/ _ \/ __| "
echo "| |__| | (_) | |_| | | | |  __/\__ \ "
echo "|_____/ \___/ \__|_| |_|_|\___||___/ "
echo "*************************************"

# Path to your dotfiles repository
DOTFILES_REPO="$HOME/.dotfiles"

# Ensure the dotfiles repo is cloned
if [ ! -d "$DOTFILES_REPO" ]; then
    echo "Cloning dotfiles..."
    git clone git@github.com:jmwamser/mac-dotfiles.git "$DOTFILES_REPO"
fi

# Set execute permissions on all files in the bin directory
echo "Setting execute permissions on bin files..."
chmod +x "$DOTFILES_REPO/bin"/*

# Get current date and time in YYYYMMDD-HHMMSS format
datetime=$(date "+%Y%m%d-%H%M%S")

# Set up symlink in home directory
echo "Setting up main symlink"
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Backing up old .zshrc..."
    # Create a backup of .gitconfig with the datetime stamp
    mv "$HOME/.zshrc" "$HOME/.zshrc.bk.$datetime"
fi
ln -snf "$DOTFILES_REPO/zshrc.local" "$HOME/.zshrc"

# symlink the global Git config
echo "Setting up global Git config..."
if [ ! -f "$HOME/.gitconfig" ]; then
    echo "Backing up old Git config..."
    # Create a backup of .gitconfig with the datetime stamp
    mv "$HOME/.gitconfig" "$HOME/.gitconfig.bk.$datetime"
fi
ln -snf "$DOTFILES_REPO/app-config/git/.gitconfig" "$HOME/.gitconfig"

# Copy the global Git ignore
echo "Setting up global Git ignore..."
if [ ! -f "$HOME/.gitignore_global" ]; then
    echo "Backing up old .gitignore_global..."
    # Create a backup of .gitconfig with the datetime stamp
    mv "$HOME/.gitignore_global" "$HOME/.gitignore_global.bk.$datetime"
fi
ln -snf "$DOTFILES_REPO/app-config/git/.gitignore_global" "$HOME/.gitignore_global"
git config --global core.excludesfile "$HOME/.gitignore_global"

echo "Git setup complete!"

# Installing fonts
#echo "Installing fonts"
#cp -a $HOME/dotfiles/install/assets/fonts/. ~/Library/Fonts/

# Update Source
echo "Sourcing ZSHRC"
source "$HOME/.zshrc"

# Update Homebrew recipes
echo "Updating Brew"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Loading Brewfile"
brew tap homebrew/bundle
brew bundle --file $DOTFILES_REPO/app-config/brew/Brewfile
