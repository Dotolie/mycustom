FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://common-auth "

do_install:append() {
	bbwarn "install common-auth"
	
	cp -f ${WORKDIR}/common-auth ${D}${sysconfdir}/pam.d/

	echo "dir = /var/faillock" >> ${D}${sysconfdir}/security/faillock.conf
	echo "even_deny_root" >> ${D}${sysconfdir}/security/faillock.conf
	echo "root_unlock_time = 900" >> ${D}${sysconfdir}/security/faillock.conf
}



