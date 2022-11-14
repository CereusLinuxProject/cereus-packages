#!/bin/sh
#
# build.sh

if [ "$1" != "$2" ]; then
	arch="-a $2"
fi

if [ "$3" = 1 ]; then
	test="-Q"
fi

PKGS=$(/hostrepo/xbps-src sort-dependencies $(cat /tmp/templates))

for pkg in ${PKGS}; do
<<<<<<< HEAD
	/hostrepo/xbps-src -j$(nproc) -H "$HOME"/hostdir $arch $test pkg "$pkg"
=======
	/hostrepo/xbps-src -j$(nproc) -s -H "$HOME"/hostdir $arch $test pkg "$pkg"
>>>>>>> upstream/master
	[ $? -eq 1 ] && exit 1
done

exit 0
