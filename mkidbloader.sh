#!/bin/bash

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR


COMMON_H=`grep "_common.h:" include/autoconf.mk.dep | awk -F "/" '{ printf $3 }'`
PLAT=${COMMON_H%_*}

tools/mkimage -n "${PLAT}" -T rksd -d tpl/u-boot-tpl.bin idbloader.img
cat spl/u-boot-spl.bin >> idbloader.img

