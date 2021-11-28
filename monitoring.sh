#!/bin/bash
TOTALRAM=$(free --mega | grep Mem: | awk '{print $2}')
USEDRAM=$(free --mega | grep Mem: | awk '{print $3}')
UTILRATERAM=$(free --mega | grep Mem: | awk '{printf("%.2f%%"), $3/$2*100}')
TOTALDISK=$(df -BGB | awk '{fd += $2} END {print fd}')
USEDDISK=$(df -BMB | awk '{ud += $3} END {print ud}')
UTILRATEDISK=$(df -BMB | awk '{ud += $3} {fd += $2} END {printf("%.2f%%"), ud/fd*100}')
IPv4=$(hostname -I)
MACADDRSS=$(ip link show | grep link/ether | awk '{print $2}')

wall $'#Architecture: ' `uname -a` \
$'\n#CPU physical: ' `cat /proc/cpuinfo | grep  "physical id" | wc -l` \
$'\n#vCPU:  '`cat /proc/cpuinfo | grep "processor" | wc -l` \
$'\n#Memory Usage:' "${USEDRAM}/${TOTALRAM}MB (${UTILRATERAM})" \
$'\n#Disk Usage: ' "${USEDDISK}/${TOTALDISK}Gb (${UTILRATEDISK})" \
$'\n#CPU Load: ' `mpstat | grep all| awk '{printf("%.1f%%"), 100-$13}'` \
$'\n#Last boot: ' `who -b | awk '{print $3" "$4}'` \
$'\n#LVM use: ' `lsblk | grep lvm | awk '{print $6}' | awk '{if ($1 == "lvm") {print "yes";exit} else {print "no";exit} }'` \
$'\n#Connection TCP:' `netstat | grep ESTABLISHED |  wc -l` "ESTABLISHED" \
$'\n#User log: ' `who | wc -l` \
$'\n#Network: IP ' "$IPv4(${MACADDRSS})" \
$'\n#Sudo:  ' `journalctl _COMM=sudo -g COMMAND | wc -l` "cmd"
