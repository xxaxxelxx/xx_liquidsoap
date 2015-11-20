#!/bin/bash

set -e
#set -x



MODE="BASH"
if [ "x$1" != "xbash" ]; then
    test -r /etc/liquidsoap/$1.liq && cp -f /etc/liquidsoap/$1.liq /etc/liquidsoap/liquidsoap.liq
    MODE="$1"

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
fi

# execution
if [ $MODE = "BASH" ]; then
    ls /etc/liquidsoap/*.liq | ( while read liqline; do echo $(basename $liqline | sed 's|\.liq||');done )
else
    liquidsoap --force-start --quiet /etc/liquidsoap/liquidsoap.liq
fi

exit
