SUMMARY = "slots recipe"
DESCRIPTION = "Recipe for slots"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"


FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE = "(stm32mpcommon)"
PACKAGE_ARCH = "${MACHINE_ARCH}"

# Create specific userfs package
A7_PACKAGE_4USERFS ?= "1"
PACKAGES += "${@bb.utils.contains('A7_PACKAGE_4USERFS', '1', '${PN}-userfs', '', d)}"

# Init default installation path
A7_FOLDER ?= "bin"
A7_INSTALLDIR ?= "${prefix}/local"
A7_OUTPUT_4USERFS = "${A7_INSTALLDIR}/${A7_FOLDER}"


SRC_URI = "svn://192.168.0.21/svn/slots/;protocol=http;module=trunk;rev=head;user=ywkim;pswd=ywkim01"

DEPENDS += " cppzmq openssl"

inherit cmake

B = "${WORKDIR}/build"
S = "${WORKDIR}/trunk"

do_install() {
   bbwarn "install slots ------------${A7_OUTPUT_4USERFS}"
   install -d ${D}${A7_OUTPUT_4USERFS}/
   install -m 755 ${B}/slots ${D}${A7_OUTPUT_4USERFS}/slots
}

FILES:${PN}-userfs = "${@bb.utils.contains('A7_PACKAGE_4USERFS', '1', '${A7_OUTPUT_4USERFS}', '', d)}"

