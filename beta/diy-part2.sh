#!/bin/bash


# 修改openwrt登陆地址,把下面的192.168.11.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
#sed -i "s/OpenWrt /ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/OpenWrt /星新课代表/g" package/lean/default-settings/files/zzz-default-settings

#删除原默认主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/small8/luci-theme-argon
rm -rf feeds/small8/luci-app-argon-config
#rm -rf feeds/luci/luci-theme-bootstrap
#rm -rf feeds/luci/luci-theme-material
#rm -rf feeds/luci/luci-theme-netgear
#rm -rf feeds/luci/luci-theme-ifit
#rm -rf feeds/luci/luci-theme-neobird

#下载主题luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/lean/luci-app-argon-config
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/lean/luci-theme-infinityfreedom
#git clone https://github.com/XXKDB/luci-theme-argon_armygreen.git package/lean/luci-theme-argon_armygreen
#git clone https://github.com/icaruspring/luci-theme-argon_armygreen.git package/lean/luci-theme-argon_armygreen
#git clone https://github.com/YL2209/luci-theme-ifit.git package/lean/luci-theme-ifit
#git clone https://github.com/thinktip/luci-theme-neobird.git package/lean/luci-theme-neobird

#修改背景图片
rm -rf package/lean/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/bg1.jpg package/lean/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

#取消原主题luci-theme-bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-edge/g' feeds/luci/collections/luci/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-neobird/g' feeds/luci/collections/luci/Makefile

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
#sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po

# 修改默认wifi名称ssid为OpenWrt
#sed -i 's/ssid=OpenWrt/ssid=OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码key为password
#sed -i 's/encryption=password/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#使用sed 在第四行后添加新字
#sed -e 120a\set wireless.default_radio${devidx}.key=password package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/set wireless.default_radio${devidx}.encryption=psk2/a\set wireless.default_radio${devidx}.key=password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
