#!/bin/bash
bashrc="$HOME/dotfiles/homefiles/.bashrc"
bashAliases="$HOME/dotfiles/homefiles/.bash_aliases"
bashSymLink="$HOME/.bashrc"
aliasesSymLink="$HOME/.bash_aliases"
loop=true

while $loop; do
	# Prompts user if they want to symlink the .bashrc file in homefiles to the home directory and saves their answer as a variable
	printf "Do you want to symbolically link your .bashrc file in your dotfiles repository to your home directory? (y/n) "
	read -r confirm
	
	if [[ $confirm == "y" || $confirm == "Y" ]]; then
		linkCheck1=$(readlink -f "$bashSymLink")

		if [ -L ${bashSymLink} ]; then
			echo "'${bashSymLink}' is already symbolically linked to '${linkCheck1}'"
			echo -e "Exiting program\n"
			loop=false
		else
			echo "Symbolically linking your .bashrc files"
			ln -s -f ${bashrc} ${bashSymLink}
			echo "Symlink Completed"
			echo "NOTE: Don't forget to reload your shell environment by logging out and back in!"
			echo -e "Exiting program\n"
			loop=false
		fi

	elif [[ $confirm == "n" || $confirm == "N" ]]
	then
		# Prompts user if they want to symlink the .bash_aliases file in homefiles to the home directory and saves their answer as a variable
		printf "Do you want to symbolically link your .bash_aliases file in your dotfiles repository to your home directory? (y/n) "
		read -r confirm
				
		if [[ $confirm == "y" || $confirm == "Y" ]]; then
			# Checks if .bash_aliases exists in the user's home directory before proceeding with creating a symlink. This prevents the program from accidentally creating a broken or dangling symlink if the file its linked to does not exist. Also, the program creates the .bash_aliases file if it detects no file is found in the home directory. 
			if [ ! -f ${aliasesSymLink} ]; then
				echo "File does not exist in Bash"
				echo "Creating file now"

				touch ${aliasesSymLink}
				echo "Created .bash_aliases file"
				echo "Check it worked before starting program again"
				echo -e "Exiting program\n"
				loop=false
			else
				echo "File exists" 
				echo "Proceeding with symlink configuration"
				linkCheck2=$(readlink -f "$aliasesSymLink")

				if [ -L ${aliasesSymLink} ]; then
					echo "'${aliasesSymLink}' is already symbolically linked to '${linkCheck2}'"
					echo -e "Exiting program\n"
					loop=false
				else
					echo "Symbolically linking your .bashrc files"
					ln -s -f ${bashAliases} ${aliasesSymLink}
					echo "Symlink Completed"
					echo "NOTE: Don't forget to reload your shell environment by logging out and back in!"
					echo -e "Exiting program\n"
					loop=false
				fi
			fi
			
		elif [[ $confirm == "n" || $confirm == "N" ]]
		then
			echo -e "Exiting program\n"
			loop=false

		else
			echo -e "Invalid input. Answer either needs to be 'y' or 'n'.\n"

		fi
	else
		echo -e "Invalid input. Answer either needs to be 'y' or 'n'.\n"

	fi
done	

exit
