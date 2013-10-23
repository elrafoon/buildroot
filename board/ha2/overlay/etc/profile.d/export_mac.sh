export MAC=`cat /sys/class/net/eth0/address | sed s/://g | tr 'a-z' 'A-Z'`
