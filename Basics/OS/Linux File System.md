# Linux File System Basics
This document contains information on everything related to the Linux file system such as its hierarchy, directories, managing the entire system, and how to add personal customizations.
 
## Linux Filesystem Hierarchy 
The following is an overview of a standard Unix filesystem. The exact hierarchy depends on the platform so your file/directory structure may differ slightly:

<img width="1120" height="610" alt="image" src="https://github.com/user-attachments/assets/125fe4cf-31e5-4b7a-97d3-d4d8bbb034e3" />

### Directory & File Breakdown
<details>
<summary>`/` Root Dir</summary>

#### Definition
Is the top-level directory of the entire Linux file system. Where all other directories and files are organized and structured.

#### Characteristics
 - Forms the base/root of the Linux filesystem hierarchical tree-like structure
 - The point where other file systems can be mounted such as an external hard drive
 - Only the root user has permissions to modify contents inside this directory
</details>

<details>
<summary>`/bin` Binary Dir</summary>

#### Definition
Contains essential binary executable files (commands) that are required for the basic operation of the system.

#### Characteristics
 - The files are necessary for the system to boot and run in single-user mode
 - These commands are universally available across user types
 - Binary executables are pre-compiled machine code that the system can directly execute unlike source code, which is human-readable and has to be compiled into binary before execution

#### How to Add Custom Binaries
Generally not recommended to create custom system-wide binaries as it can lead to conflicts with existing system commands. Hence, this approach will follow creating custom binaries in a user's home directory so it doesn't negatively impact the entire system.
 1. Create a local `bin` folder in your home directory with `mkdir ~/bin`
 2. Add the folder to your `PATH` environment variable via the commands:
    - `echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc`
    - `source ~/.bashrc`
</details>

<details>
<summary>`/boot` Boot Dir</summary>

#### Definition
Stores all files required for booting the system.

#### Characteristics
 - Includes the GRUB boot loaded configuration and essential kernel files that are loaded during startup
 - Example files it contains:
   - Kernel initrd (initrd.img-2.6.32-24-generic)
   - vmlinux (vmlinuz-2.6.32-24-generic)
   - grub
</details>

<details>
<summary>`/dev` Device Dir</summary>

#### Definition
Stores all the Linux device files. Includes terminal devices, USB, or any device attached to the system.

#### What are Device Files?
 - Are special files that act as interfaces between hardware and software
 - Two Types:
   - **Block Devices (external drives):** store data in fixed-size blocks and support random access - you can read or write any block directly. It's file type is represented by a 'b'.
     - Hard Drives: /dev/sda, /dev/sdb (SATA)
     - NVMe SSDs: /dev/nvme0n1, /dev/nvme1n1
     - Partitions: /dev/sda1, /dev/nvme0n1p1
     - Virtual Disks: /dev/vda (in VMs)
     - Loop Devices: /dev/loop0 (mount ISO files)
   - **Character Devices (Ex: microphones, speakers):** provide a stream of bytes, accessed sequentially (no seeking back). It's file type is represented by a 'c'.
     - `/dev/null`: discards anything written. Reads return EOF.
     - `/dev/zero`: reads return infinite null bytes
     - `/dev/random`, `/dev/urandom`: random bytes from kernel entropy pool
     - `/dev/tty`: your controlling terminal
     - `/dev/pts/0`: Pseudo-terminal (SSH sessions, terminal emulators)
     - `/dev/input/event0`: keyboard or mouse input devices
 - Major vs Minor Numbers
   - Major
   - Minor
   -  
</details>

<details>
<summary>`/etc` Editable Text Configuration Dir</summary>

#### Definition
Contains configuration files for system applications, users, services, and tools or it contains the Host-specific system-wide configuration files.
 - Also contains startup and shutdown shell scripts used to start/stop individual programs

 - **/etc/passwd:** stores user account information
 - **/etc/shadow:**
 - **/etc/group:**
 - **/etc/sudoers:**
</details>

<details>
<summary>`/home` User Homes Dir</summary>

#### Definition
Is where user home directories are located, which each user having their own subdirectory under `/home`.
</details>

<details>
<summary>`/lib` Libraries Dir</summary>

#### Definition
Stores shared libraries needed by applications to run.

#### Characteristics
 - Includes dynamic libraries needed during runtime
 - Apache server libraries are available here
 - Library filenames are either ld* or lib*.so.*
 - **Ex:**
   - ld-2.11.1.so
   - libncurses.so.5.7 
</details>

<details>
<summary>`/media` Media Dir</summary>

#### Definition
Where devices like USBs, CDs, and pen drives are mounted.

#### Characteristics
 - Acts as a temporary mount directory for removable devices
 - **Ex:**
   - `/media/cdrom` for CD-rOM
   - `/media/floppy` for floppy drives
   - `/media/cdrecorder` for CD writer 
</details>

<details>
<summary>`/mnt` Mount Dir</summary>

#### Definition
Where external drives are temporarily mounted and there contents become accessible/connected to the system.

#### Characteristics
 - System admins can mount filesystems here
</details>

<details>
<summary>`/opt` Optional Software Packages Dir</summary>

#### Definition
Stores third-party software and packages that are not part of the default system installation.

#### Characteristics
 - Includes the software and packages configuration and data files
 - Contains add-on applications from individual vendors
 - 


</details>

<details>
<summary>`/root` Root User's Home Dir</summary>

#### Definition
Is the home directory for the root user/superuser account, where its configuration and personal files are stored.

#### Characteristics
 - The directory is optional, but highly recommended according to Filesystem Hierarchy Standard (FHS).
 - If the directory is not available on the root partition, the system will fall back to user `/` itself, which is why `/root` is recommend and kept on the root partition.

#### Why Is `/root` Separate from `/home`?
 - **Partition Availability**
   - On many systems, `/home` resides on a separate partition or network share
   - During system recovery or single-user mode, that partition may not be mounted
   - Hence, keeping `/root` on the root partition ensures the root user can always be log in and perform maintenance
 - **Security Isolation**
   - Separating root's files from regular user directories makes it easier to apply strict access controls
   - By default, `/root` has `700` permissions (read, write, and execute for the owner only), preventing any other user from accessing its contents 
 - **Independence from User Management** 
   - The root account exists outside the regular user management system
   - Its home directory placement reflects this special status and keeps it inaccessible to regular users
   - A regular user can only access `/root` by switching to the root user or having root privileges (sudo)
  
#### Best Practices
 - **Security Considerations**
   - Be aware that root's `~/.bash_history` may contain sensitive info such as passwords passed on the command line
   - Keep the `/root` directory's `700` permissions intact to prevent unauthorized access
 - **Using `sudo` Instead of Direct Root Login**
   - Provides an audit train as the commands are logged with the invoking user's identity
   - Risk of accidental system-wide damage is reduced
   - Many distributions (such as Ubuntu) disable root login by default 
 - **Limiting Root Access with Sudoers**
   - Always edit sudoers with `visudo` to prevent syntax errors that could lock you out
   - Follow principle of least privilege
   - Use user groups rather than individual users
   - Avoid using `NOPASSWD` unless absolutely necessary, as it removes the password verification step
</details>

## Resources
 - Software Carpentry
    - Link: https://swcarpentry.github.io/shell-novice/reference.html
    - Desc: A summary of basic commands and the overall filesystem of the Unix

 - GeeksforGeeks
    - Link: https://www.geeksforgeeks.org/linux-unix/linux-tutorial/
    - Desc: An extensive guide on Linux 

 - LinuxVox
    - Link:https://linuxvox.com/blog/the-toplevel-directory-on-a-linux-system-is-represented-as/
    - Desc: A summary of the top level directory in a Linux system
  
 - LinuxVox
    - Link: https://linuxvox.com/blog/what-is-root-in-linux/
    - Desc: An overview of what the /root directory is in Linux

 - LinuxVox
    - Link: https://linuxvox.com/blog/bin-folder-linux/
    - Desc: A summary of the `/bin` folder in Linux and how to add custom binaries
 
 - TuteWorld
   - Link: https://www.tuteworld.com/linux/storage/block-vs-character-devices/
   - Desc: Explains what Block and Character devices are and their differences
