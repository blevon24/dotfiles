# dotfiles Task 2 - bashrc
## Term Definitions
 - **.bashrc:** is a shell script file that executes every time a new Bash session is initiated/user logs onto the system's terminal. Is used to set up the user's shell environment according to their preferences by allowing them to define aliases, functions, environment variables, and executing commands within the .bashrc file. 
 - **Alias:** is a user-defined shortcut for a longer command or sequence of commands. Instructs the shell to replace one string with another string while executing the commands.

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
Lists the aliases I added to the `.bashrc` file in my AWS host system and what they do

Aliases Created:
 - `alias today='date +"%m-%d-%Y"'`- Shows the current day's month, date, and year
 - `alias path='echo -e ${PATH//:/\\n}'`- Neatly lists all the directories within the PATH variable that the shell searches through for executable files
 - `alias root='sudo -i'`- Switches the current user to root
 - `alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"`- Shows a repositories log data, such as a commit's ID and message, how long ago a commit was made, and the user how made the commit, neatly displayed in a list/graph format
 - `alias web='cd /var/www/html'`- Changes directories to the /var/www/html directory where website files are stored
 - `alias reboot='sudo shutdown -r now'`- Safely reboots the system the user is on
 - `alias update='sudo apt update'`- Downloads/updates package information from all configured sources

## Script Guide


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

 - Source:
   - Link:
   - Used for:

 - Source:
   - Link:
   - Used for:

