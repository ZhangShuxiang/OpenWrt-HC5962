#!/bin/bash
#
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
# sed -i "s/hostname='OpenWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/set system.@system\[-1\].timezone='UTC'/set system.@system\[-1\].timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/set system.@system\[-1\].timezone/i\		set system.@system\[-1\].zonename='Asia\/Shanghai'" package/base-files/files/bin/config_generate
sed -i "s/set network.globals.ula_prefix='auto'/set network.globals.ula_prefix='fd00::\/48'/g" package/base-files/files/bin/config_generate
#
sed -i 's/REJECT/ACCEPT/g' package/network/config/firewall/files/firewall.config
sed -i 's/	option masq		1/	option masq		0/g' package/network/config/firewall/files/firewall.config
sed -i 's/	option mtu_fix		1/	option mtu_fix		0/g' package/network/config/firewall/files/firewall.config
# sed -i 's/static/dhcp/g' package/base-files/files/lib/functions/uci-defaults.sh
sed -i 's/ucidef_set_interface \"lan\"/ucidef_set_interface \"wan\"/g' package/base-files/files/lib/functions/uci-defaults.sh
