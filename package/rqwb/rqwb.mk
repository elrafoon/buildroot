#############################################################
#
# rqwb
#
#############################################################
RQWB_VERSION = master
RQWB_SITE = ssh://merlin.swind.sk:29418/embedded-tools
RQWB_SITE_METHOD = git
RQWB_SUBDIR = rqwb
RQWB_DEPENDENCIES = qt
RQWB_INSTALL_STAGING = NO
RQWB_INSTALL_TARGET = YES

define RQWB_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 0755 package/rqwb/S92rqwb $(TARGET_DIR)/etc/init.d/S92rqwb
endef

define RQWB_INSTALL_RUNIT_SERVICE
	$(INSTALL) -D -m 0755 package/rqwb/runit-run $(TARGET_DIR)/etc/service/rqwb/run
endef

ifeq ($(BR2_PACKAGE_RQWB_STARTUP_INITSCRIPT),y)
	RQWB_POST_INSTALL_TARGET_HOOKS += RQWB_INSTALL_INITSCRIPT
else ifeq ($(BR2_PACKAGE_RQWB_STARTUP_RUNIT),y)
	RQWB_POST_INSTALL_TARGET_HOOKS += RQWB_INSTALL_RUNIT_SERVICE
endif

$(eval $(call cmake-package))

