# Installing and configure packages for your server

## Some of standart sustem utilites you will use for setting up your server
- `su` Substitute User identtity
  you may use that command for switching beetween users you got(`su <user_name>`),    
  to root user(`su` or `su -`)
- `usermod [options] <user_name>`
  allows you to modify a user’s login information
  - `-a` (append) always use `-a` option when adding user to new group, if you omit taht,    
    the user will be removed from the groups not listed after the `-G` option
  - `-G` (group) adding user into group listed after that option
  - `-l` option is used to change the username `usermod -l <new_user_name> <user_name>`
  - `-e` option is set the user’s expiry date `sudo usermod -e "YYYY-MM-DD" <user_name>`    
        to disable the expiration of an account `sudo usermod -e "" <user_name>`    
        to view the user’s expiry date `sudo chage -l <user_name>`    
  - `-L` option allows you to lock a user account `sudo usermod -L <user_name>`
  - `-U` to unlock a user `sudo usermod -U <user_name>`         
  example
  ```
  $ usermod -aG sudo shavok
  ```
- `getent database [key ...]` *Get Entries*     
  a Unix command that helps a user get entries in a number of important text files called databases
  ```
  $ getent group sudo
  ```
- `systemctl` control the `systemd` system and service manager       
  `systemctl [OPTIONS...] COMMAND [UNIT...]`       
  options
  - `restart` Stop and then start one or more units specified on the command          
     line. If the units are not running yet, they will be started        
  ```
  $ systemctl restart ssh
  ```
  - `status` Show terse runtime status information about one or more units, followed by most       
           recent log data from the journal. If no units are specified, show system status
  ```
  $ systemctl status ssh
  ```
- `dpkg` package manager for Debian          
  `dpkg [option...] action`        
  `-l` shows list with all packages you got       
  check is sudo already installed: 
  ```
  dpkg -l | grep sudo
  ```
- `hostnamectl` check current hostname        
  change hostname       
  ```
  $ hostnamectl <old-hostname> <new_hostname>
  ```
- `reboot` use that command to reboot your server
- `poweroff` use that command to shutdown the server

## Packeges you have to install as required in subject
- `sudo` Super User do    
  allows a permitted user to execute a command as the superuser or another user, as specified by the security policy
  - `sudo visudo` open sudoers file      
  - add this line in file to give your user root permition         
    `<user_name> ALL=(ALL:ALL) ALL`        
  - `groupadd` create a new group       
    creat a group "user42" as required in subject
    ```
    $ groupadd user42
    ```      
    add user into "user42" and "sudo" groups as required in subject
    ```
    $ usermod -aG user42 <user_name>
    $ usermod -aG sudo <user_name>
    ```       
    `$ getent group user42` shows who in that group       
    `groups` run that command to see in which groups your user belongs        
    
- `apt` *Advanced Packaging Tool*    
  `apt [options] command`   
  options        
  - `update` always update the package index before upgrading or installing new packages
  - `upgrade` to upgrade the installed packages to their latest versions
  - `install` if you want to install multiple packages with one command, specify them as a space-separated list
  ```
  $ apt install package_name
  $ apt install package1 package2
  ```
  - `remove`/`purge` the remove command will uninstall the given packages, but it may leave some configuration files behind.        
    If you want to remove the package including all configuration files, use `purge` instead of `remove`  
  ```
  $ apt remove package_name
  $ apt remove package1 package2
  $ apt purge package_name
  ```
- `ufw` Installing and configuring UFW (Uncomplicated Firewall)       
  `ufw [--dry-run] [options] [rule syntax]`        
  options
  - `enable` / `disable` enables / disables the firewall
  - `reload` / `rest` reload / reset the firewall
  - `allow ARGS` / `deny ARGS` add allow / deny rule
  - `status` show firewall status
  - `status numbered` show firewall status as numbered list of RULES
  - configure the rules
    ```
    $ ufw allow ssh
    ```
  - configure the port rules
    ```
    $ ufw allow 4242
    ```
  - to delete some of rules listed after `ufw status numbered`
    ```
    $ uwf delete <number of rule>
    ```
- SSH instalation and gonfiguration         
  - `apt install openssh-server` install ssh package         
    `systemctl status ssh` check the ssh status        
    `systemctl restart ssh` restart the ssh service        
    chang port 22 to port 4242          
    open with vim or other redactor that file - `/etc/ssh/sshd_config`         
    change the line "#Port 22" to "Port 4242"        
    `systemctl restart ssh` restart it again
  - add forward rule for VirtualBox         
    go to VirtualBox -> choose your server -> select "settings"           
    choose "Network" -> "Adapter 1" -> "Advanced" -> "Port Forwarding"          
    enter the values as shown below            
    ![image](https://user-images.githubusercontent.com/61047851/141803988-78344524-2fdb-4d51-8f70-b37090caade9.png)
  - connect to your server from terminal of your host PC
    ```         
    $ ssh <your_username>@0.0.0.0 -p 4242       
    ```         
    to quit the connection use comand        
    `exit`        
    you may find out the IP address, which you need to connect to your server, by running     
    command `sudo systemctl status ssh` in server terminal, and check the line with following text     
    **Server listening on..** (like you can see on screanshot below)
      ![image](https://user-images.githubusercontent.com/61047851/141690139-418f75bb-e035-44ef-9a9b-f325a649333a.png)
 - crontab

  
