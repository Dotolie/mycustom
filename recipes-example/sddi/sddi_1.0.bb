SUMMARY = "sddi recipe"
DESCRIPTION = "Recipe for sddi"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"


FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE = "(stm32mpcommon)"
PACKAGE_ARCH = "${MACHINE_ARCH}"
PACKAGES += "${PN}-userfs"

DEPENDS += " openssl "

# Default service for systemd
inherit systemd python3native
SRC_URI = "file://sddi.service"
SRC_URI += "file://cert.pem"
SRC_URI += "file://key.pem"
SRC_URI += "file://sddi"


inherit systemd python3native

B = "${WORKDIR}"
S = "${WORKDIR}"

RS_BOARDS_SERVICE ?= "1"


# Create specific userfs package
MS_PACKAGE_4USERFS ?= "1"


do_install() {
   bbwarn "install slots & verify to ${D}${prefix}/bin/"

   install -d ${D}${prefix}/local/bin/
   install -d ${D}${prefix}/local/log/

   install -m 750 ${B}/sddi ${D}${prefix}/local/bin/sddi
   install -m 640 ${B}/key.pem ${D}${prefix}/local/bin/key.pem
   install -m 640 ${B}/cert.pem ${D}${prefix}/local/bin/cert.pem


   if [ "${RS_BOARDS_SERVICE}" -eq 1 ]; then
        # Install systemd service for all machines configurations
	bbwarn " sddi service "

        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
            install -d ${D}${systemd_unitdir}/system
            install -m 644 ${WORKDIR}/sddi.service ${D}/${systemd_unitdir}/system

	    bbwarn " install systemd=${systemd_unitdir}/system/sddi.service"
        fi
   fi
}

# -----------------------------------------------------------
# specific for service: start copro m4 firwmare at boot time
SYSTEMD_PACKAGES += " sddi"
SYSTEMD_SERVICE:${PN} = "sddi.service"
SYSTEMD_AUTO_ENABLE:${PN} = "disable"

# -----------------------------------------------------------

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"

FILES:${PN} = "${prefix}/bin"
FILES:${PN}-userfs = "${prefix}/local/log"
FILES:${PN}-userfs += "${prefix}/local/bin"
FILES:${PN} += "${systemd_unitdir}/system"

