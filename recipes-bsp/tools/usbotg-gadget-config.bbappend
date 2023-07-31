
do_install:append () {
	bbwarn "modify usbotg-gadget"

	sed -i 's/ACTION/#ACTION/' ${D}${sysconfdir}/udev/rules.d/97-ustotg.rules
}
