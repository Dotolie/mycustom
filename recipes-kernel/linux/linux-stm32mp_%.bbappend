FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-07-sdds.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-08-ipv6.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-09-nft.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-10-gpio.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-11-cpu.config"

SRC_URI += "file://${LINUX_VERSION}/fragment-07-sdds.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-08-ipv6.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-09-nft.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-10-gpio.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-11-cpu.config;subdir=fragments"

SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-07-sdds.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-08-ipv6.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-09-nft.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-10-gpio.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-11-cpu.config;subdir=fragments"

