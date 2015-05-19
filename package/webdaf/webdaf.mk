#############################################################
#
# WEBDAF
#
#############################################################
WEBDAF_VERSION = 51bb45d
WEBDAF_SITE = http://merlin/packages/w
WEBDAF_SOURCE = webdaf-$(WEBDAF_VERSION).tar.bz2
WEBDAF_INSTALL_STAGING = NO
WEBDAF_INSTALL_TARGET = YES

define WEBDAF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/webdaf
	cp -rf $(@D)/* $(TARGET_DIR)/usr/share/webdaf/
	mkdir -p $(TARGET_DIR)/var/www/
	ln -sf /usr/share/webdaf/ $(TARGET_DIR)/var/www/webdaf
endef

$(eval $(generic-package))
