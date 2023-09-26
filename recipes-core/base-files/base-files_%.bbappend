
do_install:append() {
	echo "export TMOUT=300" >> ${D}${sysconfdir}/profile
}

