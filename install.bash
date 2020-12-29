#!/usr/bin/env bash

# CHECK PERMISSION AND DIRECTORY
if [ ! $UID -eq 0 ]; then
	echo "Permission denied."
	exit 1
elif [ ! -d /usr/share/plymouth/themes ]; then
	echo "Please setup plymouth."
	exit 1
fi

if [ ! $1 ]; then
	echo "Please choose theme at least one."
	echo "Example: ~# install.sh flag"
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for ((i=1; i <= $#; i++)); do
	case ${!i} in

		# INSTALL flag
		"flag" ) \
		rm -rf /usr/share/plymouth/themes/flag ; \
		mkdir /usr/share/plymouth/themes/flag && \
		cp $SCRIPT_DIR/flag/intro/* /usr/share/plymouth/themes/flag/ && \
		cp $SCRIPT_DIR/flag/loop/* /usr/share/plymouth/themes/flag/ && \
		cp $SCRIPT_DIR/flag/misc/* /usr/share/plymouth/themes/flag/ && \
		echo "installing flag ......" && plymouth-set-default-theme -R flag >/dev/null 2>&1 && \
		echo "INSTALL flag DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;


	esac
done

exit