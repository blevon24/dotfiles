# Git Basics Guide

## Command Line Git
(**NOTE:** The curly braces in the command examples below are just placeholders, for formatting use, to indicate where the user should enter a filename or whatever is stated within the braces. Therefore, the curly braces shouldn't be included when the command is used/typed into a command line.)

 - status
   - **Definition:** Displays the state of the working directory and the staging area. This includes listing these types of files:
     - Unstaged files
     - Staged files
     - Files that aren't being tracked by Git
   - **Example:** `git status`

 - log
   - **Definition:** Displays all the commit history of a repository. This includes showing each commit's:
     - ID
     - Author/Creator
     - Date the commit was made
     - Commit message
    - **Example:** `git log` 

 - clone
   - **Definition:** Creates a copy of an existing Git remote repository. This includes copying all existing data from the repository's:
     - Folder/directories
     - Files
     - Branches
     - Entire repository history
   - **Example:** `git clone {Repository's SSH or HTTPS URL}`
  
 - add
   - **Definition:** Adds changes in your working directory to the staging area. Can stage a single file or multiple files at a time. Ways to add multiple files at once:
     - Enter multiple files after `git add` instead of entering only one file
     - Enter a `.` after `git add` to stage new and modified files without deleting
     - Use the flag `-a` to stage all files
     - Use the flag `-u` to state modified and deleted files
   - **Example:** `git add {filename/directory}`
     
 - rm
   - **Definition:** Removes one or more files from a repository's working tree, staging area, and Git index. 
   - **Examples:**
     - `git rm {filename}`: removes a file from both Git tracking and the workspace
     - `git rm --cached {filename}`: only removes a file from Git tracking
 
 - commit
   - **Definition:** Takes a snapshot of a local repository's currently staged changes/files.  
   - **Examples:**
     - `git commit`: just commits and then the user will be prompted with text on their terminal to enter a message for the commit
     - `git commit -m "{text}"`: commits and add a message all in one
   - **Commit History DEMO:**
```
blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git log
commit bc7f73d28a8da5935e204f3aa771d7b1b013f9d0 (HEAD -> main, origin/main)
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 21:29:19 2025 -0500

    added code blocks to add demonstrations

commit c3cac0747c3c7eb0f9f9c4d4eb1106dcd416b266
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 21:19:44 2025 -0500

    Created .gitignore file with a file and folder to ignore

commit 89053dec2b64500d1f11433925e1183bc20e9443
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 21:03:35 2025 -0500

    Almost finished with command line git and  git files & folders

commit 286f51c5c48447ec01c2cb7cc7b45863de31189a (test)
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 17:33:38 2025 -0500

    Finished more of command line git section and started working on .git folder README.md

commit b7cc2f701f11f7e3d173ff2bb58eafaa537c57d7
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 15:42:42 2025 -0500

    Added a few resources and new commands
```
 - push
   - **Definition:** Transfers committed files from a local repository to a remote Git repository 
   - **Example:** `git push`
 
 - fetch
   - **Definition:** Downloads commits, files, and refs from a remote Git repository to a local repository. However, unlike `git pull` it doesn't merge the fetched changes into the current local branches.
   - **Example:** `git fetch`
     
 - merge
   - **Definition:** Combines changes from one or more branches into the current branch in a repository
   - **Example:** `git merge {branch name}`
   - **Merge DEMO:**
```
blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git branch
  main
* test

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ ls
basics-guide  modules  unmerged

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ ls
basics-guide  modules

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git merge test
Merge made by the 'ort' strategy.
 unmerged | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 unmerged

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ ls
basics-guide  modules  unmerged

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git log
commit 6c9c593e10dd31283e6986f880ffadfad397b550 (HEAD -> main)
Merge: bc7f73d a3e28a9
Author: blevon24 <brianna.levon24@gmail.com>
Date:   Fri Jan 31 22:10:41 2025 -0500

    Merge branch 'test'
```
  
 - pull
   - **Definition:** Incorporated changes from a remote repository into the current branch of the local repository. Automatically merges the downloaded changes so the local repository will be exactly like the remote repository.
   - **Example:** `git pull`

 - branch
   - **Definition:** Creates, lists, renames, or deletes branches.
   - **Example:** `git branch`
   - **Branch DEMO:**
```
blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git branch
* main
  test

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ ls
basics-guide  modules

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ git checkout test
Switched to branch 'test'

blevon24@DESKTOP-Q2GG276:~/ceg3120s25-blevon24$ ls
basics-guide  modules  unmerged

```
 - tag
   - **Definition:** Creates, lists, deletes, or verifies a tag object. Tags are ref's that point to specific points in Git history.
   - **Example:** `git tag`
     
 - checkout
   - **Definition:** Switches current branch or restores working tree files. This command can restore working tree files by switching to a previous commit, branch, or tag, which in turn overwrites the working tree with the contents of the commit, branch, or tag you switched to so any deleted data is restored. 
   - **Example:** `git checkout {branch name}`
     
 - init
   - **Definition:** Creates a new empty Git repository in a local terminal
   - **Example:** `git init`
     
 - remote
   - **Definition:** Creates, views, and deletes connections to other repositories 
   - **Example:** `git remote`

## Git Files & Folders
 - .git folder
   - **Description:** A hidden directory that holds all the information that Git needs to track changes to your codebase, branches, history, and more repository information. Contains files and other directories such as:
     - *HEAD file:* a text file is used to keep track of a repository's current branch
     - *refs folder:* stores references to a repository's commits and branches
     - *objects folder:* stores your codebase as a series of snapshots
     - *config file:* a text file that stores configuration information and settings for Git
     - *hooks folder:* runs scripts at specific points in the Git workflow
     - *index file:* a binary file that stores a sorted list of file names along with file metadata and pointers to the object database
   - **Usage:** This folder is used to track the history of a repository
      
 - .gitignore file 
   - **Description:** A text file that ignores files and directories in a Git repository by entering the name of a file the user wants Git to ignore. After the user enters the filename into .gitignore and commits .gitignore to the remote repository the contents listed in .gitignore are ignored.
   - **Usage:** This file is used to ignore files and folders the user doesn't want to appear or be tracked by Git in the repository, which helps keep the repo clean and organized.
   - **.gitignore File Contents:**
```
# Ignore .ignoreFile file
.ignoreFile

# Ignore modules folder
modules

``` 

## GitHub Features
 - Pull Requests
   - **Definition:** Is a proposal to merge a set of changes from one branch into another. Can display the differences between content in the source branch and the target branch.
   - **How to perform one:**
     1. Go to the main page of the repository you want to make a pull request for
     2. Go to the branch menu and select the branch that contains the local commits you want to pull from GitHub
     3. Click `Compare & pull request` to create a pull request for the branch you want to pull from
     4. Use the `base` branch dropdown menu to select a branch you want to merge your changes into, then use the `compare` branch drop-down menu to choose the topic branch you made changes in.
     5. Enter a title and description for the pull request
     6. Click `Create Pull Request` to create a pull request that is ready for review, but if you want to create a draft pull request select `Create Draft Pull Request` in the drop-down menu and click `Draft Pull Request`

## SSH
 - Steps to set up SSH authentication to repositories
    1. Change the directory to .ssh using the command `cd .ssh`
    2. Generate an SSH key pair using the command `ssh-keygen -t ed25519 -C {comment} 
    3. Read the public key file using the command `cat {filename}.pub` then copy the file's contents
    4. Go to your repository hosting service, open your account, go to your account settings, select create an SSH key, and paste the contents of the public key you copied into the SSH key form
    5. Clone the repositories you want to SSH into using `git clone {repo HTTP or SSH URL}
 
 - Steps to set up SSH authentication to an AWS instance
    1. Login into AWS, go to your AWS lab under modules and start the lab
    2. Once the light next to AWS turns green click on AWS Details and download the private key file ending with `.pem`
    3. Open the downloaded file in your Windows OS, copy the file's contents, go into the Ubuntu app, and change directories to .ssh using the command `cd .ssh`
    4. Create a text file named after the private key, which must end with .pem, and open the file using `vim {filename}`
    5. Open the file using the command `vim {filename}`, paste the contents of the copied private key file, save the changes, and exit the file
    6. Change the permissions of the file to be private using the command `chmod 400 {filename or /path/to/filename}`
    7. To verify your connection to the AWS instance use the command `ssh -i {absolute path to private key} ubuntu@{Public IP address}` and you should see a welcoming message on your terminal along with your username being changed to ubuntu
    8. Continue to use the ssh command you made for Step 7 to connect to your AWS instance

 - Steps on how to use the `config` file in the `.ssh` folder
    1. Change the directory to .ssh using the command `cd .ssh`
    2. If a config file doesn't exist in the .ssh directory use the command `touch config` to create one, but if one already exists use the command `vim config` to edit the file
    3. Add a host to the config file using the format listed below the instructions
    4. After adding a host, save the contents and exit the config file
    5. To use the config file to ssh into a remote system use the command `ssh {Host}`, but replace `Host` with whatever you entered after `Host` in your config file entry
```
Config File Format:

Host {word you will use after the `ssh` command to SSH into a remote system}
            HostName {Public IP address}
            User {username}
            IdentityFile {absolute path to the downloaded private key of your remote system}
```

## Resources
Lists the websites I used with a link to each respective website and an explanation for what they cover.
 - GeeksforGeeks
   - Link: https://www.geeksforgeeks.org/
   - I used this website to find definitions and basic syntax of some git commands 

 - Atlassian
   - Link: https://www.atlassian.com/
   - I used this website to find definitions and basic syntax of some git commands
  
 - Git
   - Link: https://git-scm.com/
   - I used this website to find definitions and basic syntax of some git commands
  
 - SmashingMagazine
   - Link: https://www.smashingmagazine.com/2023/12/recovering-deleted-files-git-working-tree/#:~:text=If%20you%20have%20not%20committed,and%20directories%20will%20be%20restored.
   - I used this website to explain how you can recover deleted files from a repository's working tree by using the `git checkout` command
  
- DEV Community
  - Link: https://dev.to/rajaniraiyn/understanding-the-contents-of-the-git-folder-ef
  - I used this website to understand what the .git folder can be used for and what data it contains
 
- Graphite
  - Link: https://graphite.dev/guides/git-index
  - I used this website to understand the contents of the index file that is stored in the .git folder
 
- GitHub
  - Link: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request
  - I used this website to understand how push requests work and how to create/perform one  
