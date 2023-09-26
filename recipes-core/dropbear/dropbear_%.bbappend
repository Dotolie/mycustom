
do_install:append(){
    sed -i 's/-w/-I 300/g' ${D}/etc/default/dropbear
}
