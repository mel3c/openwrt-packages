include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-argond-config
PKG_VERSION:=0.9
PKG_RELEASE:=20220424

PKG_MAINTAINER:=jerrykuku <jerrykuku@qq.com>

LUCI_TITLE:=LuCI page for Argond Config
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+luci-compat +luci-lib-ipkg +luci-theme-argond

define Package/$(PKG_NAME)/conffiles
/etc/config/argond
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
