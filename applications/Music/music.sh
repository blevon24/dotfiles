#!/bin/bash
loop=true

menu() {
  echo "Welcome to the Main Menu! Select an option."
  echo "1) cmus"
  echo "2) Help (displays this menu again)"
  echo "3) Quit (exits the program)"
}

initCheck() {
	if [ "$EUID" -ne 0 ]; then
		echo "To run this script you must be the root user or use sudo."
		echo -e "Exiting program\n"
		exit 0
	else
		echo -e "You are root!\n"

	fi
	
	# Check if the package manager apt is on the system
	if command -v apt &>/dev/null; then
		echo -e "The apt package manager is available on this system\n"
	
	else
		echo "The system doesn't have the apt package manager available"
		echo "This program requires the use of the apt package manager"
		echo -e "Exiting program\n"
		exit 0
	fi
}

while true; do
	# Checks if the user is root and has the apt package manager available before continuing with the program. If the user doesn't have either of those when running the program, the script exits the program.
	initCheck()
	
	# Displays the option menu for the user to decide which music packages they want installed and takes their choice/action and runs in through the case options.
	menu()
  read -p "Enter your choice [1-3]: \n" opt
  
  case "$opt" in
      1)
          sudo apt install cmus
          echo "Package installation completed!"
          ;;
      2)
          clear
          menu()
          ;;
      3)
          exit 0
          ;;
      *)
          echo "Invalid option. Try Again."
          ;;
  esac
done

  '''
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
'''

exit
