#!/bin/bash
## sets the system and shell environment to fail on error, report it, and exit
set -eu -o pipefail

# Lists the paths to all the scripts that the master script will execute
pathToBashrc="$HOME/dotfiles/homefiles"    
pathToVim="$HOME/dotfiles/vim-config"
pathToAnaconda="$HOME/dotfiles/install"
pathToMusic="$HOME/dotfiles/applications/Music Services"
pathToProgramming="$HOME/dotfiles/applications/Programming"
pathTo

# Lists the commands to run all the bash scripts
bashrcCommand="./symlink.sh"          # Must be ran last
vimCommand="./vim-config.sh"
anacondaCommand="./installation.sh"
musicCommand="music.sh"

# Runs all the scripts in the background using an ampersand (&)
(cd $pathToVim; $vimCommand) &
(cd $pathToAnaconda; $anacondaCommand) &

# TODO: add the rest of the scripts when completed




(cd $pathToBashrc; $bashrcCommand) &
