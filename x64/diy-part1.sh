#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git openwrt-vlmcsd https://github.com/cokebar/openwrt-vlmcsd.git' >>feeds.conf.default
# echo 'src-git luci-app-vlmcsd https://github.com/cokebar/luci-app-vlmcsd.git' >>feeds.conf.default
# git clone https://github.com/cokebar/openwrt-vlmcsd.git package/vlmcsd
# git clone https://github.com/cokebar/luci-app-vlmcsd.git package/luci-app-vlmcsd
git clone https://github.com/siwind/openwrt-vlmcsd.git package/vlmcsd
git clone https://github.com/siwind/luci-app-vlmcsd.git package/luci-app-vlmcsd