################################################################################
#
# iptables-firewall
#
################################################################################

IPTABLES_FIREWALL_VERSION = 1
IPTABLES_FIREWALL_SITE = package/iptables-firewall
IPTABLES_FIREWALL_SITE_METHOD = local

define IPTABLES_FIREWALL_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(IPTABLES_FIREWALL_SITE)/iptables-firewall.service \
		$(TARGET_DIR)/etc/systemd/system/iptables-firewall.service
	$(INSTALL) -D -m 644 $(IPTABLES_FIREWALL_SITE)/default-rules \
		$(TARGET_DIR)/usr/share/iptables-firewall/default-rules

	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
	$(INSTALL) -d $(TARGET_DIR)/var/lib/iptables-firewall

	ln -fs ../iptables-firewall.service \
		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/iptables-firewall.service
endef

$(eval $(generic-package))

