# Base this image on st-image-core


# Remove resize helper
#CORE_IMAGE_EXTRA_INSTALL:remove += "resize-helper"
# Set ROOTFS partition size
#IMAGE_ROOTFS_MAXSIZE = "1024000"

# Set USERFS parition size
#USERFS_PARTITION_SIZE = "128000"



# Install TimeZone data
IMAGE_INSTALL:append = " tzdata"
IMAGE_INSTALL:append = "  ${@bb.utils.contains('MACHINE', 'stm32mp1-sdnl', 'rpmsg-sdb-mod', '', d)} "
IMAGE_INSTALL:append = "  ${@bb.utils.contains('MACHINE', 'stm32mp1-cpu', 'ethtool', '', d)} "
#IMAGE_INSTALL:append = " evtest "
#IMAGE_INSTALL:append = " zeromq cppzmq-dev"
#IMAGE_INSTALL:append = " ${@bb.utils.contains('MACHINE', 'stm32mp1-sdnl', 'usbotg-gadget-config', '', d)} "
IMAGE_INSTALL:append = " systemd-mount-partitions "
#IMAGE_INSTALL:append = " cpufrequtils "
#IMAGE_INSTALL:append = " mc htop "
IMAGE_INSTALL:append = "  ${@bb.utils.contains('MACHINE', 'stm32mp1-sdnl', 'sdds', '', d)} "
IMAGE_INSTALL:append = " lrzsz "
IMAGE_INSTALL:append = " bash "
IMAGE_INSTALL:append = " pam-plugin-faillock"
IMAGE_INSTALL:append = " ${@bb.utils.contains('MACHINE', 'stm32mp1-cpu', 'rscontrol', '', d)} "
IMAGE_INSTALL:append = " ${@bb.utils.contains('MACHINE', 'stm32mp1-sdnl', 'mscontrol', '', d)} "
IMAGE_INSTALL:append = " ${@bb.utils.contains_any('MACHINE', ['stm32mp1-cpu', 'stm32mp1-sdnl'], 'gpioint', '', d)} "


#IMAGE_INSTALL:remove = " iptables "
IMAGE_INSTALL:remove = " demo-application "
IMAGE_INSTALL:remove = " libdrm-tests "
IMAGE_INSTALL:remove = " libdrm2 "
IMAGE_INSTALL:remove = " curl "

IMAGE_INSTALL:remove = " packagegroup-framework-core-base "
IMAGE_INSTALL:remove = " packagegroup-framework-tools-base "
#IMAGE_INSTALL:remove = " packagegroup-base-extended "
IMAGE_INSTALL:remove = " iproute2 "
IMAGE_INSTALL:remove = " iptables "
#IMAGE_INSTALL:remove = " dbus "
#IMAGE_INSTALL:remove = " dbus-broker "
IMAGE_INSTALL:remove = " usbutils "
IMAGE_INSTALL:remove = " ncurses-terminfo-base libtinfo5 "
#IMAGE_INSTALL:remove = " ${@bb.utils.contains('MACHINE', 'stm32mp1-cpu', 'usbotg-gadget-config', '', d)} "
IMAGE_INSTALL:remove = " u-boot-fw-config-stm32m "

#IMAGE_INSTALL:append = " packagegroup-core-ssh-dropbear "
#IMAGE_INSTALL:append = " dropbear "
#IMAGE_INSTALL:append = " openssl "
#IMAGE_INSTALL:append = " openssl-bin "
IMAGE_INSTALL:append = " ${@bb.utils.contains('MACHINE', 'stm32mp1-cpu', 'openssl-engines', '', d)} "
IMAGE_INSTALL:append = " ${@bb.utils.contains('MACHINE', 'stm32mp1-cpu', 'libssl', '', d)} "
IMAGE_INSTALL:append = " libstdc++ "
#IMAGE_INSTALL:append = " ca-certificates "
#IMAGE_INSTALL:append = " cryptodev-module "
#IMAGE_INSTALL:remove = " apt "
#IMAGE_INSTALL:remove = " busybox-udhcpc "
#IMAGE_INSTALL:append = " sudo "


#PACKAGE_INSTALL:remove = " linux-examples-stm32mp1-userfs "
#PACKAGE_INSTALL:remove = " packagegroup-st-demo "
#PACKAGE_INSTALL:remove = " util-linux "
#PACKAGE_INSTALL:append = " m4projects-stm32mp1-userfs "
#PACKAGE_INSTALL:append = " slots-userfs "
#PACKAGE_INSTALL:append = " mscontrol-userfs "

#PACKAGE_INSTALL:append = " sdds-userfs "
#PACKAGE_INSTALL:remove = " packagegroup-core-ssh-dropbear "
#PACKAGE_INSTALL:append = " packagegroup-core-ssh-openssh "
#BAD_RECOMMENDS:append = " openssh-sftp-server perl-module-config-heavy dbus-1 dbus-common dbus-tools nettle kbd kbd-consolefonts kbd-keymaps "

do_image() {
    bbwarn "-----CORE_IMAGE_EXTRA_INSTALL=${CORE_IMAGE_EXTRA_INSTALL}";
    bbwarn "-----PACKAGE_INSTALL=${PACKAGE_INSTALL}";
    bbwarn "-----MACHINE_FEATURES=${MACHINE_FEATURES}";
    bbwarn "-----DISTRO_FEATURES=${DISTRO_FEATURES}";
    bbwarn "-----IMAGE_INSTALL=${IMAGE_INSTALL}";
    bbwarn "-----PACKAGE_EXCLUDE=${PACKAGE_EXCLUDE}";
}
