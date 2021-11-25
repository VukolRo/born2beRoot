## Creating a script which will shows current information about our server

  #### It must display following information:
1. The architecture of your operating system and its kernel version
2. The number of physical processors
3. The number of virtual processors
4. The current available RAM on your server and its utilization rate as a percentage
5. The current available memory on your server and its utilization rate as a percentage
6. The current utilization rate of your processors as a percentage
7. The date and time of the last reboot
8. Whether LVM is active or not
9. The number of active connections
10. The number of users using the server
11. The IPv4 address of your server and its MAC (Media Access Control) address
12. The number of commands executed with the sudo program
##### example
![image](https://user-images.githubusercontent.com/61047851/143479713-0db98068-bfec-4002-a53e-9873eb1ab6d6.png)            

- All bash scripts should start with that first line
  `#!/bin/bash`
- Next we will use `wall` command which will display information received by our script on the terminals of all logged-in users         
  Exampl of each line for bash script:          
```               
$'#Architecture: ' `uname -a` \           
```        
  1. use `$` to enable spec simbols further in quotes `" "`
  2. everithing in `" "` or `' '` will display in standard output
  3. everithing in quotes like u can see bellow will ran as a command
  ```
  ` `
  ```
  4. as a line breaker of script code `\`
- The `uname` comand 
