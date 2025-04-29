#Task 4 - Polish & Documentation
## Description
This is my personal repository that customizes my local system's Linux environment. This repository contains all my customized dotfiles with scripts that automates the installation of my personal dotfiles and additional programs onto any user's Linux operating system.

## Repository's Contents
| Directories	| Directory's Files 	|
| :------------ | :-------------------- |
| vim-config	| - README.md
		  - vimscript.sh
		  - .vimrc
| homefiles	|
| sys-installs	|

 - README.md Files: contains information 
 - Dotfiles:
   - **.vimrc:** is the configuration file for vim that contains customized plugins for my local system
   - **.bashrc:** is 
 - Bash Script Files:
   - **vimscript.sh:** usage guide for the script is listed in the `vim-config` directory's README.md file.
   - **symlink.sh:** usage guide for the script is listed in the `homefiles` directory's README.md file.
   - **installation.sh:** usage guide for the script is listed in the `sys-installs` directory's README.md file.

## Repository & Dotfile Installation
### How to Git Clone the Repository
Use the command below to git clone with HTTPS:
```
git clone https://github.com/blevon24/dotfiles.git
```

Use the command below to git clone with SSH:
```
git clone git@github.com:blevon24/dotfiles.git
```

### How to Utilize the `.vimrc` File
To utilize my customized `.vimrc` file located within this repository follow the steps below:
 1. Ensure you've git cloned this repository to your local system.
 2. Visit the `vim-config` directory and read its README.md file to view the `.vimrc` customizations, such as plugins, and the usage guide for the `vimscript.sh` script file.
 3. Lastly, run the `vimscript.sh` file to create a copy of this repo's `.vimrc` file to your home directory, install Vundle, and automatically implement the `.vimrc` file's customizations.

### How to Utilize the `.bashrc` File
To utilize my customized `.bashrc` file located within this repository follow the steps below:
 1. Ensure you've git cloned this repository to your local system.
 2. Visit the `homefiles` directory and read its README.md file to view the `.bashrc` customizations, such as aliases, and the usage guide for the `symlink.sh` script file.
 3. Lastly, run the `symlink.sh` file to symbolically this repository's file to your home directory's `.bashrc` file to automatically add the files customizations to your system.

## Current Issues & Fixes
| Issues	| First Occured 	| Fixed?	| Implementation Date	|
| :------------ | :-------------------: | :-----------: | :-------------------: |
| 

## Future Goals/Improvements
 - Customize more dotfiles for linux such as: .bash_profile, .ssh/config, .gitconfig, .tmux.conf, & .gitignore
 - Create bash scripts to automatically install or symlink customized dotfiles from this repository
 - Add customized dotfiles to install on Windows operating systems such as: .\components.ps1, .\functions.ps1, and .\aliases.ps1

## Additionally Information about Dotfiles 
 - Source: freeCodeCamp
   - Link: https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/
   - Desc: An article explaining what dotfiles are, their importance, and how to create them on Mac and Linux operating systems.

 - Source: GitHub
   - Link: https://github.com/Lissy93/dotfiles
   - Desc: A GitHub repo containing general information about dotfiles and examples of an amazingly well developed repository of customized dotfiles.

 - Source: GitHub
   - Link: https://github.com/webpro/awesome-dotfiles/blob/master/README.md
   - Desc: A GitHub repo containing a curated list of dotfiles resources.

 - Source: GitHub
   - Link: https://github.com/jayharris/dotfiles-windows
   - Desc: A GitHub repo containing a collection of PowerShell dotfiles or customizable files for Windows operating systems

