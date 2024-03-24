## Introduction

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

## A Fresh macOS Setup

These instructions are for setting up new Mac devices. Instead, if you want to get started building your own dotfiles, you can [find those instructions below](#your-own-dotfiles).

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. Setup an SSH key by using one of the two following methods  
   2.1. If you use 1Password, install it with the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally.  
   2.2. Otherwise [generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/jmwamser/mac-dotfiles/main/ssh.sh | sh -s "<your-email-address>"
   ```
3. Run the Fresh install script
   ```zsh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmwamser/mac-dotfiles/main/fresh.sh)"
   ```
4. Run the Install script to get going
   ```zsh
   HOMEBREW_ACCEPT_EULA=Y /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmwamser/mac-dotfiles/main/install/install.sh)"
   ```
5. Restart your computer to finalize the process
   
## Your Own Dotfiles

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macOS`](./.macOS) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./app-config/brew/Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://formulae.brew.sh/cask/) to check if the app you want to install is available.

Check out the [`aliases`](./sourced/aliases) file and add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory. You can adjust the [`.zshrc`](./.zshrc) file to your liking to tweak your Oh My Zsh setup. More info about how to customize Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization). 
