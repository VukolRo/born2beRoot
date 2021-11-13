# Installing and configure packages for your server

### Some of standart sustem utilites you will use for setting up your server
- `su` Substitute User identtity
  you may use that command for switching beetween users you got(`su <user_name>`), or to root user(`su` or `su -`)
- `usermod [options] <user_name>`
  allows you to modify a user’s login information
  - `-a` (append) always use `-a` option when adding user to new group, if you omit taht, the user will be removed from the groups not listed after the `-G` option
  - `-G` (group) adding user into group listed after that option
  - `-l` option is used to change the username `usermod -l <new_user_name> <user_name>`
  - `-e` option is set the user’s expiry date `sudo usermod -e "YYYY-MM-DD" <user_name>`  
    to disable the expiration of an account `sudo usermod -e "" <user_name>`  
    to view the user’s expiry date `sudo chage -l <user_name>`  
  - 
### Packeges you have to install as required in subject
- `sudo` Super User do
  sudo allows a permitted user to execute a command as the superuser or another user, as specified by the security policy
