#!/bin/bash

set -e
set -x

MODE="BASH"

case $1 in
    [bB][bB][rR][aA][dD][iI][oO])
    MODE="BBR"
;;
    [bB][bB][rR][aA][dD][iI][oO]-[cC][hH])
    MODE="BBRCH"
;;
    [rR][aA][dD][iI][oO][tT][eE][dD][dD][yY])
    MODE="TDY"
;;
    [rR][aA][dD][iI][oO][tT][eE][dD][dD][yY]-[cC][hH])
    MODE="TDYCH"
;;
    [oO][sS][tT][sS][eE][eE][wW][eE][lL][lL][eE])
    MODE="OW"
;;
    [oO][sS][tT][sS][eE][eE][wW][eE][lL][lL][eE]-[cC][hH])
    MODE="OWCH"
;;
    [bB][aA][sS][hH])
    MODE="BASH"
;;
esac

# mode section
if [ $MODE = "BBR" ]; then
    test -r /etc/liquidsoap/bbradio.liq && cp -f /etc/liquidsoap/bbradio.liq /etc/liquidsoap/liquidsoap.liq
elif [ $MODE = "BBR-CH" ]; then
    test -r /etc/liquidsoap/bbradio.liq && cp -f /etc/liquidsoap/bbradio-ch.liq /etc/liquidsoap/liquidsoap.liq
elif [ $MODE = "TDY" ]; then
    test -r /etc/liquidsoap/radioteddy.liq && cp -f /etc/liquidsoap/radioteddy.liq /etc/liquidsoap/liquidsoap.liq
elif [ $MODE = "TDY-CH" ]; then
    test -r /etc/liquidsoap/radioteddy-ch.liq && cp -f /etc/liquidsoap/radioteddy-ch.liq /etc/liquidsoap/liquidsoap.liq
elif [ $MODE = "OW" ]; then
    test -r /etc/liquidsoap/ostseewelle.liq && cp -f /etc/liquidsoap/ostseewelle.liq /etc/liquidsoap/liquidsoap.liq
elif [ $MODE = "OW-CH" ]; then
    test -r /etc/liquidsoap/ostseewelle-ch.liq && cp -f /etc/liquidsoap/ostseewelle-ch.liq /etc/liquidsoap/liquidsoap.liq
fi

# checking the environment
LINKED_CONTAINER=$(env | grep '_ENV_' | head -n 1 | awk '{print $1}' | sed 's/_ENV_.*//')
IC_HOST=$(cat /etc/hosts | grep -iw ${LINKED_CONTAINER} | awk '{print $1}')
eval IC_PORT=\$${LINKED_CONTAINER}_ENV_IC_PORT
eval IC_SOURCE_PASS=\$${LINKED_CONTAINER}_ENV_IC_SOURCE_PASS

# password section
if [ -n "$IC_SOURCE_PASS" ]; then
    sed -i "s/IC_SOURCE_PASS/$IC_SOURCE_PASS/g" /etc/liquidsoap/liquidsoap.liq
fi
if [ -n "$IC_PORT" ]; then
    sed -i "s/IC_PORT/$IC_PORT/g" /etc/liquidsoap/liquidsoap.liq
fi

if [ -n "$IC_HOST" ]; then
    sed -i "s/IC_HOST/$IC_HOST/g" /etc/liquidsoap/liquidsoap.liq
fi

# execution
if [ $MODE = "BASH" ]; then
    bash
else
    liquidsoap --force-start --quiet /etc/liquidsoap/liquidsoap.liq
fi

exit
