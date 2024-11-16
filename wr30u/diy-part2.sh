#!/bin/bash
#
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate
sed -i "s/set network.globals.ula_prefix='auto'/set network.globals.ula_prefix='fd00::\/48'/g" package/base-files/files/bin/config_generate
sed -i 's/grep.*vermagic/cp $(TOPDIR)\/.vermagic $(LINUX_DIR)\/.vermagic/g' include/kernel-defaults.mk
#
sed -i 's/ssid=ImmortalWrt/ssid=OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/encryption=none/encryption=sae-mixed\n			set wireless.default_${name}.key=56781234/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
