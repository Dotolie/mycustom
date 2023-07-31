

do_install:append() {
    bbwarn "remove autologin root"

    sed -i 's/--autologin root//g' ${D}${systemd_system_unitdir}/serial-getty@.service;
}

