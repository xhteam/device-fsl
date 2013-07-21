#!/system/bin/sh
# This script can be used to quickly switch on usb suspend
# power saving mode on the Option modem in sysfs
#
# checking for root
#USERID=`id -u`
#MODE="auto"
#TIME="10"
#if [ "$USERID" != "0" ]
#then
#    /system/bin/log -t radio "Need root permissions to run this script"
#    exit
#fi

AS=${1:-"auto"}
TIMEOUT=${2:-"5"}
VID=${3:-"19d2"}


/system/bin/log -t radio "set radio suspend enable" 
echo $AS >`find /sys -name idVendor | xargs -n 1 grep -H $VID | sed  "s/idVendor:$VID/power\/control/"`
echo $TIMEOUT >`find /sys -name idVendor | xargs -n 1 grep -H $VID | sed  "s/idVendor:$VID/power\/autosuspend/"`

