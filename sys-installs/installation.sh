#!/bin/bash
loop=true

while $loop; do
	# Check is user is root
	if [ "$EUID" -ne 0 ]; then
		echo "To run this script you must be the root user or use sudo."
		echo "Exiting program"
		exit
	#elif []
	#then
		#echo "hey"
	else
		#continue
		echo "you are root!"
		exit

	fi

	# Provides installation information and prompts for confirmation
	echo "hi"

	# Checks if software already exists on the terminal or if the name already exists

	# Silently installs software
	#TODO: install program
	#TODO: check program installed properly

done

exit
