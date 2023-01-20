#!/bin/sh
sed -i '/custom_feeds/d' /etc/opkg/customfeeds.conf
echo "src/gz custom_feeds https://op.supes.top/packages/aarch64_cortex-a53/" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr-plus)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus  luci-compat luci-lib-ipkg
	;;
passwall)
	opkg install luci-i18n-base-zh-cn luci-app-passwall  luci-compat luci-lib-ipkg
	;;
openclash)
	wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/Install-Openclash-for-MT2500/install_clash.sh | sh
	;;
*)
	opkg install luci-i18n-base-zh-cn luci-app-passwall  luci-app-ssr-plus  luci-compat luci-lib-ipkg
	wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/Install-Openclash-for-MT2500/install_clash.sh | sh
	;;
esac

#luci-i18n-ssr-plus-zh-cn #luci-i18n-passwall-zh-cn