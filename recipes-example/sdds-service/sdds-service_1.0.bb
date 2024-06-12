SUMMARY = "SDDS_Service recipe"
DESCRIPTION = "Recipe for SDDS_Service"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"


FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE = "(stm32mpcommon)"
PACKAGE_ARCH = "${MACHINE_ARCH}"
PACKAGES += "${PN}-userfs"

DEPENDS += " openssl "

# Default service for systemd
inherit systemd python3native
SRC_URI = "file://SDDS_Service"
SRC_URI += "file://sdds_service.service"
SRC_URI += "file://server.key"
SRC_URI += "file://server.crt"
SRC_URI += "file://libparson.so"
SRC_URI += "file://data_org"
SRC_URI += "file://data_set"
SRC_URI += "file://log"




B = "${WORKDIR}"
S = "${WORKDIR}"

RS_BOARDS_SERVICE ?= "1"


# Create specific userfs package
MS_PACKAGE_4USERFS ?= "1"


do_install() {
   bbwarn "install SDDS_Service to ${D}${prefix}/local/SDDS_Service"

   install -d ${D}${prefix}/local/SDDS_Service/
   install -d ${D}${prefix}/local/SDDS_Service/data_org/
   install -d ${D}${prefix}/local/SDDS_Service/data_set/
   install -d ${D}${prefix}/local/SDDS_Service/log/

   install -m 750 ${B}/SDDS_Service ${D}${prefix}/local/SDDS_Service
   install -m 640 ${B}/libparson.so ${D}${prefix}/local/SDDS_Service
   install -m 640 ${B}/server.key ${D}${prefix}/local/SDDS_Service
   install -m 640 ${B}/server.crt ${D}${prefix}/local/SDDS_Service
   install -m 640 ${B}/data_org/data.json ${D}${prefix}/local/SDDS_Service/data_org
   install -m 640 ${B}/data_set/data.json ${D}${prefix}/local/SDDS_Service/data_set



   if [ "${RS_BOARDS_SERVICE}" -eq 1 ]; then
        # Install systemd service for all machines configurations
	bbwarn " SDDS_Service service "

        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
            install -d ${D}${systemd_unitdir}/system
            install -m 644 ${WORKDIR}/sdds_service.service ${D}/${systemd_unitdir}/system

	    bbwarn " install systemd=${systemd_unitdir}/system/sdds_service.service"
        fi
   fi
}

# -----------------------------------------------------------
# specific for service: start copro m4 firwmare at boot time
SYSTEMD_PACKAGES += " sdds-service"
SYSTEMD_SERVICE:${PN} = "sdds_service.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

# -----------------------------------------------------------

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"

#FILES:${PN} = "${prefix}/bin"
#FILES:${PN}-userfs = "${prefix}/local/log"
FILES:${PN}-userfs += "${prefix}/local/SDDS_Service"

