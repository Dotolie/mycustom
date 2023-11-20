
do_configure:append() {
    #disabling autostart of systemd-timesyncd
    sed -i -e "s/enable systemd-resolved.service/disable systemd-resolved.service/g" ${S}/presets/90-systemd.preset
}


RDEPENDS:remove = " util-linux-fsck "
