# Task 5 - Application/Package Installation
## Description
This is my personal repository that customizes my local system's Linux environment. This repository contains all my customized dotfiles with scripts that automate the installation of my personal dotfiles and additional programs onto any user's Linux operating system.

## Repository's Contents
| Directories	| Directory's Files 	|
| :------------ | :-------------------- |
| Browsers	| <ul><li>README.md</li><li>vimscript.sh</li><li>.vimrc</li> |
| Cybersecurity	| <ul><li>README.md</li><li>installation.sh</li> |
| Gaming Services	| <ul><li>README.md</li><li>symlink.sh</li><li>.bashrc</li><li>.bash_aliases</li> |
| Music	| <ul><li>README.md</li><li>installation.sh</li> |
| Programming	| <ul><li>README.md</li><li>installation.sh</li> |

 - **README.md Files:** contains information about the dotfiles themselves, added customizations, software used, how to run the bash scripts, and references.
 - **Dotfiles:**
   - *.vimrc:* is the configuration file for Vim that contains customized plugins for the Vim program on my local system.
   - *.bashrc:* is the configuration file for the Bash shell that contains regular and customized commands, functions, aliases, and scripts that execute every time a Bash session is started in Linux or macOS.
   - *.bash_aliases:* is the configuration file for alias commands that groups all of a user's aliases together in an readable format compared to .bashrc.
 - **Bash Script Files:**
   - *vimscript.sh:* Usage guide for the script is listed in the `vim-config` directory's README.md file.
   - *symlink.sh:* Usage guide for the script is listed in the `homefiles` directory's README.md file.
   - *installation.sh:* Usage guide for the script is listed in the `sys-installs` directory's README.md file.

# TODO (Change doc below to align with folder contents)
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
To utilize my customized `.vimrc` file located within this repository, follow the steps below:
 1. Ensure you've git cloned this repository to your local system.
 2. Visit the `vim-config` directory and read its README.md file to view the `.vimrc` customizations, such as plugins, and the usage guide for the `vimscript.sh` script file.
 3. Lastly, run the `vimscript.sh` file to create a copy of this repo's `.vimrc` file to your home directory, install Vundle, and automatically implement the `.vimrc` file's customizations.

### How to Utilize the `.bashrc` and `.bash_aliases` Files
To utilize my customized `.bashrc` file located within this repository, follow the steps below:
 1. Ensure you've git cloned this repository to your local system.
 2. Visit the `homefiles` directory and read its README.md file to view the `.bashrc` and `.bash_aliases` customizations, such as aliases, and the usage guide for the `symlink.sh` script file.
 3. Lastly, run the `symlink.sh` file to symbolically link this repository's files to your home directory's `.bashrc` and `.bash_aliases` files, automatically adding the files customizations to your system.

# BELOW HERE DON'T TOUCH

## References
 - Source: Ask Ubuntu
   - Link: https://askubuntu.com/questions/519/how-do-i-write-a-shell-script-to-install-a-list-of-applications
   - Used for: I used this website, to understand how to set the environment to report an error and exit itself without a function needing to be created. Additionally, I used this source to understand how to have bash script install a list of pre-requisistes/applications.

 - Source: Baeldung
   - Link: https://www.baeldung.com/linux/script-install-many-applications
   - Used for: I used this website, to understand how to install multiple applications in various ways like a text file
  
 - Source: 
   - Link: 
   - Used for:
