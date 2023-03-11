#!/system/bin/sh
{
	rm /data/adb/rvhc/__PKGNAME_rv.apk
	rmdir /data/adb/rvhc
	MODDIR=${0%/*}
	MODULES=${MODDIR%/*}
	NVBASE=${MODULES%/*}
	rm $NVBASE/rvhc/__PKGNAME_rv.apk
	rmdir $NVBASE/rvhc
	if __ISBNDL :; then
		until [ "$(getprop sys.boot_completed)" = 1 ]; do sleep 1; done
		sleep 15
		pm uninstall __PKGNAME
	fi
} &
