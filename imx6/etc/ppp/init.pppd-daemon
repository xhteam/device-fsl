#!/system/bin/sh
# An unforunate wrapper script 
# so that the exit code of pppd may be retrieved


PPPD_PID=

PPPD_OPTIONFILE=${1:-"/data/ppp/options"}

/system/bin/setprop "net.gprs.ppp-exit" ""

/system/bin/log -t pppd "Starting pppd with params $PPPD_DEV $PPPD_BAUDRATE file $PPPD_OPTIONFILE"

#/system/bin/pppd  $PPPD_DEV $PPPD_BAUDRATE file $PPPD_OPTIONFILE
/system/bin/pppd  file $PPPD_OPTIONFILE

#put these options into option file
#mru 1280 mtu 1280 nodetach debug dump defaultroute usepeerdns novj novjccomp noipdefault ipcp-accept-local ipcp-accept-remote connect-delay 5000 
#linkname ppp0 
PPPD_EXIT=$?
PPPD_PID=$!

/system/bin/log -t pppd "pppd exited with $PPPD_EXIT"

/system/bin/setprop "net.gprs.ppp-exit" "$PPPD_EXIT"
