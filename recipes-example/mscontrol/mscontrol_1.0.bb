SUMMARY = "mscontrol recipe"
DESCRIPTION = "Recipe for mscontrol"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"


FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE = "(stm32mpcommon)"
PACKAGE_ARCH = "${MACHINE_ARCH}"
#PACKAGES += "${PN}-userfs"


SRC_URI = "svn://192.168.0.21/svn/mscontrol/;protocol=http;module=trunk;rev=head;user=ywkim;pswd=ywkim01"

# Default service for systemd
#inherit systemd update-rc.d python3native
inherit systemd python3native
SRC_URI += "file://mscontrol.service"


DEPENDS += " cppzmq openssl "

inherit cmake

B = "${WORKDIR}/build"
S = "${WORKDIR}/trunk"

MS_BOARDS_SERVICE ?= "1"


# Create specific userfs package
MS_PACKAGE_4USERFS ?= "1"
PACKAGES += "${@bb.utils.contains('MS_PACKAGE_4USERFS', '1', '${PN}-userfs', '', d)}"



do_install() {
   bbwarn "install slots & verify to ${D}${prefix}/local/"

   install -d ${D}${prefix}/local/bin/
   install -d ${D}${prefix}/local/log/

   install -m 755 ${B}/test/test ${D}${prefix}/local/bin/testm
   ln -sr  ${D}${prefix}/local/bin/testm ${D}${prefix}/local/bin/testa
   ln -sr  ${D}${prefix}/local/bin/testm ${D}${prefix}/local/bin/testc
   ln -sr  ${D}${prefix}/local/bin/testm ${D}${prefix}/local/bin/testt

   install -m 755 ${B}/mscontrol ${D}${prefix}/local/bin/
   install -m 755 ${B}/verify/verify ${D}${prefix}/local/bin/

   if [ "${MS_BOARDS_SERVICE}" -eq 1 ]; then
        # Install systemd service for all machines configurations
	bbwarn " sdnl board service "

        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
            install -d ${D}${systemd_unitdir}/system
            install -m 644 ${WORKDIR}/mscontrol.service ${D}/${systemd_unitdir}/system

	    bbwarn " install systemd=${systemd_unitdir}/system/mscontrol.service"
        fi
   fi
}

# -----------------------------------------------------------
# specific for service: start copro m4 firwmare at boot time
SYSTEMD_PACKAGES += " mscontrol "
SYSTEMD_SERVICE:${PN} = "mscontrol.service"
SYSTEMD_AUTO_ENABLE:${PN} = "disable"

#INITSCRIPT_NAME = "st-m4firmware-load-default.sh"
#INITSCRIPT_PARAMS = "stop 22 5 3 ."
# -----------------------------------------------------------

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"

FILES:${PN}-userfs = "${prefix}/local/bin"
FILES:${PN}-userfs += "${prefix}/local/log"

FILES:${PN} += "${systemd_unitdir}/system"
