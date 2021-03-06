#############################################################
#
# OPENDAF_APPCONF
#
#############################################################
OPENDAF_APPCONF_VERSION = $(BR2_PACKAGE_OPENDAF_APPCONF_NAME)
OPENDAF_APPCONF_SITE_METHOD = git
OPENDAF_APPCONF_SITE = gitolite@merlin.swind.sk:OpenDAF-AppConf.git
OPENDAF_APPCONF_INSTALL_STAGING = NO
OPENDAF_APPCONF_INSTALL_TARGET = YES
OPENDAF_APPCONF_DEPENDENCIES = opendaf

define OPENDAF_APPCONF_INSTALL_DEFAULT
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install;
endef

define OPENDAF_APPCONF_INSTALL_FIRMWARE
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr/share/opendaf-appconf/ install;
endef

OPENDAF_APPCONF_INSTALL_TARGET_CMDS += $(OPENDAF_APPCONF_INSTALL_DEFAULT)

ifeq ($(BR2_PACKAGE_OPENDAF_APPCONF_BUILTIN_FW),y)
	OPENDAF_APPCONF_INSTALL_TARGET_CMDS += $(OPENDAF_APPCONF_INSTALL_FIRMWARE)
endif

$(eval $(generic-package))

