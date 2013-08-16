#############################################################
#
# tripot
#
#############################################################
TRIPOT_VERSION = master
TRIPOT_SITE = git://merlin.swind.sk/embedded-tools
TRIPOT_SITE_METHOD = git
TRIPOT_SUBDIR = tripot
TRIPOT_DEPENDENCIES = qt
TRIPOT_INSTALL_STAGING = NO
TRIPOT_INSTALL_TARGET = YES
TRIPOT_CONF_OPT += -DSERIAL_DEVICE1=/dev/${BR2_PACKAGE_TRIPOT_DEVICE1} -DSERIAL_DEVICE2=/dev/${BR2_PACKAGE_TRIPOT_DEVICE2} 


define TRIPOT_INITSCRIPT
        $(INSTALL) -D -m 0755 $(TRIPOT_SRCDIR)/initscript-tripot $(TARGET_DIR)/etc/init.d/S90tripot
endef

TRIPOT_POST_INSTALL_TARGET_HOOKS += TRIPOT_INITSCRIPT

$(eval $(call cmake-package))

