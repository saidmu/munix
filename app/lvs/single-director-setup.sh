#!/bin/bash  

TIME_OUT=30
VIP=103.10.9.86
V_PORT=80

REALSERVER01=103.10.9.83
REALSERVER02=103.10.9.84

REALPORT=80

if [ $# -ne 1 ];then
	echo "Usage:`basename $0` {start|stop|status)"
	exit 1
else
	case "$1" in
		start)
		  echo "Start Lvs of Director setting"
#		  echo 1>/proc/sys/net/ipv4/ip_forward
		  /sbin/ifconfig ens160:0 $VIP broadcast $VIP netmask 255.255.255.255 up
		  /sbin/ipvsadm -C
		  /sbin/ipvsadm -A -t $VIP:$V_PORT -s rr
		  /sbin/ipvsadm -a -t $VIP:$V_PORT -r $REALSERVER01:$REALPORT -g -w 1
		  /sbin/ipvsadm -a -t $VIP:$V_PORT -r $REALSERVER02:$REALPORT -g -w 1
		  /sbin/ipvsadm -L -n
		;;
		stop)
		  echo "close LVS Director function"
		  /sbin/ipvsadm -C
		  /sbin/ifconfig ens160:0 down
		;;
		status)
		  /sbin/ipvsadm -L -n
		;;
		*)
		  echo "Usage:`basename $0` {start|stop|status)"
	esac
fi
