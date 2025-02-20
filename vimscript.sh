#!/bin/bash

file="$HOME/dotfiles/vim-config/.vimrc"
outputFile="$HOME/.vimrc"
VundleFile="$HOME/.vim/bundle/Vundle.vim"

#Creates a copy of the .vimrc file and moves the copy to the user's home directory with the file name .vimrc
cp "$file" "$outputFile"

#Checks if Vundle is installed or not and installs Vundle if it doesn't already exist
if ! [ -e "$VundleFile" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Vundle has just been installed"
else
	echo "Vundle is already installed on your system"
fi

#Installs vim setup per my .vimrc contents
vim +PluginInstall +qall

#Resources

	#Source: Sentry
		#Link: https://sentry.io/answers/determine-whether-a-file-exists-or-not-in-bash/
		#Used for: I used this website to figure out how to check if Vundle was already installed on my local system in WSL2 or not
