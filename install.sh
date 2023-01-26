#!/bin/sh
sed -i '/custom_feeds/d' /etc/opkg/customfeeds.conf
echo "src/gz custom_feeds https://op.supes.top/packages/aarch64_cortex-a53" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr-plus)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	;;
passwall)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-compat luci-lib-ipkg
	;;
openclash)
	#opkg install dnsmasq-full --download-only && opkg remove dnsmasq && opkg install dnsmasq-full --cache . && rm *.ipk

	#opkg install wget-ssl coreutils-nohup bash iptables curl ca-certificates ipset ip-full iptables-mod-tproxy iptables-mod-extra libcap libcap-bin ruby ruby-yaml kmod-tun luci-compat libcurl4

	#opkg install luci-app-openclash
	
	wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/Install-Openclash-for-MT2500/install.sh | sh
	
	;;
common)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg luci-i18n-aliyundrive-webdav-zh-cn luci-app-serverchan luci-i18n-aliddns-zh-cn luci-i18n-vlmcsd-zh-cn luci-i18n-upnp-zh-cn luci-i18n-smartdns-zh-cn luci-i18n-ramfree-zh-cn luci-i18n-diskman-zh-cn
	;;
*)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/Install-Openclash-for-MT2500/install.sh | sh
	;;
esac


#wget -qO- https://cdn.jsdelivr.net/gh/tiancaiV/MT-SSR/install.sh | sh -s ssr-plus
