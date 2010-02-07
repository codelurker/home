#!/bin/sh
# Total netInfo In | Out 
######################
# change if needed
interface="eth0"
#
tinetin=`ifconfig $interface | grep bytes | awk '/RX bytes/ {print $3$4}' | sed 's/bytes://'`
tinetout=`ifconfig $interface | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://'`
#
echo " TotalDown: $tinetin "
echo " TotalUp: $tinetout "
