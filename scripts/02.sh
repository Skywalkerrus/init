#!/bin/bash
NAME=$1
ids=$(id -u $NAME)
if [ "$ids" == ""]
then
	echo "user does not exist"
	exit 1
else
	echo "user exist"
fi
if [ "$ids" -gt "1000" ]
then
	echo "user active"
	/usr/sbin/userdel -f $NAME
	rm -r /home/$NAME
	echo "user deleted"
	exit 0
elif [ "$ids" -lt "1000" ]
then
	echo "it's system user"
fi
