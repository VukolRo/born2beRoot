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
<a id="example1" /> ![image](https://user-images.githubusercontent.com/61047851/143479713-0db98068-bfec-4002-a53e-9873eb1ab6d6.png)            

###### All bash scripts should start with that first line
  `#!/bin/bash`
  - Next we will use `wall` command which will display information received by our script on the terminals of all logged-in users         
  Exampl of each line for bash script:          
  ```               
  $'#Architecture: ' `uname -a` \           
  ```
  - use `$` to enable spec simbols further in quotes `" "`
  - everithing in `" "` or `' '` will display in standard output
  - everithing in quotes like u can see bellow will ran as a command
  ```
  ` `
  ```
  - use `\` as a line breaker of script code       

1. **Architecture**
  - following the example it must display "kernel name", "network node hostname", "kernel release",            
    "kernel version", "machine hardware name" and "operating system"
  - the command `uname` has flags for each of that information, but we can use just one `-a` to display all of them
2. **CPU physical**         
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
3. **vCPU**            
  same as in previous step we take information about virtual processors from cpuinfo file,        
  count lines with "processor", which shows specifications of logical processors which we got
  and it's a virtual processors because of we run that OS in VirtualBox
  ```
  $ cat /proc/cpuinfo | grep "processor" | uniq | wc -l
  ```
4. **Memory Usage**        
  to display RAM information use command `free` with oprions --mega            
![image](https://user-images.githubusercontent.com/61047851/143567538-86b6455b-0d37-4b28-b233-ac35c9efe0df.png)          
                   
  as we can see in subject on that [screeenshot](#example1) there is "MB" (megabytes), not MiB (mebibytes)          
  also use `awk` to work with tab              
  to refer to values in columns use `$` with index(started from 1) number of that column u need, `$0` refers to the entire line         
  to print in stdout use `print` or `printf` in singl quots and braces
  ```
  $ free --mega | grep Mem: | awk '{print $2}'
  ```               
  to have a clean code I suggest to use variables:
  ```
  TOTALRAM=$(free --mega | grep Mem: | awk '{print $2}')
  USEDRAM=$(free --mega | grep Mem: | awk '{print $3}')
  UTILRATERAM=$(free --mega | grep Mem: | awk '{printf("%.2f"), $3/$2*100}')
  ```            
  and than use them in the `wall`
  ```
  $'\n#Memory Usage: ' "${USEDRAM}/${TOTALRAM}MB (${UTILRATERAM}%)" \
  ```
5. **Disk Usage**          
  to display available memory use command `df`           
  ![image](https://user-images.githubusercontent.com/61047851/143600744-161bd09a-68e5-4e98-b525-34a55ee1394c.png)             
  use variables:
  ```
  TOTALDISK=$(df -BGB | awk '{fd += $2} END {print fd}')
  USEDDISK=$(df -BMB | awk '{ud += $3} END {print ud}')
  UTILRATEDISK=$(df -BMB | awk '{ud += $3} {fd += $2} END {printf("%.2f%%"), ud/fd*100}')
  ```           
  where `-BGB` shows values in gigabytes and `-BMB` in megabytes              
  as we can see in [screeenshot](#example1) used value shown in MB and total value in Gb             
  to count whole column to the variable, create variable inside `awk '{}'`           
  than use that variables
  ```
  $'\n#Disk Usage: ' "${USEDDISK}/${TOTALDISK}Gb (${UTILRATEDISK})" \
  ```
6. **CPU Load**             
  to display that value i'd recomend to install `mpstat` package
  ```
  $ apt install sysstat
  ```         
  run the `mpstat` command and we can see activities for each available processor               
  also there we have idle percentage, that we will use for our script
  ```
  $ mpstat | grep all| awk '{printf("%.1f%%"), 100-$13}'
  ```
7. **Last boot**                    
  to display date and time of the last reboot use command `who` with `-b` flag         
  ```
  $ who -b | awk '{print $3" "$4}
  ```
8. **LVM use**              
  to check whether LVM is active or not use command `lsblk` and if in *type* column there is at least one "lvm" the answer is yes
  ```
  $ lsblk | grep lvm | awk '{print $6}' | awk '{if ($1 == "lvm") {print "yes";exit} else {print "no";exit} }'
  ```    
9. **Connection TCP**           
  to display the number of active connections use `netstat` command which displays the contents              
  of various network-related data structures
  ```
  `netstat | grep ESTABLISHED |  wc -l` "ESTABLISHED"
  ```
10. **User log**             
  the `who` utility displays a list of all users currently logged on             
  to display the number of users using the server lets count linex in that list with `wc -l`
  ```
  $ who | wc -l
  ```
11. **Network: IP **
  to display the ip address of host use command `hostname` with `-I` flag        
  to display MAC address of host use `ip link show` and `grep link/ether` than with `awk` take second value

12. **Sudo**       
  to display the number of commands executed with the sudo program use `journalctl` which is query the systemd journal            
  also use `_COMM=sudo` filtr, and with `-g` flag which is same as grep filter output with "COMMAND"      
  ```
  $ journalctl _COMM=sudo -g COMMAND | wc -l
  ```              
                    
                    
  **Do not forget**             
  to add the following line into `crontab -e -u root` file
  ```
  */10 * * * * bash /path/to/your/script/monitoring.sh
  ```                
  and also u may add the following lines which will run script everu 30 seconds
  ```
  * * * * * bash /path/to/your/script/monitoring.sh
  * * * * * ( sleep 30 ; bash /path/to/your/script/monitoring.sh )
  ```               
  also in `visudo` file u should allow to execute your script without asking for password
  ```
  root ALL=(root) NOPASSWD: path/to/your/script/monitoring.sh
  ```           
  and of course your script must have access to exucuti as a root
  ```
  $ chmod 744 /path/to/your/script/monitoring.sh
  ```
  
  
