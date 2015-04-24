################################################################################
#
# network-manager-openvpn
#
################################################################################

NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 0.9
NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10.0
NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
NETWORK_MANAGER_OPENVPN_SITE = http://ftp.gnome.org/pub/gnome/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
NETWORK_MANAGER_OPENVPN_DEPENDENCIES=network-manager openvpn
NETWORK_MANAGER_OPENVPN_CONF_OPT = --without-gnome

$(eval $(autotools-package))

