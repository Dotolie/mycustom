
do_install:append () {
	bbwarn "move message log to /usr/local/log"

	if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
		echo 'OPTIONS="-O /usr/local/log/message -s 100 -b 5"' >> ${D}${sysconfdir}/default/busybox-syslog
	fi

}

FILES:${PN} += "${sysconfdir}/default"
