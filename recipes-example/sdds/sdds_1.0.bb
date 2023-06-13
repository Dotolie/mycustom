SUMMARY = "sdds recipe"
DESCRIPTION = "Recipe for sdds"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "svn://192.168.0.21/svn/sdds/;protocol=http;module=trunk;rev=head;user=ywkim;pswd=ywkim01"

#PV = "1.0.0"

S = "${WORKDIR}/trunk"

require recipes-example/sdds/sdds_cm4.inc

PROJECTS_LIST = "\
	sdds_CM4 \
"

