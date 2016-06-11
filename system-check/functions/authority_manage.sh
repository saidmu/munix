#!/bin/bash

#check the number of root
get_super_user()
{
	ROOT_COUNT=`awk -F: '{print $3}' /etc/passwd | grep ^0 | wc -l`
	if [ "$ROOT_COUNT" = "1" ];then
		echo "---only "root" super user---"
	else
		echo "---There are $ROOT_COUNT super user ,you need to check carefully---"
	fi

authority_manage()
{
	get_super_user
	echo " Home dir:"
	ls -l /home
	echo
}
