#############################################################
#
# bluecore
#
#############################################################
BLUECORE_VERSION = master
BLUECORE_SITE = git://merlin.swind.sk/embedded-tools.git
BLUECORE_SITE_METHOD = git
BLUECORE_SUBDIR = bluecore
BLUECORE_INSTALL_STAGING = NO
BLUECORE_INSTALL_TARGET = YES

ifeq ($(BR2_PACKAGE_BLUECORE_FLOW_NONE),y)
BLUECORE_FLOW=noflow
else
BLUECORE_FLOW=flow
endif

BLUECORE_SRCDIR = $(@D)/$(BLUECORE_SUBDIR)
BLUECORE_KEYFILE = $(call qstrip,$(BR2_PACKAGE_BLUECORE_KEYFILE))

define BLUECORE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BLUECORE_SRCDIR)/bluecore_bootstrap $(TARGET_DIR)/etc/init.d/S10bluecore_bootstrap
	$(INSTALL) -D -m 0755 $(BLUECORE_SRCDIR)/bluecore_attach $(TARGET_DIR)/etc/init.d/S11bluecore_attach
	$(INSTALL) -D -m 0644 $(BLUECORE_KEYFILE) $(TARGET_DIR)/etc/bluecore/key.psr
	echo BC_GPIO_RESET=$(BR2_PACKAGE_BLUECORE_RESET_GPIO) >$(TARGET_DIR)/etc/bluecore/bluecore.conf
	echo BC_RESET_ACT=$(BR2_PACKAGE_BLUECORE_RESET_ACT) >>$(TARGET_DIR)/etc/bluecore/bluecore.conf
	echo BC_RESET_HOLD_TIME=$(BR2_PACKAGE_BLUECORE_RESET_HOLD_TIME) >>$(TARGET_DIR)/etc/bluecore/bluecore.conf
	echo BC_TTY=/dev/$(BR2_PACKAGE_BLUECORE_TTY) >>$(TARGET_DIR)/etc/bluecore/bluecore.conf
	echo BC_BAUDRATE=$(BR2_PACKAGE_BLUECORE_BAUDRATE) >>$(TARGET_DIR)/etc/bluecore/bluecore.conf
	echo BC_FLOW=$(BLUECORE_FLOW) >>$(TARGET_DIR)/etc/bluecore/bluecore.conf
endef

$(eval $(generic-package))

