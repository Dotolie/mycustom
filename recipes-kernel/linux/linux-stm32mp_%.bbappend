FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-07-sdds.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-08-ipv6.config"
KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-09-nft.config"


SRC_URI += "file://${LINUX_VERSION}/fragment-07-sdds.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-08-ipv6.config;subdir=fragments"
SRC_URI += "file://${LINUX_VERSION}/fragment-09-nft.config;subdir=fragments"


SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-07-sdds.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-08-ipv6.config;subdir=fragments"
SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-09-nft.config;subdir=fragments"
