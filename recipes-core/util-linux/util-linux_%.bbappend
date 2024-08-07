EXTRA_OECONF:remove = " --enable-rfkill "
EXTRA_OECONF:remove = " --enable-partx "
EXTRA_OECONF:remove = " --enable-mesg "
EXTRA_OECONF:remove = " --enable-unshare "
EXTRA_OECONF:remove = " --enable-write "

EXTRA_OECONF:append = " --disable-all-programs "
EXTRA_OECONF:append = " --enable-libmount "
EXTRA_OECONF:append = " --enable-libblkid "
EXTRA_OECONF:append = " --enable-libuuid "
EXTRA_OECONF:append = " --enable-libsmartcols "
EXTRA_OECONF:append = " --enable-agetty "
EXTRA_OECONF:append = " --enable-sulogin "
EXTRA_OECONF:append = " --enable-hwclock "

EXTRA_OECONF:append = " --disable-chmem "
EXTRA_OECONF:append = " --disable-rfkill "
EXTRA_OECONF:append = " --disable-partx "
EXTRA_OECONF:append = " --disable-mesg "
EXTRA_OECONF:append = " --disable-unshare "
EXTRA_OECONF:append = " --disable-write "
EXTRA_OECONF:append = " --disable-blkid "
EXTRA_OECONF:append = " --disable-losetup "
EXTRA_OECONF:append = " --disable-nsenter "
EXTRA_OECONF:append = " --disable-fdisks "
EXTRA_OECONF:append = " --disable-swapon "
EXTRA_OECONF:append = " --disable-zramctl "
EXTRA_OECONF:append = " --disable-cal "
EXTRA_OECONF:append = " --disable-asciidoc "
EXTRA_OECONF:append = " --disable-fallocate "
EXTRA_OECONF:append = " --disable-ipcrm "
EXTRA_OECONF:append = " --disable-ipcmk "
EXTRA_OECONF:append = " --disable-lscpu "
EXTRA_OECONF:append = " --disable-lsirq "
EXTRA_OECONF:append = " --disable-lsns "
EXTRA_OECONF:append = " --disable-lsfd "
EXTRA_OECONF:append = " --disable-lslogins "
EXTRA_OECONF:append = " --disable-lsmem "
EXTRA_OECONF:append = " --disable-irqtop "
EXTRA_OECONF:append = " --disable-utmpdump "
EXTRA_OECONF:append = " --disable-setterm "
EXTRA_OECONF:append = " --disable-scriptutils "
EXTRA_OECONF:append = " --disable-switch_root "
EXTRA_OECONF:append = " --disable-wall "
EXTRA_OECONF:append = " --disable-wipefs "
EXTRA_OECONF:append = " --disable-mkfs "
EXTRA_OECONF:append = " --disable-whereis "
# EXTRA_OECONF:append = " --disable-runuser "
EXTRA_OECONF:append = " --disable-pivot_root "
EXTRA_OECONF:append = " --disable-ipcs "
EXTRA_OECONF:append = " --disable-rename "
# EXTRA_OECONF:append = " --disable-su "
# EXTRA_OECONF:append = " --disable-sulogin "
EXTRA_OECONF:append = " --disable-eject "
EXTRA_OECONF:append = " --disable-uuidd "
EXTRA_OECONF:append = " --disable-uuidgen "
EXTRA_OECONF:append = " --disable-setpriv "
EXTRA_OECONF:append = " --disable-logger "
EXTRA_OECONF:append = " --disable-chfn-chsh "
EXTRA_OECONF:append = " --disable-fsck "
EXTRA_OECONF:append = " --disable-hardlink "


do_configure:append() {
    #enable findmnt

    sed -i -e "s/BUILD_FINDMNT_TRUE='#'/BUILD_FINDMNT_TRUE=/g" ${S}/configure
    sed -i -e "s/BUILD_FINDMNT_FALSE='#'/BUILD_FINDMNT_FALSE=/g" ${S}/configure
    sed -i -e "s/BUILD_FINDMNT_FALSE=/BUILD_FINDMNT_FALSE='#'/g" ${S}/configure

    sed -i -e "s/BUILD_RENICE_TRUE='#'/BUILD_RENICE_TRUE=/g" ${S}/configure
    sed -i -e "s/BUILD_RENICE_FALSE='#'/BUILD_RENICE_FALSE=/g" ${S}/configure
    sed -i -e "s/BUILD_RENICE_FALSE=/BUILD_RENICE_FALSE='#'/g" ${S}/configure
}

