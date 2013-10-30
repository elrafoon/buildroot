#############################################################
#
# OPENDAF
#
#############################################################
OPENDAF_VERSION = master
OPENDAF_SITE_METHOD = git
OPENDAF_SITE = ssh://merlin.swind.sk:29418/OpenDAF.git
OPENDAF_INSTALL_STAGING = NO
OPENDAF_INSTALL_TARGET = YES
OPENDAF_DEPENDENCIES = ACE boost netsnmp

ifeq ($(BR2_PACKAGE_OPENDAF_DEVEL),y)
	OPENDAF_INSTALL_DEVEL_CFG=ON
else
	OPENDAF_INSTALL_DEVEL_CFG=OFF
endif

OPENDAF_CONF_OPT += -DINSTALL_DEVEL_CFG=$(OPENDAF_INSTALL_DEVEL_CFG) -DTARGET_PLATFORM=$(BR2_PACKAGE_OPENDAF_PLATFORM)

define OPENDAF_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

define OPENDAF_INSTALL_PROFILE
	$(INSTALL) -D -m 0644 package/opendaf/opendaf_pythonpath.sh $(TARGET_DIR)/etc/profile.d/opendaf_pythonpath.sh
endef

define OPENDAF_INSTALL_RUNIT_SERVICE
	$(INSTALL) -D -m 0755 package/opendaf/runit-run $(TARGET_DIR)/etc/service/opendaf/run
endef

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_PROFILE
ifeq ($(BR2_PACKAGE_OPENDAF_STARTUP_INITSCRIPT),y)
	OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_INITSCRIPT
else ifeq ($(BR2_PACKAGE_OPENDAF_STARTUP_RUNIT),y)
	OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_RUNIT_SERVICE
endif

$(eval $(cmake-package))

