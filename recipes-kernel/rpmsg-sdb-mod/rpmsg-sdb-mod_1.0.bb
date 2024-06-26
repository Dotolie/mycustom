SUMMARY = "fast rpmsg Linux kernel module for stm32mp1"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

#SRC_URI = "file://Makefile \
#           file://stm32_rpmsg_sdb.c \
#           file://75-rpmsg-sdb.rules \
#          "

SRC_URI = "svn://192.168.0.21/svn/rpmsg-sdb-mod/;protocol=http;module=trunk;rev=head;user=ywkim;pswd=ywkim01"

S = "${WORKDIR}/trunk"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.

do_install:append() {
    # udev rules for rpmsg-sdb
    install -d ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/trunk/75-rpmsg-sdb.rules ${D}${sysconfdir}/udev/rules.d/75-rpmsg-sdb.rules
}
FILES:${PN} += "${sysconfdir}/udev/rules.d/"
FILES:${PN} += "${nonarch_base_libdir}/firmware/"

RPROVIDES:${PN} += "kernel-module-rpmsg-sdb"
