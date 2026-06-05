# Music Services/Platforms Installation Guide
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
 1. The script prompts the user if they want to symlink the .bashrc file in homefiles to their home directory and saves their answer as a variable
 2. If the user answers 'y', the script checks if the homefiles .bashrc and the user's home directory .bashrc files are already symbolically linked
     - The script will exit the program if a symlink already exists between the .bashrc files
     - If a symlink does not exist the script will create a symlink and prompt the user to reload their shell environment to allow the changes to be applied to the system
 3. If the user answers 'n', the script prompts the user if they want to symlink the .bash_aliases file in homefiles to their home directory and saves their answer as a variable
     - If the user answers 'y', the script will first check if a .bash_aliases file already exists in the user's home directory in order to prevent the script from creating a broken/dangling symlink
       - The script will create a .bash_aliases file within the user's home directory and exit the program if the file doesn't exist
       - Otherwise, the script will check if the homefiles .bash_aliases and the user's home directory .bash_aliases files are already symbolically linked
       - If the .bash_aliases files are already symbolically linked, the script will exit the program
       - If a symlink does not exist, the script will create a symlink and prompt the user to reload their shell environment to allow the changes to be applied to the system
     - If the user answers 'n', the script will exit the program
 4. The script is built with a safety net in mind so if the user mistypes or doesn't answer with 'y' or 'n', then the script will prompt them again with either of the questions above (1 and 3) to allow the user to answer correctly rather than exit the program and force the user to run it again.

## References
 - Source: Ask Ubuntu
   - Link: https://askubuntu.com/questions/17536/how-do-i-create-a-permanent-bash-alias
   - Used for: 

 - Source: nixCraft
   - Link: https://www.cyberciti.biz/faq/bash-check-if-file-does-not-exist-linux-unix/
   - Used for: I used this website to find out how to chekc if a file exists via a bash script
