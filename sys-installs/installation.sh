#!/bin/bash
loop=true

while $loop; do
	# Check is user is root
	if [ "$EUID" -ne 0 ]; then
		echo "To run this script you must be the root user or use sudo."
		echo -e "Exiting program\n"
		exit
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
		exit
	fi

	# Provides installation information and prompts for confirmation
	echo -e "The software this program installs onto your system is called Anaconda\n"
	echo -e "Anaconda is an open-source distribution of the Python and R programming languages for data science that aims to simplify package management and deployment. Package versions in Anaconda are managed by the package management system, conda, which analyzes the current environment before executing an installation to avoid disrupting other frameworks and packages.\n"
	printf "Would you like to download this software onto you system? (y/n) "
	read -r confirm

	# Checks if software already exists on the terminal or if the name already exists and silently installs software
	if [[ $confirm == "y" || $confirm == "Y" ]]; then
		if dpkg -l | grep -qw anaconda || command -v conda &>/dev/null; then
			echo "A name conflict has occurred"
			echo "Either the Anaconda software or name exists on your system"
			echo -e "Exiting program\n"
			exit

		else
			echo -e "No conflict of interest for installation process\n"

		fi

		sudo apt-get update -y &>/dev/null

		cd /tmp | sudo apt-get install -y wget &>/dev/null

		wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh &>/dev/null

		sha256sum Anaconda3-2022.05-Linux-x86_64.sh &>/dev/null

		bash Anaconda3-2022.05-Linux-x86_64.sh

	elif [[ $confirm == "n" || $confirm == "N" ]]
	then
		echo -e "Exiting program\n"
		exit

	else
		echo -e "Invalid input. Answer either needs to be 'y' or 'n'.\n"
		exit

	fi

	# Checks if software was properly installed
	if dpkg -l | grep -qw anaconda || command -v conda &>/dev/null; then
		echo "The installation process is completed"
		echo "Try the command `source ~/.bashrc and conda info` to acctivate the added environment settings to test if the software runs"
		echo -e "Exiting program\n"
		loop=false
	else
		echo "There was an error in the installation process"
		echo -e "Exiting program\n"
		loop=false
	fi

done

exit
