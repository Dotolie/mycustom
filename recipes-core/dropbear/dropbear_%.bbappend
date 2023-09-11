
do_install:append(){
    sed -i 's/-w/-I 600/g' ${D}/etc/default/dropbear
}
