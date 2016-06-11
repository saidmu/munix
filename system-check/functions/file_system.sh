#!/bin/bash

#get usage more than 80%
get_disk_usage()
{
	usage=`df -TH | awk '{print $6}' | sed '1d'| awk 'BEGIN {max=80;FS="%"} {if ($1 > max) {print NR fi}}'`
	if [ -z "$usage" ];then
		echo "disk is healthy"
	else
		echo "unhealthy disk usage:"
		for i in $usage
		do
			j=$(($i+1))
			df -TH | awk '{print $6,$7}' | sed -n ''$j'p'
		done
	fi
}

#get inode usage more than 80%
get_inode_usage()
{
	usage=`df -i | awk '{print $5}' | sed '1d' | awk 'BEGIN {max=80;FS="%"} {if ( $1 > max ) {print NR fi}}'`
	if [ -z "$usage" ];then
		echo "disk inode is healthy"
	else
		echo "unhealthy disk inode usage:"
		for i in $usage
		do
			j=$(($i+1))
			df -i | awk '{print $5,$6}' | sed -n ''$j'p'
		done
	fi
}

file_system()
{
	df -h
	get_disk_usage
	echo "------------------------"
	df -i
	get_inode_usage
	echo
}


