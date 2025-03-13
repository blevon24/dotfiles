#!/bin/bash
targetFile="$HOME/dotfiles/homefiles/.bashrc"
symlink="$HOME/.bashrc"
loop=true

while $loop; do
	# Prompts user if they want to symlink the .bashrc file in homefiles to the home directory and saves their answer as a variable
	printf "Do you want to symbolically link your .bashrc file in your dotfiles repository to your home directory? (y/n) "
	read -r confirm
	
	if [[ $confirm == "y" || $confirm == "Y" ]]; then
		linkCheck=$(readlink -f "$targetFile")

		if [ -L ${symlink} ]; then
			echo "'${symlink}' is already symbolically linked to '${linkCheck}'"
			echo -e "Exiting program\n"
			loop=false
		else
			echo "Symbolically linking your .bashrc files"
			ln -s [$targetFile] [$symlink]
			echo "Symlink Completed"
			echo "NOTE!! Don't forget to reload your shell environment by logging out and back in!"
			echo -e "Exiting program\n"
			loop=false
		fi

	elif [[ $confirm == "n" || $confirm == "N" ]]
	then
		echo -e "Exiting program\n"
		loop=false

	else
		echo -e "Invalid input. Answer either needs to be 'y' or 'n'.\n"

	fi
done	

exit
