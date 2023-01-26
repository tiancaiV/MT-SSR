#!/bin/sh
sed -i '/custom_feeds/d' /etc/opkg/customfeeds.conf
echo "src/gz custom_feeds https://op.supes.top/packages/aarch64_cortex-a53" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus  luci-compat luci-lib-ipkg luci-i18n-base-zh-cn
	;;

common)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg luci-i18n-aliyundrive-webdav-zh-cn luci-app-serverchan luci-i18n-aliddns-zh-cn luci-i18n-vlmcsd-zh-cn luci-i18n-upnp-zh-cn luci-i18n-smartdns-zh-cn luci-i18n-ramfree-zh-cn luci-i18n-diskman-zh-cn
	;;
*)
	opkg install luci-i18n-base-zh-cn  luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/Install-Openclash-for-MT2500/install.sh | sh
	;;
esac


#wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/MT-SSR/install.sh | sh -s ssr
