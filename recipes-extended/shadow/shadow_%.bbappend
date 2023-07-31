do_install:append() {
	bbwarn "modify useradd script"

 	sed -i 's/sh/bash/' ${D}${sysconfdir}/default/useradd
}
