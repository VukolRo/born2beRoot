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
1. Architecture
  - following the example it must display "kernel name", "network node hostname", "kernel release",            
    "kernel version", "machine hardware name" and "operating system"
  - the comand `uname` has flags for each of that information, but we can use just one `-a` to display all of them
2. CPU physical         
  the core philosophy of Linux/UNIX is that everything is a document. Hardware information is also recorded in the file
  ```
  $ cat /proc/cpuinfo
  ```              
  to display number of physical processors we have to count lines in that file with "physical id"
  ```
  $ cat /proc/cpuinfo | grep "physical id"
  ```               
  the number in a second column is an unique indeficator, use `wc -l` to count         
  use `uniq` to avoid repetitions
  ```
  $ cat /proc/cpuinfo | grep "physical id" | uniq | wc -l
  ```         
3. vCPU            
  same as in previous step we take information about virtual processors from cpuinfo file,        
  count lines with "processor", which shows specifications of logical processors which we got
  and it's a virtual processors because of we run that OS in VirtualBox
  ```
  $ cat /proc/cpuinfo | grep "processor" | uniq | wc -l
  ```
4. 
