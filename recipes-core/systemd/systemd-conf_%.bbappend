
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

inherit systemd python3native

SRC_URI += "\
	file://81-wired.network \
"

do_install:append() {
	install -D -m0644 ${WORKDIR}/81-wired.network ${D}${systemd_unitdir}/network/ 

	sed -i 's/\*/ /' ${D}${systemd_unitdir}/network/80-wired.network
	sed -i 's/!veth/enu1u1/' ${D}${systemd_unitdir}/network/80-wired.network
	sed -i '/DHCP/d' ${D}${systemd_unitdir}/network/80-wired.network
	sed -i '/UseMTU/d' ${D}${systemd_unitdir}/network/80-wired.network
	sed -i '/RouteMetric/d' ${D}${systemd_unitdir}/network/80-wired.network
	sed -i '/ClientIdentifier/d' ${D}${systemd_unitdir}/network/80-wired.network
#	echo '\n' >> ${D}${systemd_unitdir}/network/80-wired.network
	echo 'Address=192.168.0.10/24' >> ${D}${systemd_unitdir}/network/80-wired.network
	echo 'Gateway=192.168.0.1' >> ${D}${systemd_unitdir}/network/80-wired.network
}

FILES:${PN} += "\
	${systemd_unitdir}/network/ \
"
