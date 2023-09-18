
do_install:append() {
	echo "export TMOUT=600" >> ${D}${sysconfdir}/profile
}

