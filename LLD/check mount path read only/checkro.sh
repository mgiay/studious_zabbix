#!/bin/bash

# Author: JokerBui
# Organization: Freedom man

# This script checks for filesystems that are read only. This will
# be used in conjuction with the Zabbix monitoring and alerting system.
# If the script returns 0 then the filesystem in read only mode.
# This script uses a non-exhaustive case statment of potential mount paths,
# yet they are common in our environment.

# In order to use this a Zabbix configuration fragment will have to be made.
# It should look like this:
# UserParameter=checkro[*],/etc/zabbix/scripts/checkro.sh $1

mountPoint=$1

# Ensures that one parameter is used while using script.
[ "$#" -eq 1 ] || { echo "usage: checkro.sh <mountPoint> "; exit 1; }
case "$1" in
        /var/lib/nova/instances)
                regex="/var/lib/nova/instances"
                ;;
        *)
          	echo "Please enter a supported path."
                exit 128
                ;;
esac

# Ensures ${regex}/test_readonly is exist.
if [ -f "${regex}/test_readonly" ];
then
    result=`echo "ok" > ${regex}/test_readonly`
    if [[ -z "$result" ]];
    then
        echo 1
    else
        echo 0
    fi

fi


