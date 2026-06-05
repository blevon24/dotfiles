# Music Services/Platforms Installation
## Service Applications Guide
 - **cmus:** is a small, fast, and powerful terminal-based audio player for Unix OS, which supports most major audio formats. Includes various features such as gapless playback, ReplayGain support, MP3 and Ogg streaming, live filtering, instant startup, customizable key-bingings, and vi-style default key-bingings.
 - 

## How to install these applications
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

## Script File Description
The Bash Script file `music.sh` automatically installs the music service applications listed in the guide above onto the user's local system.

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
 - Source: C* Music Player
   - Link: https://cmus.github.io/#home
   - Used for: I used this website to define what cmus is and how to install it

 - Source: ArchWiki
   - Link: https://wiki.archlinux.org/title/Cmus
   - Used for: I used this website to understand what features cmus has and how to use them such as remote controlling cmus via an external application or key-binding
  
 - Source: Keno Kivabe
   - Link: https://blogs.kenokivabe.com/article/create-interactive-menus-in-bash
   - Used for: I used this website to figure out different way to create a menu within a bash script
  
 - Source: Stack Overflow
   - Link: https://stackoverflow.com/questions/11636840/changing-to-root-user-inside-shell-script
   - Used for: I used this website to figure out how to automatically run a program as root or using sudo when the user isn't root/using sudo when calling the script file
  
 - Source: 
   - Link: 
   - Used for: 
