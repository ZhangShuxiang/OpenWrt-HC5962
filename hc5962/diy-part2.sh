#!/bin/bash
#
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
# sed -i "s/hostname='OpenWrt'/hostname='HiWifi'/g" package/base-files/files/bin/config_generate
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.ntsc.ac.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/set system.@system\[-1\].timezone='UTC'/set system.@system\[-1\].timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/set system.@system\[-1\].timezone/i\		set system.@system\[-1\].zonename='Asia\/Shanghai'" package/base-files/files/bin/config_generate
sed -i "s/set network.globals.ula_prefix='auto'/set network.globals.ula_prefix='fd00::\/48'/g" package/base-files/files/bin/config_generate
sed -i '/list listen_http	0.0.0.0:80/a\	list listen_http	0.0.0.0:8000' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_http	\[::\]:80/a\	list listen_http	\[::\]:8000' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_https	0.0.0.0:443/a\	list listen_https	0.0.0.0:8443' package/network/services/uhttpd/files/uhttpd.config
sed -i '/list listen_https	\[::\]:443/a\	list listen_https	\[::\]:8443' package/network/services/uhttpd/files/uhttpd.config
echo 9c242f353867f49a96054ff8c9f2c460>.vermagic
sed -i 's/grep.*vermagic/cp $(TOPDIR)\/.vermagic $(LINUX_DIR)\/.vermagic/g' include/kernel-defaults.mk
#
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/encryption=none/encryption=sae-mixed\n			set wireless.default_${name}.key=56781234/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

sed -i '/option disable_ipv6/a\	option flow_offloading_hw	1' package/network/config/firewall/files/firewall.config
sed -i '/option disable_ipv6/a\	option flow_offloading	1' package/network/config/firewall/files/firewall.config
