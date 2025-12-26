# This is free software, licensed under the Apache License, Version 2.0

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for frp client
LUCI_DEPENDS:=+luci-base +frpc

PKG_LICENSE:=Apache-2.0

include ../../feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature

define Package/$(PKG_NAME)/postinst
#!/bin/sh
chmod 755 "$${IPKG_INSTROOT}/etc/init.d/frpc" >/dev/null 2>&1
ln -sf "../init.d/frpc" \
	"$${IPKG_INSTROOT}/etc/rc.d/S99frpc" >/dev/null 2>&1
exit 0
endef
