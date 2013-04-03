#############################################################
#
# REMSERIAL
#
#############################################################
REMSERIAL_VERSION = 1.4
REMSERIAL_SITE = http://lpccomp.bc.ca/remserial
REMSERIAL_SOURCE = remserial-$(REMSERIAL_VERSION).tar.gz
REMSERIAL_INSTALL_STAGING = NO
REMSERIAL_INSTALL_TARGET = YES

define REMSERIAL_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define REMSERIAL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/remserial $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

