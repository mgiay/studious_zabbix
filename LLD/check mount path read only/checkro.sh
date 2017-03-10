#!/bin/bash

# Author: JokerBui

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


