#############################################################
#
# FWUPDATE
#
#############################################################
FWUPDATE_VERSION = master
FWUPDATE_SITE_METHOD = git
FWUPDATE_SITE = gitolite@merlin.swind.sk:embedded-tools
FWUPDATE_SUBDIR = fwupdate
FWUPDATE_INSTALL_STAGING = NO
FWUPDATE_INSTALL_TARGET = YES

define FWUPDATE_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/$(FWUPDATE_SUBDIR) DESTDIR=$(TARGET_DIR) INSTALL=$(INSTALL) install
endef

define FWUPDATE_UNINSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/$(FWUPDATE_SUBDIR) DESTDIR=$(TARGET_DIR) INSTALL=$(INSTALL) uninstalla
	rm -f $(TARGET_DIR)/etc/init.d/S99fwupdate
endef

define FWUPDATE_INSTALL_MARKREADY_INITSCRIPT
	$(INSTALL) -D -m 0755 package/fwupdate/S99fwupdate_markready $(TARGET_DIR)/etc/init.d/S99fwupdate_markready
endef

ifeq ($(BR2_PACKAGE_FWUPDATE_INSTALL_MARKREADY_INITSCRIPT),y)
	FWUPDATE_POST_INSTALL_TARGET_HOOKS += FWUPDATE_INSTALL_MARKREADY_INITSCRIPT
endif

$(eval $(generic-package))

