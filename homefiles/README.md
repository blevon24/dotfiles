# dotfiles Task 2 - bashrc & bash_aliases
## Term Definitions
 - **.bashrc:** is a shell script file that executes every time a new Bash session is initiated/user logs onto the system's terminal. Is used to set up the user's shell environment according to their preferences by allowing them to define aliases, functions, environment variables, and executing commands within the .bashrc file.
 - **.bash_aliases:** is a text file that groups all your aliases together in a easy to read format rather than adding them into .bashrc along with its other parameters. In other words, makes it easier for users to manage their aliases.
 - **Alias:** is a user-defined shortcut for a longer command or sequence of commands. Instructs the shell to replace one string with another string while executing the commands.
 - **Symbolic Link:** is a file that stores a path to an existing file or directory on any local or external volume.

## How to create aliases
There are two methods to create aliases, which are listed below. I used the first method on this assignment.

 1. Edit `.bashrc` file directly
     1. Change directories to the home directory where the `.bashrc` file is located using this command `cd ~`
     2. Open the file for editing to add aliases to using this command `vim .bashrc`
     3. Reload or reboot the system using either of the methods below:
         - Exit the host/local system and log back in
         - Use the command `. ~/.bashrc`

 2. Create a Separate Aliases File
     1. Open the `.bashrc` file for editing using the two commands below:
         - `cd ~`- Changes directories to home directory
         - `vim .bashrc`- Opens the `.bashrc` file for editing
     2. Copy and paste the text below into the `.bashrc` file if it doesn't already exist in the file, then save and exit the file
          ```
          if [ -f ~/.bash_aliases ]; then
            . ~/.bash_aliases
          fi
          ```
     3. Create the `.bash_aliases` file by using this command: `touch .bash_aliases`
     4. Open the file for editing to add aliases to using this command `vim .bash_aliases`, then save and exit the file
     5. Reload or reboot the system using either of the methods below:
         - Exit the host/local system and log back in
         - Use the command `. ~/.bashrc`
 
## Aliases Guide
Lists the aliases I added to the `.bashrc` and `.bash_aliases` files in my AWS host system and what they do

Aliases Created:
 - `alias today='date +"%m-%d-%Y"'`- Shows the current day's month, date, and year
 - `alias path='echo -e ${PATH//:/\\n}'`- Neatly lists all the directories within the PATH variable that the shell searches through for executable files
 - `alias root='sudo -i'`- Switches the current user to root
 - `alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"`- Shows a repositories log data, such as a commit's ID and message, how long ago a commit was made, and the user how made the commit, neatly displayed in a list/graph format
 - `alias web='cd /var/www/html'`- Changes directories to the /var/www/html directory where website files are stored
 - `alias reboot='sudo shutdown -r now'`- Safely reboots the system the user is on
 - `alias update='sudo apt update && sudo apt upgrade'`- Downloads/updates package information from all configured sources & upgrades packages currently installed to their newest versions
 - `alias l.='ls -d .* --color=auto'` - Displays and highlights hidden files within the current directory
 - `alias ..='cd ..'` - Moves to the parent directory of the current directory
 - `alias ...='cd ../../../'` - Moves up three directories of the current directory
 - `alias ....='cd ../../../../'` - Moves up four directories of the current directory
 - `alias .....='cd ../../../../..'` - Moves up five directories of the current directory
 - `alias diff='colordiff'` - Colorizes the diff output when you compare files using diff
 - `alias h='history'` - Displays the users command-line history
 - `alias psmem='ps auxf | sort -nr -k 4'` - Displays the processes running that are eating up memory
 - `alias pscpu='ps auxf | sort -nr -k 3'` - Displays the processes running that are eating the CPU
 - `alias cpuinfo='lscpu'` - Displays the CPU architecture info
 - `alias rm='rm -r'` - Allows the user to remove files/directories recursively and doesn't prevent the user from removing a file/directory
 - `alias mv='mv -i'` - Prompts for confirmation to move a file
 - `alias cp='cp -r'` - Allows the user to copy a file/directory recursively and doesn't prevent the user from copying a file/directory
 - `alias ln='ln -i'` - Prompts for confirmation to create a link between files
 - `alias weather='curl wttr.in/cleveland'` - Shows the current weather in Cleveland (can change the city to another location)
 - `alias define='sdcv' - Displays the definition of a word when command is followed by a word
 - `alias wifipass='nmcli dev wifi show-password'` - Outputs the wifi password for the network the device is on and displays a QR code of the password
 - `alias ddg='w3m lite.duckduckgo.com'` - Displays the light version of DuckDuckGo in the terminal for quick web searches
 - `alias itch.in='flatpak run io.itch.itch'`- Runs Itch.io application via Flatpak

## Script File Description
The Bash Script file `symlink.sh` automatically creates symlinks between the *.bashrc* and *.bash_aliases* files in this Git repo folder and their counterpart files in the user's home directory. 

Full Description:
 - In other words, this script symlinks the two dotfiles here, *.bashrc* & *.bash_aliases*, to their counterpart dotfiles in the user's home directory. This makes it easier for the user to manage their aliases by allowing changes to be automatically applied by just editing the two dotfiles within this folder once this repo is git cloned onto the user's local system and the symlink.sh script is ran. However, if you are not the owner of this git repo then I'd recommend you copy this GitHub repo and make your own version of it within GitHub to modify it. This ensures you have your own personalized dotfiles you can always have access to via GitHub and apply to any Linux system you decide. 

How It Works:
 1. The script prompts the user
     - If the user answers 'y', the script checks if the dotfiles .bashrc and user's home directory .bashrc files are already 
 2. The script

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
 - Source: Ask Ubuntu
   - Link: https://askubuntu.com/questions/17536/how-do-i-create-a-permanent-bash-alias
   - Used for: I used this website to figure out how to add aliases to the .bashrc file

 - Source: UltaHost
   - Link: https://ultahost.com/knowledge-base/bashrc-file-in-linux/#:~:text=bashrc%20file%20is%20to%20set,and%20running%20other%20initialization%20commands.
   - Used for: I used this website to define what the .bashrc file is and its function

 - Source: Digital Ocean
   - Link: https://www.digitalocean.com/community/tutorials/bashrc-file-in-linux
   - Used for: I used this website to define what the .bashrc file is and its function

 - Source: GeeksforGeeks
   - Link: https://www.geeksforgeeks.org/alias-command-in-linux-with-examples/
   - Used for: I used this website to define what an alias is and its function

 - Source: Medium.com
   - Link: https://medium.com/towards-data-engineering/understanding-the-path-variable-in-linux-2e4bcbe47bf5
   - Used for: I used this website to figure out what one of the aliases I added does to the PATH variable

 - Source: phoenixNAP
   - Link: https://phoenixnap.com/kb/symbolic-link-linux
   - Used for: I used this website to figure out how to create a symbolic link

 - Source: Linuxize
   - Link: https://linuxize.com/post/bash-if-else-statement/
   - Used for: I used this website to remember how to create an if else statement in bash script

 - Source: KodeKloud
   - Link: https://kodekloud.com/blog/declare-bash-boolean-variable-in-shell-script/
   - Used for: I used this website to figure out how to declare bash boolean variables in a shell script since bash doesn't have a native boolean data type

 - Source: Stack Overflow
   - Link: https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists
   - Link: https://stackoverflow.com/questions/8467424/echo-newline-in-bash-prints-literal-n
   - Used for: I used this website to figure out how to check if a symbolic link between the two .bashrc files was already created and how to create new lines while useing the echo command

 - Source: Server Fault
   - Link: https://serverfault.com/questions/76042/find-out-symbolic-link-target-via-command-line
   - Used for: I used this website to find commands to check if a file is symbolically linked and if so where it is linked 

 - Source: nixCraft
   - Link: https://www.cyberciti.biz/faq/bash-check-if-file-does-not-exist-linux-unix/
   - Used for: I used this website to find out how to chekc if a file exists via a bash script
