CSR_WIFI_USERSPACE_VERSION = 5.1.0
CSR_WIFI_USERSPACE_SOURCE = csr-wifi-userspace-$(CSR_WIFI_KMOD_VERSION).tgz
CSR_WIFI_USERSPACE_SITE = ftp://merlin.swind.sk/buildroot-packages
CSR_WIFI_USERSPACE_INSTALL_STAGING = NO
CSR_WIFI_USERSPACE_INSTALL_TARGET = YES

define CSR_WIFI_USERSPACE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/firmware/unifi-sdio-0
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/firmware/unifi-sdio-1
	$(INSTALL) -D -m 0644 $(@D)/lib/firmware/unifi-sdio-0/* -t $(TARGET_DIR)/lib/firmware/unifi-sdio-0
	$(INSTALL) -D -m 0644 $(@D)/lib/firmware/unifi-sdio-1/* -t $(TARGET_DIR)/lib/firmware/unifi-sdio-1
	$(INSTALL) -D -m 0755 $(@D)/usr/sbin/unifi_config $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0755 $(@D)/usr/sbin/unifi_helper $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0755 $(@D)/usr/sbin/unififw $(TARGET_DIR)/usr/sbin
endef

$(eval $(generic-package))

