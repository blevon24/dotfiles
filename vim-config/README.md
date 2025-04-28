# Task 1 - vim & Vundle
## Definitions
 - **.vimrc:** is the configuration file for the vim text editor program that can be used to customize vim to make editing files easier for the user.
 - **vim:** is a highly configurable text editor program built to make creating and changing any kind of text more efficient. 
 - **Vundle:** is a vim plugin manager that automatically manages the runtime path of installed scrips and regenerates help tags after installing and updating. Additionally, Vundle allows users to do the following:
   - Keep track of and configure plugins right in the `.vimrc` file
   - Install configured plugins (a.k.a. scripts/bundle)
   - Update configured plugins
   - Search by name all available Vim scripts
   - Clean unused plugins up
   - Run the above actions in a single keypress with interactive mode

## Plugins Used
 - **rigellute/rigel:** is a colorscheme plugin for vim, terminal, vscode, and slack that is based on the star Rigel.
 - **nathanaelkane/vim-indent-guides:** is a plugin that visually displays indent levels in code format 
 - **Syntastic:** is a syntax checking hacks plugin for vim.
 - **scrooloose/nerdtree:** is a tree explorer plugin for vim.
 - **mattn/emmet-vim:** is an emmet plugin for vim:http://emmet.io/.
 - **bling/vim-airline:** is a lean and mean status/tabline plugin for vim that's ligh as air.

## Script File Description
The Bash Script file `vimscript.sh` that automatically copies the `.vimrc` file in the vim-config directory of this dotfiles repository to the user's home directory, installs the Vundle plugin manager, and installs the vim setup configured in the `.vimrc` file.

How It Works:
 1. The script creates a copy of the `.vimrc` file from the vim-config directory of the dotfiles repo and moves the copy to the user's home directory while retaining the file name `.vimrc` using the command `cp "$file" "$outputFile"`. Variable definitions:
     - file="$HOME/dotfiles/vim-config/.vimrc"
     - tputFile="$HOME/.vimrc"
 2. The script checks if Vundle is not installed on the user's local system using the command `if ! [ -e "$VundleFile" ]; then` with the VundleFile variable defined as `VundleFile="$HOME/.vim/bundle/Vundle.vim"`.
     - If Vundle doesn't exist on the user's local system, the script installs Vundle using the command `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim` and then echos 'Vundle has just been installed'
     - If Vundle is already installed on the system, the script echos to the user 'Vundle is already installed on your system'
 3. Lastly, the script installs the vim setup per the `.vimrc` file's contents using the command `vim +PluginInstall +qall`

## References
 - Source: GitHub
   - Link: https://github.com/VundleVim/Vundle.vim
   - Used For: I used this website to define what Vundle is and its functions

 - Source: Vim
   - Link: https://www.vim.org/
   - Used For: I used this website to define what vim is

 - Source: albertwu.org
   - Link: http://albertwu.org/cs61a/notes/vimrc.html
   - Used For: I used this website to define what the .vimrc file is and what is can be used for

 - Source: VimAwesome
   - Link: https://vimawesome.com/
   - Used For: I used this website to find plugins to install and figure out what they do

 - Source: Sentry
   - Link: https://sentry.io/answers/determine-whether-a-file-exists-or-not-in-bash/
   - Used For: I used this website to figure out how to check if Vundle was already installed on my local system in WSL2 or not

