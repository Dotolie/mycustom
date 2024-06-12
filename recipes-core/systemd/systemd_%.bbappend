
do_configure:append() {
    #disabling autostart of systemd-resolved
    sed -i -e "s/enable systemd-resolved.service/disable systemd-resolved.service/g" ${S}/presets/90-systemd.preset

    if ${@bb.utils.contains('MACHINE', 'stm32mp1-sdnl', 'true', 'false', d)}; then
    	#disabling autostart of systemd-timesyncd
	sed -i -e "s/enable systemd-timesyncd.service/disable systemd-timesyncd.service/g" ${S}/presets/90-systemd.preset

    	#disabling autostart of systemd-networkd
	sed -i -e "s/enable systemd-networkd.service/disable systemd-networkd.service/g" ${S}/presets/90-systemd.preset
    fi

}


RDEPENDS:remove = " util-linux-fsck "
