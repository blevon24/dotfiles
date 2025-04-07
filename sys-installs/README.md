# Task 3 - install packages
## Package Descriptions
Anaconda is an open-source distribution of the Python and R programming languages for data science that aims to simplify package management and deployment. The package versions in Anaconda are managed by the package management system, conda, which analyzes the current environment before executing an installation to avoid disrupting other frameworks and packages.

The software comes with over 250 packages automatically installed and 7500 additional open-source packages that can be installed by the user from PyPI as well as the conda package and virtual environment manager.

Anaconda installation process is easy for beginners to set up but is also lengthy and takes a lot of space since over one thousand packages need to be preinstalled.

How to Install Anaconda:
 1.  Download and Install Anaconda's script using the below commands in the order as follows:
     - `sudo apt-get update` - Refreshes the 'apt' command to synchronize all repos
     - `cd /tmp` - Changes directories to the 'tmp' directory
     - `sudo apt-get install wget` - Used if wget is not already installed on you system and is needed to download the Anaconda installer
     - `wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh` - Downloads the Anaconda installer
     - `sha256sum Anaconda3-2022.05-Linux-x86_64.sh` - Verifies the hash code integrity of the package
     - `bash Anaconda3-2022.05-Linux-x86_64.sh` - Runs the Anaconda bash shell script
 2. Choose Installation Directory by:
     - First, type the directory you want to install the Anaconda software on your system when prompted after running the bash shell script. The default location is the user's HOME directory and it is recommended to have the software installed in this location
     - Next, type 'yes' when prompted with the yes or no question after the installer successfully completes the installation process and then click Enter
 3. Test the Connection using the commands below in the order as follows:
     - `source ~/.bashrc` - Used to activate the added environment settings
     - `conda info` - Tests the software connection
 4. Updating Anaconda (Optional) by using the commands listed below in order as follows:
     - `conda update conda` - Updates the 'conda' package manager
     - `conda update anaconda` - Updates the actual Anaconda distribution
 5. Uninstalling Anaconda (Optional) by using the commands listed below in order as follows:
     - `conda install anaconda-clean` - Uninstalls Anaconda by installing a cleaning package
     - `anaconda-clean` - Runs the package, which removes all Anaconda related files and directories from a user's system 

## Script File Description
The Bash Script file `installation.sh` automatically and silently installs the Anaconda software onto the Linux system of the user who ran the script file.

How It Works:
 1. The script checks the EUID of the user to verify the if the user is not the root user or not running the sudo command with the bash script in the command line using the command `"$EUID" -ne 0` 
     - If the user isn't root or running sudo, the script prints out to the user "To run this script you must be the root user or use sudo" and then exits the program
     - If the user is root or running with sudo, the script prints out "You are root!" and continues running
 2. The script checks if the package manager 'apt' is on the user's system using the command `command -v apt &>/dev/null`
     - If the apt package manager is available on the system the script prints out "The apt package manager is available on this system" and continues running
     - If the apt package manager is not available on the system the script prints out to the user "The system doesn't have the apt package manager available. This program requires the use of the apt package manager." and then exits the program.
 3. The script prints out to the user what software the script program installs, what is does, and confirms in a yes or no question if the user would like to download the software onto their system.
     - If the user types 'y' or 'Y', the script checks if the Anaconda name or software is already installed on the system using the command `dpkg -l | grep -qw anaconda || command -v conda &>/dev/null`
         - If the software is already installed the script prints out "A name conflict has occurred. Either the Anaconda software or name exists on your system already" and then exits the program
         - If the software or name doesn't exist on the system the script prints out "No conflict of interest for installation process" and then silently installs the software onto the system
     - If the user types 'n' or 'N', the script prints out "Exiting program" and then exits the program
     - If the user types neither of the two options above, the script prints out "Invalid input. Answer either needs to be 'y' or 'n'" and then exits the program
 4. Lastly, the program checks if the software was properly installed using the command `dpkg -l | grep -qw anaconda || command -v conda &>/dev/null` to see if the software or software name is located on the current system
     - If the software or name is on the system the script prints out "The installation process is completed. Try the command `source ~/.bashrc and conda info` to activate the added environment settings to test if the software runs" and then exits the program
     - If the software isn't located/properly installed on the system then the script prints out "There was an error in the installation process" and exits the program   

## References
 - Source: Stack Overflow
   - Link: https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
   - Used for: I used this website to figure out how to check if the shell program is run by the root user or sudo.

 - Source: ChatGPT
   - Link: https://chatgpt.com/
   - Prompt: How to in bash script check if the user's EUID is running as root
   - Prompt: How to in bach script check if the system package manager apt is available on the linux system
   - Prompt: How to in bash script check if the Anaconda software or name is already installed on a Linus system
   - Used for: I used this website to figure out what commands I need to use to find if the user running the script is the root user or using sudo, if the packafe manager apt is on the system, and if the Anaconda software or name is already on the system. 

 - Source: Hostinger
   - Link: https://www.hostinger.com/tutorials/how-to-install-anaconda-on-ubuntu/
   - Used for: I used this website to figure out how to install, run, test the connection, update, and uninstall the Anaconda software on a system.

 - Source: Domino Data Lab
   - Link: https://domino.ai/data-science-dictionary/anaconda
   - Used for: I used this website to define what the Anaconda software is and does.

 - Source:
   - Link:
   - Used for: 

