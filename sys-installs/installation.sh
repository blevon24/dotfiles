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
	echo -e "The software this program installs onto your system is called Singularity\n"
	echo -e "Singularity is a container platform that allows users to create and run containers that package up pieces of software in a way that is portable and reproducible. You can build a container using Singularity on your laptop, and then run it anywhere.\n"
	printf "Would you like to download this software onto you system? (y/n) "
	read -r confirm

	# Checks if software already exists on the terminal or if the name already exists and silently installs software
	if [[ $confirm == "y" || $confirm == "Y" ]]; then
		if dpkg -l | grep -qw singularity-container || command -v singularity-container &>/dev/null; then
			echo "A name conflict has occurred"
			echo "Either the Singularity software or name exists on your system"
			echo -e "Exiting program\n"
			exit

		else
			echo -e "No conflict of interest for installation process\n"

		fi

		wget -O- http://neuro.debian.net/lists/jammy.us-tn.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list

		sudo apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com 0xA5D32F012649A5A9

		sudo apt-get update -y

		sudo apt-get install -y singularity-container

	elif [[ $confirm == "n" || $confirm == "N" ]]
	then
		echo -e "Exiting program\n"
		exit

	else
		echo -e "Invalid input. Answer either needs to be 'y' or 'n'.\n"
		exit

	fi

	# Checks if software was properly installed
	if dpkg -l | grep -qw singularity-container || command -v singularity-container &>/dev/null; then
		echo "The installation process is completed"
		echo "Try the command `sudo singularity build --sandbox [container name] [filename]` to run the Singularity software"
		echo -e "Exiting program\n"
		loop=false
	else
		echo "There was an error in the installation process"
		echo -e "Exiting program\n"
		loop=false
	fi

done

exit
