#!/bin/sh

FBV=/usr/bin/fbv
TS_TEST=/usr/bin/ts_test
SERIAL_TEST=/usr/bin/serial_test.py
IFCONFIG=/sbin/ifconfig
IWLIST=/sbin/iwlist
SHELL=/bin/sh

menu() {
	echo "L. Test LCD"
	echo "T. Test touchscreen"
	echo "S. Test serial"
	echo "W. Test wifi"
	echo "N. Scan wifi networks"
	echo "X. Run system shell"
	echo "Q. Quit"
}

menu

while read -r; do
	case $REPLY in
		L|l)
			$FBV --delay 1 /root/test-screen.png ;;
		T|t)
			$TS_TEST
			;;
		S|s)
			$SERIAL_TEST
			;;
		W|w)
			$IFCONFIG wlan0 | grep HWaddr && echo "WIFI present." || echo "WIFI not present!"
			;;
		N|n)
			$IWLIST wlan0 scanning	
			;;
		X|x)
			echo "Type exit to return to this shell"
			$SHELL
			;;
		Q|q)
			exit
			;;
	esac

	menu
done

