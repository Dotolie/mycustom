SUMMARY = "gpio interrupt recipe"
DESCRIPTION = "gpio interrupt for CP-01"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = " \
	file://gpioint  \
	file://gpioint.service \
"
inherit systemd update-rc.d


B = "${WORKDIR}"

PACKAGES += "${PN}-userfs"

do_install() {
	bbwarn "install gpioint & service "

	install -d ${D}${prefix}/local/bin/
	install -m 755  ${B}/gpioint ${D}${prefix}/local/bin/

	install -d ${D}${systemd_unitdir}/system
	install -m 644 ${WORKDIR}/gpioint.service ${D}/${systemd_unitdir}/system/
}

# specific for service: setup gpio interrupt  at boot time
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "gpioint.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"
INITSCRIPT_NAME = ""

FILES:${PN}-userfs = "${prefix}/local/bin"

FILES:${PN} = "${systemd_unitdir}/system"

