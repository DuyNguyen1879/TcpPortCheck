#!/bin/bash
## Uses nc \ netcat to check for a TCP listener on a IP address
### April 2018
### $1 is the IP address
### $2 is the TCP Port
### - Cheap and nasty

IP=$1
PORT=$2

if ! $(ping -c $IP); then
    echo -e "ERROR - Can't PING IP $IP"
    exit 1
fi

## Insert a traceroute test here
echo -e "/nPerforming traceroute to $IP"
traceroute $IP

echo -e "/n/n"

echo -e "Performing TCP Port Check using nc -z $IP $PORT"

if $(nc -z $IP $PORT); then
    echo -e "SUCCESS - Connection to IP $IP PORT $PORT"
else
    echo -e "FAIL - NO Connection to IP $IP PORT $PORT"
fi
