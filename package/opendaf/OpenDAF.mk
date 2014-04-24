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
OPENDAF_DEPENDENCIES = ACE boost netsnmp host-protobuf protobuf

# setup per-platform settings
# generic
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_GENERIC) += -DTARGET_PLATFORM=generic
# openbox
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_OPENBOX) += -DTARGET_PLATFORM=openbox
# rtu
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_RTU) += -DTARGET_PLATFORM=rtu
OPENDAF_DEPENDENCIES_$(BR2_PACKAGE_OPENDAF_PLATFORM_RTU) += i2c-tools

# setup configuration
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_PROD) += -DCONFIGURATION=prod
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_DEVEL) += -DCONFIGURATION=devel
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_SOLARWOLF) += -DCONFIGURATION=solarwolf

# append additional depndencies
OPENDAF_DEPENDENCIES += $(OPENDAF_DEPENDENCIES_y)
# setup configuration options
OPENDAF_CONF_OPT += $(OPENDAF_CONF_OPT_y)


define OPENDAF_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

define OPENDAF_INSTALL_PROFILE
	$(INSTALL) -D -m 0644 package/opendaf/opendaf_pythonpath.sh $(TARGET_DIR)/etc/profile.d/opendaf_pythonpath.sh
	$(INSTALL) -D -m 0644 package/opendaf/opendaf_vars.sh $(TARGET_DIR)/etc/profile.d/opendaf_vars.sh
endef

define OPENDAF_INSTALL_RUNIT_SERVICE
	$(INSTALL) -D -m 0755 package/opendaf/runit-run $(TARGET_DIR)/etc/service/opendaf/run
endef

# setup target installation hooks
OPENDAF_POST_INSTALL_TARGET_HOOKS_$(BR2_PACKAGE_OPENDAF_STARTUP_INITSCRIPT) += OPENDAF_INSTALL_INITSCRIPT
OPENDAF_POST_INSTALL_TARGET_HOOKS_$(BR2_PACKAGE_OPENDAF_STARTUP_RUNIT) += OPENDAF_INSTALL_RUNIT_SERVICE

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_PROFILE $(OPENDAF_POST_INSTALL_TARGET_HOOKS_y)

$(eval $(cmake-package))

